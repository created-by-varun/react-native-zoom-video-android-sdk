#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <ZoomVideoSDK.h>

@interface RNZoomVideoSdkLiveTranscriptionLanguage : NSObject <RCTBridgeModule>

+ (NSDictionary *)mapLanguage: (ZoomVideoSDKLiveTranscriptionLanguage*) language;
+ (NSMutableArray *)mapLanguageArray: (NSArray <ZoomVideoSDKLiveTranscriptionLanguage*>*)languageArray;

@end
