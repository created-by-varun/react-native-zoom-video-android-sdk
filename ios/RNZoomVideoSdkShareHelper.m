#import <ReplayKit/ReplayKit.h>
#import <React/RCTUtils.h>
#import <React/RCTUIManager.h>
#import "RNZoomVideoSdkShareHelper.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkShareHelper

- (ZoomVideoSDKShareHelper *)getShareHelper
{
    ZoomVideoSDKShareHelper* shareHelper = nil;

    @try {
        shareHelper = [[ZoomVideoSDK shareInstance] getShareHelper];
        if (shareHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoShareFound" reason:@"No Share Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }

    return shareHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(shareScreen:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    if (@available(iOS 12.0, *)) {
        dispatch_async(dispatch_get_main_queue(), ^{
            RPSystemBroadcastPickerView *broadcastView = [[RPSystemBroadcastPickerView alloc] init];

            UIViewController *root = RCTPresentedViewController();
            [root.view addSubview:broadcastView];

            for (UIView *subView in broadcastView.subviews) {
                if ([subView isKindOfClass:[UIButton class]])
                {
                    UIButton *broadcastBtn = (UIButton *)subView;
                    [broadcastBtn sendActionsForControlEvents:UIControlEventAllTouchEvents];
                    break;
                }
            }

        });
    } else {
        // TODO: Should we just error our?
    }

    resolve(nil);
}

RCT_EXPORT_METHOD(shareView:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    // TODO
}

RCT_EXPORT_METHOD(lockShare:(BOOL)lock
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
     dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getShareHelper] lockShare:lock])]);
    });
}

RCT_EXPORT_METHOD(stopShare:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getShareHelper] stopShare])]);
    });
}

RCT_EXPORT_METHOD(isOtherSharing:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getShareHelper] isOtherSharing]));
    });
}

RCT_EXPORT_METHOD(isScreenSharingOut:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getShareHelper] isScreenSharingOut]));
    });
}

RCT_EXPORT_METHOD(isShareLocked:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getShareHelper] isShareLocked]));
    });
}

RCT_EXPORT_METHOD(isSharingOut:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getShareHelper] isSharingOut]));
    });
}

RCT_EXPORT_METHOD(isShareDeviceAudioEnabled:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getShareHelper] isShareDeviceAudioEnabled]));
    });
}

RCT_EXPORT_METHOD(enableShareDeviceAudio:(BOOL)enable
                  withPromise:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve(@([[self getShareHelper] enableShareDeviceAudio:enable]));
    });
}

@end
