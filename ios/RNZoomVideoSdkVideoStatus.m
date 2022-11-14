#import "RNZoomVideoSdkVideoStatus.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkVideoStatus

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isOn:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        resolve(@([[[user getVideoCanvas] videoStatus] on]));
    }
}

@end
