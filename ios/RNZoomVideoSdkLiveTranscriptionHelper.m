#import "RNZoomVideoSdkLiveTranscriptionHelper.h"
#import "RNZoomVideoSdkLiveTranscriptionLanguage.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkLiveTranscriptionHelper

- (ZoomVideoSDKLiveTranscriptionHelper *)getLiveTranscriptionHelper
{
    ZoomVideoSDKLiveTranscriptionHelper* liveTranscriptionHelper = nil;
    @try {
        liveTranscriptionHelper = [[ZoomVideoSDK shareInstance] getLiveTranscriptionHelper];
        if (liveTranscriptionHelper == nil) {
            NSException *e = [NSException exceptionWithName:@"NoRecordingHelperFound" reason:@"No Live Transcription Helper Found" userInfo:nil];
            @throw e;
        }
    } @catch(NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }
    return liveTranscriptionHelper;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(canStartLiveTranscription:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve(@([[self getLiveTranscriptionHelper] canStartLiveTranscription]));
}

RCT_EXPORT_METHOD(getLiveTranscriptionStatus:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
    resolve([[RCTConvert ZoomVideoSDKLiveTranscriptionStatusValuesReversed] objectForKey: @([[self getLiveTranscriptionHelper] getLiveTranscriptionStatus])]);
}

RCT_EXPORT_METHOD(startLiveTranscription:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveTranscriptionHelper] startLiveTranscription])]);
   });
}

RCT_EXPORT_METHOD(stopLiveTranscription:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveTranscriptionHelper] stopLiveTranscription])]);
   });
}

RCT_EXPORT_METHOD(getAvailableSpokenLanguages:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    NSArray <ZoomVideoSDKLiveTranscriptionLanguage*>* languageList = [[self getLiveTranscriptionHelper] getAvailableSpokenLanguages];

    if (languageList == nil | [languageList count] == 0) {
        reject(@"getAvailableSpokenLanguages", @"No Languages Found", nil);
    }

    resolve([RNZoomVideoSdkLiveTranscriptionLanguage mapLanguageArray:languageList]);
}

RCT_EXPORT_METHOD(setSpokenLanguage:(NSInteger)languageID
                  withPromise:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveTranscriptionHelper] setSpokenLanguage:languageID])]);
}

RCT_EXPORT_METHOD(getSpokenLanguage:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKLiveTranscriptionLanguage* language = [[self getLiveTranscriptionHelper] getSpokenLanguage];

    if (language == nil) {
        reject(@"getSpokenLanguage", @"No Languages Found", nil);
    }

    resolve([RNZoomVideoSdkLiveTranscriptionLanguage mapLanguage:language]);
}

RCT_EXPORT_METHOD(getAvailableTranslationLanguages:(RCTPromiseResolveBlock)resolve
                  withRejector:(RCTPromiseRejectBlock)reject)
{
    NSArray <ZoomVideoSDKLiveTranscriptionLanguage*>* languageList = [[self getLiveTranscriptionHelper] getAvailableTranslationLanguages];

    if (languageList == nil | [languageList count] == 0) {
        reject(@"getAvailableTranslationLanguages", @"No Languages Found", nil);
    }

    resolve([RNZoomVideoSdkLiveTranscriptionLanguage mapLanguageArray:languageList]);
}

RCT_EXPORT_METHOD(setTranslationLanguage:(NSInteger)languageID
                  withPromise:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[RCTConvert ZoomVideoSDKErrorValuesReversed] objectForKey: @([[self getLiveTranscriptionHelper] setTranslationLanguage:languageID])]);
}

RCT_EXPORT_METHOD(getTranslationLanguage:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    ZoomVideoSDKLiveTranscriptionLanguage* language = [[self getLiveTranscriptionHelper] getTranslationLanguage];

    if (language == nil) {
        reject(@"getTranslationLanguage", @"No Languages Found", nil);
    }

    resolve([RNZoomVideoSdkLiveTranscriptionLanguage mapLanguage:language]);
}



@end
