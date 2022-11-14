#import "RNZoomVideoSdkTestAudioDeviceHelper.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkTestAudioDeviceHelper

- (ZoomVideoSDKTestAudioDeviceHelper *)getTestAudioDeviceHelper
{
    ZoomVideoSDKTestAudioDeviceHelper* testAudioDeviceHelper = nil;
    @try {
        testAudioDeviceHelper = [[ZoomVideoSDK shareInstance] getTestAudioDeviceHelper];
        if (testAudioDeviceHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoTestAudioDeviceHelperFound" reason:@"No Test Audio Device Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch(NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return testAudioDeviceHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startMicTest:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getTestAudioDeviceHelper] startMicTest])]);
    });
}

RCT_EXPORT_METHOD(stopMicTest:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getTestAudioDeviceHelper] stopMicTest])]);
   });
}

RCT_EXPORT_METHOD(playMicTest:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getTestAudioDeviceHelper] playMicTest])]);
   });
}

RCT_EXPORT_METHOD(startSpeakerTest:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getTestAudioDeviceHelper] startSpeakerTest])]);
   });
}

RCT_EXPORT_METHOD(stopSpeakerTest:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getTestAudioDeviceHelper] stopSpeakerTest])]);
   });
}

@end
