#import "RNZoomVideoSdkShareStatisticInfo.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkShareStatisticInfo

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getBpf:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getShareStatisticInfo] bps]));
    }
}

RCT_EXPORT_METHOD(getFps:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getShareStatisticInfo] fps]));
    }
}

RCT_EXPORT_METHOD(getHeight:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getShareStatisticInfo] height]));
    }
}

RCT_EXPORT_METHOD(getWidth:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[user getShareStatisticInfo] width]));
    }
}

@end
