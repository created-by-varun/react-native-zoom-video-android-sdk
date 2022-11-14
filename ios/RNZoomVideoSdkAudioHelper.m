#import "RNZoomVideoSdkAudioHelper.h"
#import "RNZoomVideoSdkUser.h"
#import "RCTConvert+RNZoomVideoSdk.h"
#import <AVFAudio/AVAudioSession.h>

@implementation RNZoomVideoSdkAudioHelper

- (ZoomVideoSDKAudioHelper *)getAudioHelper
{
    ZoomVideoSDKAudioHelper* audioHelper = nil;
    @try {
        audioHelper = [[ZoomVideoSDK shareInstance] getAudioHelper];
        if (audioHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoAudioHelperFound" reason:@"No Audio Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return audioHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(canSwitchSpeaker:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    // There's no API for retrieving available outputs other than external devices
    // since iOS devices always have "Speaker".
    resolve(@YES);
}

RCT_EXPORT_METHOD(getSpeakerStatus:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    for (AVAudioSessionPortDescription *output in [[[AVAudioSession sharedInstance] currentRoute] outputs]) {
        if ([[output portType] isEqualToString:@"Speaker"]) {
            resolve(@YES);
            return;
        }
    }
    resolve(@NO);
}

RCT_EXPORT_METHOD(setSpeaker:(BOOL)isOn
        withResolve:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSError *error;
    AVAudioSessionPortOverride override = isOn ? AVAudioSessionPortOverrideSpeaker : AVAudioSessionPortOverrideNone;
    [[AVAudioSession sharedInstance] overrideOutputAudioPort:override error:&error];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    if (error) {
        NSLog(@"%@", error);
    }
}

RCT_EXPORT_METHOD(startAudio:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioHelper] startAudio])]);
    });
}

RCT_EXPORT_METHOD(stopAudio:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioHelper] stopAudio])]);
    });
}

RCT_EXPORT_METHOD(muteAudio:(NSString *)userId
        withResolve:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioHelper] muteAudio:user])]);
    });
}

RCT_EXPORT_METHOD(unmuteAudio:(NSString *)userId
        withResolve:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioHelper] unmuteAudio:user])]);
    });
}

RCT_EXPORT_METHOD(subscribe:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioHelper] subscribe])]);
    });
}

RCT_EXPORT_METHOD(unsubscribe:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioHelper] unSubscribe])]);
    });
}

RCT_EXPORT_METHOD(resetAudioSession:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getAudioHelper] resetAudioSession]));
    });
}

RCT_EXPORT_METHOD(cleanAudioSession:(RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self getAudioHelper] cleanAudioSession];
    });
}

@end
