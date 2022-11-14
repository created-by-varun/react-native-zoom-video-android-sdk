#import "RNZoomVideoSdkRecordingHelper.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkRecordingHelper

- (ZoomVideoSDKRecordingHelper *)getRecordingHelper
{
    ZoomVideoSDKRecordingHelper* recordingHelper = nil;
    @try {
        recordingHelper = [[ZoomVideoSDK shareInstance] getRecordingHelper];
        if (recordingHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoRecordingHelperFound" reason:@"No Recording Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch(NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return recordingHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(canStartRecording:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getRecordingHelper] canStartRecording])]);
}

RCT_EXPORT_METHOD(startCloudRecording:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getRecordingHelper] startCloudRecording])]);
   });
}

RCT_EXPORT_METHOD(stopCloudRecording:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getRecordingHelper] stopCloudRecording])]);
   });
}

RCT_EXPORT_METHOD(pauseCloudRecording:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getRecordingHelper] pauseCloudRecording])]);
   });
}

RCT_EXPORT_METHOD(resumeCloudRecording:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getRecordingHelper] resumeCloudRecording])]);
   });
}

RCT_EXPORT_METHOD(getCloudRecordingStatus:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
    resolve([[RCTConvert ZoomVideoSDKRecordingStatusValuesReversed] objectForKey: @([[self getRecordingHelper] getCloudRecordingStatus])]);
}

@end
