#import "RNZoomVideoSdkVideoStatisticInfo.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkVideoStatisticInfo

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getBpf:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getVideoStatisticInfo] bps]));
    }
}

RCT_EXPORT_METHOD(getFps:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getVideoStatisticInfo] fps]));
    }
}

RCT_EXPORT_METHOD(getHeight:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getVideoStatisticInfo] height]));
    }
}

RCT_EXPORT_METHOD(getWidth:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getVideoStatisticInfo] width]));
    }
}

@end
