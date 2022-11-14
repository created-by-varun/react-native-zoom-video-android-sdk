package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import us.zoom.sdk.ZoomVideoSDKUser;

public class RNZoomVideoSdkVideoStatisticInfoModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkVideoStatisticInfoModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkVideoStatisticInfo";
  }

  @ReactMethod
  public void getBpf(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getVideoStatisticInfo().getBpf());
    }
  }

  @ReactMethod
  public void getFps(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getVideoStatisticInfo().getFps());
    }
  }

  @ReactMethod
  public void getHeight(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getVideoStatisticInfo().getHeight());
    }
  }

  @ReactMethod
  public void getWidth(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      promise.resolve(user.getVideoStatisticInfo().getWidth());
    }
  }

}
