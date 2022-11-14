#import "RNZoomVideoSdkSession.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkSession

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getSessionName:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionName", @"No Session Found", nil);
    }

    resolve([session getSessionName]);
}

RCT_EXPORT_METHOD(getSessionID:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionPassword", @"No Session Found", nil);
    }

    resolve([session getSessionID]);
}

RCT_EXPORT_METHOD(getSessionPassword:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionPassword", @"No Session Found", nil);
    }

    resolve([session getSessionPassword]);
}

RCT_EXPORT_METHOD(getSessionHostName:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionHostName", @"No Session Found", nil);
    }

    resolve([session getSessionHostName]);
}

RCT_EXPORT_METHOD(getSessionHost:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionHost", @"No Session Found", nil);
    }

    resolve([RNZoomVideoSdkUser mapUser:[session getSessionHost]]);
}

RCT_EXPORT_METHOD(getRemoteUsers:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getRemoteUsers", @"No Session Found", nil);
    }

    resolve([RNZoomVideoSdkUser mapUserArray:[session getRemoteUsers]]);
}

RCT_EXPORT_METHOD(getMySelf:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getMySelf", @"No Session Found", nil);
    }

    resolve([RNZoomVideoSdkUser mapUser:[session getMySelf]]);
}

RCT_EXPORT_METHOD(getSessionNumber:(RCTPromiseResolveBlock)resolve
        withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionNumber", @"No Session Found", nil);
    }

    resolve(@([session getSessionNumber]));
}

RCT_EXPORT_METHOD(getSessionPhonePasscode:(RCTPromiseResolveBlock)resolve
        withRejector:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKSession* session = [[ZoomVideoSDK shareInstance] getSession];

    if (session == nil) {
        reject(@"session_getSessionPhonePasscode", @"No Session Found", nil);
    }

    resolve([session getSessionPhonePasscode]);
}

@end
