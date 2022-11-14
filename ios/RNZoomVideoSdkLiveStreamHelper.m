#import "RNZoomVideoSdkLiveStreamHelper.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkLiveStreamHelper

- (ZoomVideoSDKLiveStreamHelper *)getLiveStreamHelper
{
    ZoomVideoSDKLiveStreamHelper* liveStreamHelper = nil;
    @try {
        liveStreamHelper = [[ZoomVideoSDK shareInstance] getLiveStreamHelper];
        if (liveStreamHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoLiveStreamoHelperFound" reason:@"No Live Stream Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return liveStreamHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(canStartLiveStream:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveStreamHelper] canStartLiveStream])]);
}

RCT_EXPORT_METHOD(startLiveStream:(NSString *)streamUrl
                  withStreamKey:(NSString *)streamKey
                  withBroadcastUrl:(NSString *)broadcastUrl
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveStreamHelper] startLiveStreamWithStreamingURL:streamUrl StreamingKey:streamKey BroadcastURL:broadcastUrl])]);
    });
}

RCT_EXPORT_METHOD(stopLiveStream:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveStreamHelper] stopLiveStream])]);
    });
}

@end
