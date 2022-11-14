#import "RNZoomVideoSdkAudioSettingHelper.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkAudioSettingHelper

- (ZoomVideoSDKAudioSettingHelper *)getAudioSettingHelper
{
    ZoomVideoSDKAudioSettingHelper* audioSettingHelper = nil;
    @try {
        audioSettingHelper = [[ZoomVideoSDK shareInstance] getAudioSettingHelper];
        if (audioSettingHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoAudioSettingHelperFound" reason:@"No Audio Setting Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return audioSettingHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isMicOriginalInputEnable: (RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve(@([[self getAudioSettingHelper] isMicOriginalInputEnable]));
}

RCT_EXPORT_METHOD(enableMicOriginalInput: (BOOL)enable
        withResolve: (RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getAudioSettingHelper] enableMicOriginalInput:enable])]);
    });

}

@end