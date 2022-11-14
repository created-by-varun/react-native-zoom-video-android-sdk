#import <React/RCTConvert.h>
#import "RNZoomVideoSdk.h"
#import "RCTConvert+RNZoomVideoSdk.h"
#import "RNZoomVideoSdkUser.h"
#import "RNZoomVideoSdkChatMessage.h"
#import "RNZoomVideoSdkLiveTranscriptionLanguage.h"

@implementation RNZoomVideoSdk

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

-(NSArray<NSString *>*)supportedEvents
{
    return @[
        @"onSessionJoin",
        @"onSessionLeave",
        @"onUserJoin",
        @"onUserLeave",
        @"onUserVideoStatusChanged",
        @"onUserAudioStatusChanged",
        @"onUserShareStatusChanged",
        @"onLiveStreamStatusChanged",
        @"onChatNewMessageNotify",
        @"onUserNameChanged",
        @"onUserHostChanged",
        @"onUserManagerChanged",
        @"onUserActiveAudioChanged",
        @"onSessionNeedPassword",
        @"onSessionPasswordWrong",
        @"onError",
        @"getSdkVersion",
        @"isInSession",
        @"onCmdChannelConnectResult",
        @"onCommandReceived",
        @"onCloudRecordingStatus",
        @"onHostAskUnmute",
        @"onInviteByPhoneStatus",
        @"onChatDeleteMessageNotify",
        @"onLiveTranscriptionStatus",
        @"onLiveTranscriptionMsgReceived",
        @"onLiveTranscriptionMsgError",
        @"onMultiCameraStreamStatusChanged",
        @"onRequireSystemPermission",
        @"onProxySettingNotification",
        @"onSSLCertVerifiedFailNotification",
    ];
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(initSdk,
                 initSdkWithConfig: (NSDictionary *)config
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKInitParams *initParams = [[ZoomVideoSDKInitParams alloc] init];

    initParams.domain = [config valueForKey:@"domain"];
    initParams.enableLog = [[config objectForKey:@"enableLog"] boolValue];
    initParams.logFilePrefix = [config valueForKey:@"logFilePrefix"];
    initParams.appGroupId = [config valueForKey:@"appGroupId"];

    initParams.videoRawdataMemoryMode = [RCTConvert ZoomVideoSDKRawDataMemoryMode: [config objectForKey:@"videoRawDataMemoryMode"]];
    initParams.audioRawdataMemoryMode = [RCTConvert ZoomVideoSDKRawDataMemoryMode: [config objectForKey:@"audioRawDataMemoryMode"]];
    initParams.shareRawdataMemoryMode = [RCTConvert ZoomVideoSDKRawDataMemoryMode: [config objectForKey:@"shareRawDataMemoryMode"]];
    NSString *speakerFilePath = [config valueForKey:@"speakerFilePath"];
    if (speakerFilePath.length != 0) {
        ZoomVideoSDKExtendParams *extendParams = [[ZoomVideoSDKExtendParams alloc] init];
        extendParams.speakerTestFilePath = speakerFilePath;
        initParams.extendParam = extendParams;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        ZoomVideoSDKError ret = [[ZoomVideoSDK shareInstance] initialize:initParams];

        switch (ret) {
        case Errors_Success:
            NSLog(@"SDK initialized successfully");
            resolve(@"SDK initialized successfully");
            break;
        default:
            NSLog(@"SDK failed to initialize with error code: %lu", (unsigned long)ret);
            reject(@"sdkinit_failed", [[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @(ret)], nil);
            break;
        }
    });

    // Setup My Video Rotation. NOTE: We may eventually want to make this configurable.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationChangeNotification:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

RCT_REMAP_METHOD(joinSession,
                 joinSessionWithConfig: (NSDictionary *)config
                 withResolver: (RCTPromiseResolveBlock)resolve
                 withRejecter: (RCTPromiseRejectBlock)reject)
{
    NSString* token = [config valueForKey:@"token"];
    NSString* sessionName = [config valueForKey:@"sessionName"];
    NSString* sessionPassword = [config valueForKey:@"sessionPassword"];
    NSString* userName = [config valueForKey:@"userName"];
    NSInteger* sessionIdleTimeoutMins = [[config valueForKey:@"sessionIdleTimeoutMins"] intValue];

    ZoomVideoSDKAudioOptions *audioOption = [ZoomVideoSDKAudioOptions new];
    NSDictionary* audioOptionConfig = [config valueForKey:@"audioOptions"];
    audioOption.connect     = [[audioOptionConfig valueForKey:@"connect"] boolValue];
    audioOption.mute        = [[audioOptionConfig valueForKey:@"mute"] boolValue];

    ZoomVideoSDKVideoOptions *videoOption = [ZoomVideoSDKVideoOptions new];
    NSDictionary* videoOptionConfig = [config valueForKey:@"videoOptions"];
    videoOption.localVideoOn = [[videoOptionConfig valueForKey:@"localVideoOn"] boolValue];

    ZoomVideoSDKSessionContext *sessionContext = [[ZoomVideoSDKSessionContext alloc] init];
    // Ensure that you do not hard code JWT or any other confidential credentials in your production app.
    sessionContext.token = token;
    sessionContext.sessionName = sessionName;
    sessionContext.sessionPassword = sessionPassword;
    sessionContext.userName = userName;
    sessionContext.audioOption = audioOption;
    sessionContext.videoOption = videoOption;
    sessionContext.sessionIdleTimeoutMins = sessionIdleTimeoutMins;

    [ZoomVideoSDK shareInstance].delegate = self;

    dispatch_async(dispatch_get_main_queue(), ^{
        ZoomVideoSDKSession *session = [[ZoomVideoSDK shareInstance] joinSession:sessionContext];

        if (session) {
            // Session joined successfully.
            resolve(nil);
        } else {
            reject(@"joinSession_failure", @"Join Session failed", nil);
        }
    });
}

RCT_EXPORT_METHOD(leaveSession: (BOOL)shouldEndSession
                  withResolver: (RCTPromiseResolveBlock)resolve
                  withRejecter: (RCTPromiseRejectBlock)reject)
{
    [ZoomVideoSDK shareInstance].delegate = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[ZoomVideoSDK shareInstance] leaveSession: shouldEndSession])]);
    });
}

