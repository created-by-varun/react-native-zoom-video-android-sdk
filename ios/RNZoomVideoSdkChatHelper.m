#import "RNZoomVideoSdkChatHelper.h"
#import "RNZoomVideoSdkUser.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkChatHelper

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isChatDisabled:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKChatHelper* chatHelper = [[ZoomVideoSDK shareInstance] getChatHelper];

    resolve(@([chatHelper IsChatDisabled]));
}

RCT_EXPORT_METHOD(isPrivateChatDisabled:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKChatHelper* chatHelper = [[ZoomVideoSDK shareInstance] getChatHelper];

    resolve(@([chatHelper IsPrivateChatDisabled]));
}

RCT_EXPORT_METHOD(sendChatToUser: (NSString*)userId
                  withMessage: (NSString*)message
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKChatHelper* chatHelper = [[ZoomVideoSDK shareInstance] getChatHelper];

    if (chatHelper.IsChatDisabled == NO && chatHelper.IsPrivateChatDisabled == NO) {
        ZoomVideoSDKUser* user = [RNZoomVideoSdkUser getUser:userId];

        dispatch_async(dispatch_get_main_queue(), ^{
            resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([chatHelper SendChatToUser:user Content:message])]);
        });
    }
}

RCT_EXPORT_METHOD(sendChatToAll: (NSString*)message
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKChatHelper* chatHelper = [[ZoomVideoSDK shareInstance] getChatHelper];

    if (chatHelper.IsChatDisabled == NO) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([chatHelper SendChatToAll:message])]);
        });
    }
}

RCT_EXPORT_METHOD(deleteChatMessage:(NSString * __nonnull)msgID
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKChatHelper* chatHelper = [[ZoomVideoSDK shareInstance] getChatHelper];

    if (chatHelper.IsChatDisabled == NO) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([chatHelper deleteChatMessage:msgID])]);
        });
    }
}

RCT_EXPORT_METHOD(canChatMessageBeDeleted:(NSString *__nonnull)msgID
                    withResolve:(RCTPromiseResolveBlock)resolve
                    withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKChatHelper* chatHelper = [[ZoomVideoSDK shareInstance] getChatHelper];

    if (chatHelper.IsChatDisabled == NO) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve(@([chatHelper canChatMessageBeDeleted:msgID]));
        });
    }
}

@end
