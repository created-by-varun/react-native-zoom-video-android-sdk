#import "RCTConvert+RNZoomVideoSdk.h"
#import "RNZoomVideoSdkAudioStatus.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkAudioStatus

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isMuted:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user audioStatus] isMuted]));
    }
}

RCT_EXPORT_METHOD(isTalking:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user audioStatus] talking]));
    }
}

RCT_EXPORT_METHOD(getAudioType:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve([[RCTConvert ZoomVideoSDKAudioTypeValuesReversed] objectForKey: @([[user audioStatus] audioType])]);
    }
}

@end
