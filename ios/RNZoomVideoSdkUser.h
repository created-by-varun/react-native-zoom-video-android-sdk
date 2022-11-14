#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <ZoomVideoSDK.h>

@interface RNZoomVideoSdkUser : NSObject <RCTBridgeModule>

+ (NSDictionary *)mapUser: (ZoomVideoSDKUser*) user;
+ (NSMutableArray *)mapUserArray: (NSArray<ZoomVideoSDKUser *> *)userArray;
+ (ZoomVideoSDKUser *)getUser: (NSString*)userId;

@end
