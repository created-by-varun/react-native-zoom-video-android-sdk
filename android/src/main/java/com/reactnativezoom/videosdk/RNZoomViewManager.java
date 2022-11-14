package com.reactnativezoom.videosdk;

import java.util.List;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkVideoAspect;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKUser;
import us.zoom.sdk.ZoomVideoSDKVideoAspect;
import us.zoom.sdk.ZoomVideoSDKVideoCanvas;
import us.zoom.sdk.ZoomVideoSDKVideoView;
import us.zoom.sdk.ZoomVideoSDKVideoHelper;


public class RNZoomViewManager extends SimpleViewManager<ZoomVideoSDKVideoView>  {

  private final ReactApplicationContext reactContext;
  private ZoomVideoSDKVideoView videoView;
  private ZoomVideoSDKVideoCanvas currentCanvas;
  private String userId;
  private boolean sharing;
  private ZoomVideoSDKVideoAspect videoAspect;
  private boolean preview;
  private boolean hasMultiCamera;
  private String multiCameraIndex;

  public RNZoomViewManager(ReactApplicationContext reactContext) {
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomView";
  }

  @Override
  protected ZoomVideoSDKVideoView createViewInstance(ThemedReactContext reactContext) {
    userId = "";
    sharing = false;
    preview = false;
    hasMultiCamera = false;
    multiCameraIndex = "";
    videoAspect = ZoomVideoSDKVideoAspect.ZoomVideoSDKVideoAspect_Original;
    videoView = new ZoomVideoSDKVideoView(reactContext);
    videoView.setZOrderMediaOverlay(true);
    return videoView;
  }

  @ReactProp(name = "userId")
  public void setUserId(ZoomVideoSDKVideoView videoView, String newUserId) {
    if (newUserId.equals(userId)) {
      return;
    }
    userId = newUserId;
    setViewingCanvas();
  }

  @ReactProp(name = "sharing")
  public void setSharing(ZoomVideoSDKVideoView videoView, boolean newSharing) {
    if (sharing == newSharing) {
      return;
    }
    sharing = newSharing;
    setViewingCanvas();
  }

  @ReactProp(name = "hasMultiCamera")
  public void setHasMultiCamera(ZoomVideoSDKVideoView videoView, boolean newHasMultiCamera) {
    if (hasMultiCamera == newHasMultiCamera) {
      return;
    }
    hasMultiCamera = newHasMultiCamera;
  }

  @ReactProp(name = "multiCameraIndex")
  public void setMultiCameraIndex(ZoomVideoSDKVideoView videoView, String newIndex) {
    if (multiCameraIndex == newIndex) {
      return;
    }
    multiCameraIndex = newIndex;
    setViewingCanvas();
  }

  @ReactProp(name = "fullScreen")
  public void setFullScreen(ZoomVideoSDKVideoView videoView, Boolean fullScreen) {
    videoView.setZOrderOnTop(!fullScreen);
  }

  @ReactProp(name = "videoAspect")
  public void setAspect(ZoomVideoSDKVideoView videoView, String newVideoAspect) {
    ZoomVideoSDKVideoAspect aspect = RNZoomVideoSdkVideoAspect.valueOf(newVideoAspect);
    if (videoAspect == aspect) {
      return;
    }
    videoAspect = aspect;
    setViewingCanvas();
  }

  @ReactProp(name = "preview")
  public void setPreview(ZoomVideoSDKVideoView videoView, boolean newPreview) {
    if (preview == newPreview) {
      return;
    }
    preview = newPreview;

    ZoomVideoSDKVideoHelper videoHelper = ZoomVideoSDK.getInstance().getVideoHelper();
    if (preview && currentCanvas == null) {
      videoHelper.startVideoCanvasPreview(videoView);
      ZoomVideoSDKUser user = ZoomVideoSDK.getInstance().getSession().getMySelf();
      currentCanvas = user.getVideoCanvas();
    } else {
      videoHelper.stopVideoCanvasPreview(videoView);
      currentCanvas = null;
    }
  }

  private void setViewingCanvas()
  {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user == null) return;
    if (currentCanvas != null) {
      currentCanvas.unSubscribe(videoView);
      currentCanvas = null;
    }

    if (sharing) {
      currentCanvas = user.getShareCanvas();
    } else if (hasMultiCamera) {
      List<ZoomVideoSDKVideoCanvas> multiCameraList = user.getMultiCameraCanvasList();
      int index = Integer.parseInt(multiCameraIndex);
      currentCanvas = multiCameraList.get(index);
    } else {
      currentCanvas = user.getVideoCanvas();
    }
    currentCanvas.subscribe(videoView, videoAspect);
  }
}
