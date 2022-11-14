//
//  SampleHandler.m
//  ScreenShare
//
//  Created by Richard Evans on 6/16/21.
//

#import "SampleHandler.h"
#import <ZoomVideoSDKScreenShare/ZoomVideoSDKScreenShareService.h>

@interface SampleHandler () <ZoomVideoSDKScreenShareServiceDelegate>

@property (strong, nonatomic) ZoomVideoSDKScreenShareService * screenShareService;

@end

@implementation SampleHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Create an instance of ZoomVideoSDKScreenShareService to handle broadcast actions.
        ZoomVideoSDKScreenShareServiceInitParams *params = [[ZoomVideoSDKScreenShareServiceInitParams alloc] init];

        // Provide your app group id from your Apple Developer account.
        params.appGroupId = @"group.com.example.reactnativezoomvideosdk2";
        // Set this to true to enable sharing device audio during screenshare
        params.isWithDeviceAudio = YES;
        
        ZoomVideoSDKScreenShareService * service = [[ZoomVideoSDKScreenShareService alloc]initWithParams:params];
        self.screenShareService = service;
    }
    return self;
}

- (void)dealloc
{
    self.screenShareService = nil;
}

- (void)broadcastStartedWithSetupInfo:(NSDictionary<NSString *,NSObject *> *)setupInfo {
    // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional.
    [self.screenShareService broadcastStartedWithSetupInfo:setupInfo];
    
}

- (void)broadcastPaused {
    [self.screenShareService broadcastPaused];
    // User has requested to pause the broadcast. Samples will stop being delivered.
}

- (void)broadcastResumed {
    [self.screenShareService broadcastResumed];
    // User has requested to resume the broadcast. Samples delivery will resume.
}

- (void)broadcastFinished {
    // User has requested to finish the broadcast.
    [self.screenShareService broadcastFinished];
}

- (void)processSampleBuffer:(CMSampleBufferRef)sampleBuffer withType:(RPSampleBufferType)sampleBufferType {
    [self.screenShareService processSampleBuffer:sampleBuffer withType:sampleBufferType];
}

- (void)ZoomVideoSDKScreenShareServiceFinishBroadcastWithError:(NSError *)error
{
    [self finishBroadcastWithError:error];
}

@end
