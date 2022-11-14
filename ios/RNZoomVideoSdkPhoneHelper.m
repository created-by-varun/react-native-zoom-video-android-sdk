#import "RNZoomVideoSdkPhoneHelper.h"
#import "RNZoomVideoSdkPhoneSupportCountryInfo.h"
#import "RCTConvert+RNZoomVideoSdk.h"
#import "RNZoomVideoSdkSessionDialInNumberInfo.h"

@implementation RNZoomVideoSdkPhoneHelper

- (ZoomVideoSDKPhoneHelper *) getPhoneHelper
{
    ZoomVideoSDKPhoneHelper* phoneHelper = nil;
    @try {
        phoneHelper = [[ZoomVideoSDK shareInstance] getPhoneHelper];
        if (phoneHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoPhoneHelperFound" reason:@"No Phone Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
       NSLog(@"%@ - %@", e.name, e.reason);
    }
    return phoneHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isSupportPhoneFeature:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve(@([[self getPhoneHelper] isSupportPhoneFeature]));
}

RCT_EXPORT_METHOD(getSupportCountryInfo:(RCTPromiseResolveBlock)resolve
                    withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKPhoneHelper* phoneHelper = [[ZoomVideoSDK shareInstance] getPhoneHelper];

    if (phoneHelper == nil) {
        reject(@"phoneHelper_getSupportCountryInfo", @"No phone helper found", nil);
    }

    resolve([RNZoomVideoSdkPhoneSupportCountryInfo mapPhoneSupportCountryInfo:[phoneHelper getSupportCountryInfo]]);
}

RCT_EXPORT_METHOD(inviteByPhone: (NSString* _Nonnull) countryCode
                  phoneNumber:(NSString * _Nonnull) phoneNumber
                  name: (NSString * _Nonnull) name
                  withPromise:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKPhoneHelper* phoneHelper = [[ZoomVideoSDK shareInstance] getPhoneHelper];

    NSLog(@"countryCode:%@ , phoneNumber:%@ , name:%@", countryCode, phoneNumber, name);

    if (phoneHelper.isSupportPhoneFeature == YES) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([phoneHelper inviteByPhone: countryCode phoneNumber: phoneNumber name: name])]);
        });     
    }
}

RCT_EXPORT_METHOD(cancelInviteByPhone:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKPhoneHelper* phoneHelper = [[ZoomVideoSDK shareInstance] getPhoneHelper];

    if (phoneHelper.isSupportPhoneFeature == YES) {
        dispatch_async(dispatch_get_main_queue(), ^{
            resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([phoneHelper cancelInviteByPhone])]);
        });     
    }
}

RCT_EXPORT_METHOD(getInviteByPhoneStatus: (RCTPromiseResolveBlock)resolve
                    withRejecter:(RCTPromiseRejectBlock)reject)
{

    resolve([[RCTConvert ZoomVideoSDKPhoneStatusValuesReversed] objectForKey: @([[self getPhoneHelper] getInviteByPhoneStatus])]);
}

RCT_EXPORT_METHOD(getSessionDialInNumbers: (RCTPromiseResolveBlock)resolve
        withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKPhoneHelper* phoneHelper = [[ZoomVideoSDK shareInstance] getPhoneHelper];
    resolve([RNZoomVideoSdkSessionDialInNumberInfo mapSessionDialInNumberInfoArray:[phoneHelper getSessionDialInNumbers]]);
}

@end
