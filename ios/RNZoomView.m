#import <ZoomVideoSDK.h>
#import "RNZoomView.h"
#import "RNZoomVideoSdkUser.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomView {
    NSString* userId;
    BOOL sharing;
    BOOL preview;
    BOOL hasMultiCamera;
    NSString* multiCameraIndex;
    ZoomVideoSDKVideoAspect videoAspect;
    ZoomVideoSDKVideoCanvas* currentCanvas;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setViewingCanvas];
}

- (void)setUserId:(NSString*)newUserId {
    if ([userId isEqualToString:newUserId]) {
        return;
    }
    userId = newUserId;
    [self setNeedsLayout];
}

- (void)setSharing:(BOOL)newSharing {
    if (sharing == newSharing) {
        return;
    }
    sharing = newSharing;
    [self setNeedsLayout];
}

- (void)setVideoAspect:(NSString*)newVideoAspect {
    ZoomVideoSDKVideoAspect aspect = [RCTConvert ZoomVideoSDKVideoAspect: newVideoAspect];
    if (videoAspect == aspect) {
        return;
    }
    videoAspect = aspect;
    [self setNeedsLayout];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview == nil && currentCanvas != nil) {
        [currentCanvas unSubscribeWithView:self];
    }
}

- (void)setHasMultiCamera:(BOOL)newHasMultiCamera {
    if (hasMultiCamera == newHasMultiCamera) {
        return;
    }
    hasMultiCamera = newHasMultiCamera; 
}

- (void)setMultCameraIndex:(NSString*)newIndex {
    if (multiCameraIndex == newIndex) {
        return;
    }
    multiCameraIndex = newIndex;
}

- (void)setPreview:(BOOL)newPreview {
    if (preview == newPreview) {
        return;
    }
    preview = newPreview;

    ZoomVideoSDKVideoHelper* videoHelper = [[ZoomVideoSDK shareInstance] getVideoHelper];
    if (preview == YES && currentCanvas == nil) {
        [videoHelper startVideoCanvasPreview: self];
        ZoomVideoSDKUser* user = [[[ZoomVideoSDK shareInstance] getSession] getMySelf];
        currentCanvas = [user getVideoCanvas];
    } else {
        [videoHelper stopVideoCanvasPreview: self];
        currentCanvas = nil;
    }
}

- (void)setViewingCanvas {
    if (currentCanvas != nil) {
        [currentCanvas unSubscribeWithView:self];
        currentCanvas = nil;
    }
    
    // Get the user
    ZoomVideoSDKUser* user = [RNZoomVideoSdkUser getUser:userId];
    
    // Get the canvas
    if (sharing) {
        currentCanvas = [user getShareCanvas];
    } else if (hasMultiCamera) {
        NSArray <ZoomVideoSDKVideoCanvas *> *multiCameraList = [user getMultiCameraCanvasList];
        NSInteger index = [multiCameraIndex integerValue];
        currentCanvas = multiCameraList[index];
    } else {
        currentCanvas = [user getVideoCanvas];
    }

    // Subscribe User's videoCanvas to render their video stream.
    [currentCanvas subscribeWithView:self andAspectMode:videoAspect];
}

@end
