#import <React/RCTConvert.h>
#import "RNZoomVideoSdk.h"
#import "RNZoomVideoSdkVideoHelper.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkVideoHelper

- (ZoomVideoSDKVideoHelper *)getVideoHelper
{
    ZoomVideoSDKVideoHelper* videoHelper = nil;
    @try {
        videoHelper = [[ZoomVideoSDK shareInstance] getVideoHelper];
        if (videoHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoVideoHelperFound" reason:@"No Video Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return videoHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startVideo:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getVideoHelper] startVideo])]);
    });
}

RCT_EXPORT_METHOD(stopVideo:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getVideoHelper] stopVideo])]);
    });
}

RCT_EXPORT_METHOD(rotateMyVideo:(NSNumber *)rotation
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getVideoHelper] rotateMyVideo:(UIDeviceOrientation)rotation]));
    });
}

RCT_EXPORT_METHOD(switchCamera)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self getVideoHelper] switchCamera];
    });
}

RCT_REMAP_METHOD(setVideoQualityPreference,
                 setVideoQualityPreferenceWithConfig: (NSDictionary *)settings
                 withResolver: (RCTPromiseResolveBlock)resolve
                 withRejecter: (RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKVideoPreferenceSetting *videoPreference = [ZoomVideoSDKVideoPreferenceSetting new];

    videoPreference.mode = [RCTConvert ZoomVideoSDKVideoPreferenceMode: [settings objectForKey:@"mode"]];

    switch (videoPreference.mode) {
        case ZoomVideoSDKVideoPreferenceMode_Custom:
            videoPreference.maximumFrameRate = [[settings valueForKey:@"maximumFrameRate"] intValue];
            videoPreference.minimumFrameRate = [[settings valueForKey:@"minimumFrameRate"] intValue];
            break;
        default:
            break;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getVideoHelper] setVideoQualityPreference:videoPreference])]);
    });
}

@end
