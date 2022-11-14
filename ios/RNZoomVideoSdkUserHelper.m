#import "RNZoomVideoSdkUserHelper.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkUserHelper

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(changeName:(NSString *)name
                  withUserID:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUserHelper* userHelper = [[ZoomVideoSDK shareInstance] getUserHelper];
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve(@([userHelper changeName:name withUser:user]));
        });
    }
}

RCT_EXPORT_METHOD(makeHost:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUserHelper* userHelper = [[ZoomVideoSDK shareInstance] getUserHelper];
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve(@([userHelper makeHost:user]));
        });
    }
}

RCT_EXPORT_METHOD(makeManager:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUserHelper* userHelper = [[ZoomVideoSDK shareInstance] getUserHelper];
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve(@([userHelper makeManager:user]));
        });
    }
}

RCT_EXPORT_METHOD(revokeManager:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUserHelper* userHelper = [[ZoomVideoSDK shareInstance] getUserHelper];
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve(@([userHelper revokeManager:user]));
        });
    }
}

RCT_EXPORT_METHOD(removeUser:(NSString *)userId
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKUserHelper* userHelper = [[ZoomVideoSDK shareInstance] getUserHelper];
    ZoomVideoSDKUser *user = [RNZoomVideoSdkUser getUser:userId];
    if (user != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve(@([userHelper removeUser:user]));
        });
    }
}

@end
