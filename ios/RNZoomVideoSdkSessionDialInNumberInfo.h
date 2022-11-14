#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <ZoomVideoSDK.h>

@interface RNZoomVideoSdkSessionDialInNumberInfo : NSObject <RCTBridgeModule>

+ (NSDictionary *)mapSessionDialInNumberInfo: (ZoomVideoSDKDialInNumberInfo*) sessionDialInNumberInfo;
+ (NSMutableArray *)mapSessionDialInNumberInfoArray: (NSArray<ZoomVideoSDKDialInNumberInfo *> *)dialInNumberInfoArray;

@end