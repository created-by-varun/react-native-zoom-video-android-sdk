#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <ZoomVideoSDK.h>

@interface RNZoomVideoSdkChatMessage : NSObject <RCTBridgeModule>

+ (NSDictionary *)mapChatMessage: (ZoomVideoSDKChatMessage *)chatMessage;

@end
