#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <ZoomVideoSDK.h>

@interface RNZoomVideoSdk : RCTEventEmitter <RCTBridgeModule, ZoomVideoSDKDelegate>

@end
