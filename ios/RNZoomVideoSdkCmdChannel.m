#import "RNZoomVideoSdkCmdChannel.h"
#import "RNZoomVideoSdkUser.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkCmdChannel

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sendCommand:(NSString * _Nullable)receiverId
                  commandContent:(NSString * _Nullable)strCmd
                  withResolve:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
    
    ZoomVideoSDKCmdChannel* cmdChannel = [[ZoomVideoSDK shareInstance] getCmdChannel];
    ZoomVideoSDKUser* receiver = nil;
    
    if (receiverId) {
        receiver = [RNZoomVideoSdkUser getUser: receiverId];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([cmdChannel sendCommand:strCmd receiveUser: receiver])]);
    });
}

@end
