#import <React/RCTViewManager.h>
#import "RNZoomView.h"

@interface RNZoomViewViewManager : RCTViewManager
@end

@implementation RNZoomViewViewManager

RCT_EXPORT_MODULE(RNZoomView)

- (RNZoomView *)view
{
    return [[RNZoomView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(userId, NSString, RNZoomView)
{
    [view setUserId:json];
}

RCT_CUSTOM_VIEW_PROPERTY(sharing, BOOL, RNZoomView)
{
    [view setSharing:[RCTConvert BOOL:json]];
}

RCT_CUSTOM_VIEW_PROPERTY(videoAspect, NSString, RNZoomView)
{
    [view setVideoAspect:json];
}

RCT_CUSTOM_VIEW_PROPERTY(preview, BOOL, RNZoomView)
{
    [view setPreview: [RCTConvert BOOL:json]];
}

@end