RCT_EXPORT_METHOD(getSdkVersion: (RCTPromiseResolveBlock)resolve
                 withRejecter: (RCTPromiseRejectBlock)reject)
{
    resolve([[ZoomVideoSDK shareInstance] getSDKVersion]);
}

RCT_EXPORT_METHOD(isInSession: (RCTPromiseResolveBlock)resolve
                 withRejecter: (RCTPromiseRejectBlock)reject)
{
    resolve(@([[ZoomVideoSDK shareInstance] isInSession]));
}

- (void) onError:(ZoomVideoSDKError)ErrorType detail:(NSInteger)details {
    switch (ErrorType) {
        case Errors_Success:
            // Your ZoomVideoSDK operation was successful.
            NSLog(@"Success");
            break;
        default:
            // Your ZoomVideoSDK operation raised an error.
            // Refer to error code documentation.
            NSLog(@"Error %lu %ld", (unsigned long)ErrorType, (long)details);
            break;
    }

    [self sendEventWithName:@"onError" body:@{ @"errorType": [[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @(ErrorType)], @"details": @(details) }];
}

- (void)onSessionJoin {
    [self sendEventWithName:@"onSessionJoin" body: @{ @"mySelf": [RNZoomVideoSdkUser mapUser: [[[ZoomVideoSDK shareInstance] getSession] getMySelf]] }];

    // Set initial video orientation
    [self onDeviceOrientationChangeNotification:nil];
}

- (void)onSessionLeave {
    [self sendEventWithName:@"onSessionLeave" body: nil];
}

- (void)onUserJoin:(ZoomVideoSDKUserHelper *)helper users:(NSArray<ZoomVideoSDKUser *> *)userArray {
    [self sendEventWithName:@"onUserJoin" body: @{@"joinedUsers": [RNZoomVideoSdkUser mapUserArray:userArray], @"remoteUsers": [RNZoomVideoSdkUser mapUserArray: [[[ZoomVideoSDK shareInstance] getSession] getRemoteUsers]] }];
}

- (void)onUserLeave:(ZoomVideoSDKUserHelper *)helper users:(NSArray<ZoomVideoSDKUser *> *)userArray {
    [self sendEventWithName:@"onUserLeave" body: @{@"leftUsers": [RNZoomVideoSdkUser mapUserArray:userArray], @"remoteUsers": [RNZoomVideoSdkUser mapUserArray: [[[ZoomVideoSDK shareInstance] getSession] getRemoteUsers]] }];
}

- (void)onUserVideoStatusChanged:(ZoomVideoSDKVideoHelper *)helper user:(NSArray<ZoomVideoSDKUser *> *)userArray {
    [self sendEventWithName:@"onUserVideoStatusChanged" body:@{@"changedUsers": [RNZoomVideoSdkUser mapUserArray: userArray]}];
}

- (void)onUserAudioStatusChanged:(ZoomVideoSDKAudioHelper *)helper user:(NSArray<ZoomVideoSDKUser *> *)userArray {
    [self sendEventWithName:@"onUserAudioStatusChanged" body:@{@"changedUsers": [RNZoomVideoSdkUser mapUserArray: userArray]}];
}

- (void)onUserShareStatusChanged:(ZoomVideoSDKShareHelper *)helper user:(ZoomVideoSDKUser *)user status:(ZoomVideoSDKReceiveSharingStatus)status {
    [self sendEventWithName:@"onUserShareStatusChanged" body:@{
        @"user": [RNZoomVideoSdkUser mapUser: user],
        @"status": [[RCTConvert ZoomVideoSDKReceiveSharingStatusValuesReversed] objectForKey: @(status)]
    }];
}

- (void)onLiveStreamStatusChanged:(ZoomVideoSDKLiveStreamHelper *)helper status:(ZoomVideoSDKLiveStreamStatus)status {
    [self sendEventWithName:@"onLiveStreamStatusChanged" body:@{
        @"status": [[RCTConvert ZoomVideoSDKLiveStreamStatusValuesReversed ] objectForKey: @(status)]
    }];
}

- (void)onChatNewMessageNotify:(ZoomVideoSDKChatHelper *)helper message:(ZoomVideoSDKChatMessage *)chatMessage {
    [self sendEventWithName:@"onChatNewMessageNotify" body:[RNZoomVideoSdkChatMessage mapChatMessage:chatMessage]];
}

- (void)onUserNameChanged:(ZoomVideoSDKUser *)user {
    [self sendEventWithName:@"onUserNameChanged" body:@{@"changedUser": [RNZoomVideoSdkUser mapUser: user]}];
}

- (void)onUserHostChanged:(ZoomVideoSDKUserHelper *)helper user:(ZoomVideoSDKUser *)user {
    [self sendEventWithName:@"onUserHostChanged" body:@{@"changedUser": [RNZoomVideoSdkUser mapUser: user]}];
}

- (void)onUserManagerChanged:(ZoomVideoSDKUser *)user {
    [self sendEventWithName:@"onUserManagerChanged" body:@{@"changedUser": [RNZoomVideoSdkUser mapUser: user]}];
}

- (void)onUserActiveAudioChanged:(ZoomVideoSDKUserHelper *)helper users:(NSArray<ZoomVideoSDKUser *> *)userArray {
    [self sendEventWithName:@"onUserActiveAudioChanged" body:@{@"changedUsers": [RNZoomVideoSdkUser mapUserArray: userArray]}];
}

- (void)onSessionNeedPassword:(ZoomVideoSDKError (^)(NSString *, BOOL))completion {
    NSString *userInput = NULL;
    Boolean cancelJoinSession = YES;
    if (completion) {
        completion(userInput, cancelJoinSession);
    }

    [self sendEventWithName:@"onSessionNeedPassword" body:nil];
}

- (void)onSessionPasswordWrong:(ZoomVideoSDKError (^)(NSString *, BOOL))completion {
    NSString *userInput = NULL;
    Boolean cancelJoinSession = YES;
    if (completion) {
        completion(userInput, cancelJoinSession);
    }

    [self sendEventWithName:@"onSessionPasswordWrong" body:nil];
}

- (void)onCmdChannelConnectResult:(BOOL)success {
    [self sendEventWithName:@"onCmdChannelConnectResult" body:@{@"success": [NSNumber numberWithBool:success]}];
}

- (void)onCommandReceived:(NSString * _Nullable)commandContent sendUser:(ZoomVideoSDKUser * _Nullable)sendUser {
    [self sendEventWithName:@"onCommandReceived" body:@{@"sender": [NSNumber numberWithInteger:[sendUser getUserID]], @"command": commandContent}];
}

- (void)onCloudRecordingStatus:(ZoomVideoSDKRecordingStatus)status {
    [self sendEventWithName:@"onCloudRecordingStatus" body:@{
        @"status": [[RCTConvert ZoomVideoSDKRecordingStatusValuesReversed] objectForKey: @(status)]
    }];
}

- (void)onHostAskUnmute {
    [self sendEventWithName:@"onHostAskUnmute" body: nil];
}

- (void)onInviteByPhoneStatus:(ZoomVideoSDKPhoneStatus)status failReason:(ZoomVideoSDKPhoneFailedReason)reason {
    [self sendEventWithName:@"onInviteByPhoneStatus" body:@{
        @"status": [[RCTConvert ZoomVideoSDKPhoneStatusValuesReversed] objectForKey: @(status)],
        @"reason": [[RCTConvert ZoomVideoSDKPhoneFailedReasonValuesReversed] objectForKey: @(reason)]
    }];
}

- (void)onMultiCameraStreamStatusChanged:(ZoomVideoSDKMultiCameraStreamStatus)status parentUser:(ZoomVideoSDKUser *_Nullable)user videoPipe:(ZoomVideoSDKRawDataPipe *_Nullable)videoPipe {

}

- (void)onMultiCameraStreamStatusChanged:(ZoomVideoSDKMultiCameraStreamStatus)status parentUser:(ZoomVideoSDKUser *_Nullable)user videoCanvas:(ZoomVideoSDKVideoCanvas *_Nullable)videoCanvas {
    [self sendEventWithName:@"onMultiCameraStreamStatusChanged" body:@{
        @"status": [[RCTConvert ZoomVideoSDKMultiCameraStreamStatusValuesReversed] objectForKey: @(status)],
        @"user": [RNZoomVideoSdkUser mapUser: user]
    }];
}

- (void)onChatMsgDeleteNotification:(ZoomVideoSDKChatHelper * _Nullable)helper messageID:(NSString * __nonnull)msgID deleteBy:(ZoomVideoSDKChatMsgDeleteBy) type {
    [self sendEventWithName:@"onChatDeleteMessageNotify" body:@{
            @"msgID": msgID,
            @"type": [[RCTConvert ZoomVideoSDKChatMsgDeleteByValuesReversed] objectForKey: @(type)]
    }];
}

- (void)onLiveTranscriptionStatus:(ZoomVideoSDKLiveTranscriptionStatus)status {
    [self sendEventWithName:@"onLiveTranscriptionStatus" body:@{
            @"status": [[RCTConvert ZoomVideoSDKLiveTranscriptionStatusValuesReversed] objectForKey: @(status)]
    }];
}

- (void)onLiveTranscriptionMsgReceived:(NSString *)ltMsg user:(ZoomVideoSDKUser *)user type:(ZoomVideoSDKLiveTranscriptionOperationType)type {
    [self sendEventWithName:@"onLiveTranscriptionMsgReceived" body:@{
            @"ltMsg": ltMsg,
            @"type": [[RCTConvert ZoomVideoSDKLiveTranscriptionOperationTypeValuesReversed] objectForKey: @(type)],
            @"user": [RNZoomVideoSdkUser mapUser: user]
    }];
}

- (void)onLiveTranscriptionMsgError:(ZoomVideoSDKLiveTranscriptionLanguage *)spokenLanguage transLanguage:(ZoomVideoSDKLiveTranscriptionLanguage *)transcriptLanguage {
    [self sendEventWithName:@"onLiveTranscriptionMsgError" body:@{
            @"spokenLanguage": [RNZoomVideoSdkLiveTranscriptionLanguage mapLanguage: spokenLanguage],
            @"transcriptLanguage": [RNZoomVideoSdkLiveTranscriptionLanguage mapLanguage: transcriptLanguage]
    }];
}

- (void)onRequireSystemPermission:(ZoomVideoSDKSystemPermissionType)permissionType {
    [self sendEventWithName:@"onRequireSystemPermission" body:@{
            @"permissionType": [[RCTConvert ZoomVideoSDKSystemPermissionTypeValuesReversed] objectForKey: @(permissionType)]
    }];
}

// OS Event Listeners

- (void)onDeviceOrientationChangeNotification:(NSNotification *)aNotification {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if ((orientation == UIDeviceOrientationUnknown) || (orientation == UIDeviceOrientationFaceUp) || (orientation == UIDeviceOrientationFaceDown))
    {
        orientation = (UIDeviceOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [[[ZoomVideoSDK shareInstance] getVideoHelper] rotateMyVideo:orientation];
    });
}

- (void)onProxySettingNotification:(ZoomVideoSDKProxySettingHandler *_Nonnull)handler {
    [self sendEventWithName:@"onProxySettingNotification" body: @{
        @"proxyHost": [handler proxyHost],
        @"proxyPort": [NSNumber numberWithInteger:[handler proxyPort]],
        @"proxyDescription": [handler proxyDescription]
    }];
}

- (void)onSSLCertVerifiedFailNotification:(ZoomVideoSDKSSLCertificateInfo *_Nonnull)handler {
    [self sendEventWithName:@"onSSLCertVerifiedFailNotification" body: @{
        @"certIssuedTo": [handler certIssuedTo],
        @"certIssuedBy": [handler certIssuedBy],
        @"certSerialNum": [handler certSerialNum],
        @"certFingerprint": [handler certFingerprint]
    }];
}

@end
