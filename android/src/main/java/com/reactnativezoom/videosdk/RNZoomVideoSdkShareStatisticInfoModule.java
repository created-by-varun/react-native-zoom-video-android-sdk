package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import us.zoom.sdk.ZoomVideoSDKUser;

public class RNZoomVideoSdkShareStatisticInfoModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkShareStatisticInfoModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkShareStatisticInfo";
  }

  @ReactMethod
  public void getBpf(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getShareStatisticInfo().getBpf());
    }
  }

  @ReactMethod
  public void getFps(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getShareStatisticInfo().getFps());
    }
  }

  @ReactMethod
  public void getHeight(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getShareStatisticInfo().getHeight());
    }
  }

  @ReactMethod
  public void getWidth(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getShareStatisticInfo().getWidth());
    }
  }

}
