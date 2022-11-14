package com.reactnativezoom.videosdk;

import android.content.Context;
import android.content.Intent;
import android.media.projection.MediaProjectionManager;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKShareHelper;

public class RNZoomVideoSdkShareHelperModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkShareHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkShareHelper";
  }

  private ZoomVideoSDKShareHelper getShareHelper() {
    ZoomVideoSDKShareHelper shareHelper = null;
    try {
      shareHelper = ZoomVideoSDK.getInstance().getShareHelper();
      if (shareHelper == null) {
        throw new Exception("No Share Found");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return shareHelper;
  }

  @ReactMethod
  public void shareScreen() throws Exception {
    MediaProjectionManager manager =
            (MediaProjectionManager) reactContext.getSystemService(Context.MEDIA_PROJECTION_SERVICE);
    if (manager != null) {
      Intent intent = manager.createScreenCaptureIntent();
      reactContext.startActivityForResult(intent, 0, null);
    } else {
      throw new Exception("Notification service must be implemented.");
    }
  }

  @ReactMethod
  public void shareView() {
    // TODO
  }

  @ReactMethod
  public void lockShare(boolean lock, Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getShareHelper().lockShare(lock)));
      }
    });
  }

  @ReactMethod
  public void stopShare(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getShareHelper().stopShare()));
      }
    });
  }

  @ReactMethod
  public void isOtherSharing(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getShareHelper().isOtherSharing());
      }
    });
  }

  @ReactMethod
  public void isScreenSharingOut(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getShareHelper().isScreenSharingOut());
      }
    });
  }

  @ReactMethod
  public void isShareLocked(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getShareHelper().isShareLocked());
      }
    });
  }

  @ReactMethod
  public void isSharingOut(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getShareHelper().isSharingOut());
      }
    });
  }
}
