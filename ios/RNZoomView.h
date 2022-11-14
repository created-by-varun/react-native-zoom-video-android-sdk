#import <React/RCTView.h>

@interface RNZoomView : RCTView

- (void)setUserId:(NSString*)userId;
- (void)setSharing:(BOOL)sharing;
- (void)setVideoAspect:(NSString*)videoAspect;
- (void)setPreview: (BOOL)preview;

@end
