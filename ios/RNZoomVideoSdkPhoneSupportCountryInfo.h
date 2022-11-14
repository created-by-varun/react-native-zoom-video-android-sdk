#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <ZoomVideoSDK.h>

@interface RNZoomVideoSdkPhoneSupportCountryInfo : NSObject <RCTBridgeModule>

+ (NSDictionary *)mapCountry: (ZoomVideoSDKPhoneSupportCountryInfo *) country;
+ (NSMutableArray *)mapPhoneSupportCountryInfo: (NSArray<ZoomVideoSDKPhoneSupportCountryInfo *>*)countryList;

@end
