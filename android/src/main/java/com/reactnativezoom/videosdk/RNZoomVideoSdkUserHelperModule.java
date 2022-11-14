package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKUser;
import us.zoom.sdk.ZoomVideoSDKUserHelper;

public class RNZoomVideoSdkUserHelperModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkUserHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkUserHelper";
  }

  private ZoomVideoSDKUserHelper getUserHelper() {
    ZoomVideoSDKUserHelper userHelper = null;
    try {
      userHelper = ZoomVideoSDK.getInstance().getUserHelper();
      if (userHelper == null) {
        throw new Exception("No User Helper Found");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return userHelper;
  }

  @ReactMethod
  public void changeName(String name, String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getUserHelper().changeName(name, user));
      }
    });
  }

  @ReactMethod
  public void makeHost(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getUserHelper().makeHost(user));
      }
    });
  }

  @ReactMethod
  public void makeManager(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getUserHelper().makeManager(user));
      }
    });
  }

  @ReactMethod
  public void revokeManager(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getUserHelper().revokeManager(user));
      }
    });
  }

  @ReactMethod
  public void removeUser(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(getUserHelper().removeUser(user));
      }
    });
  }

}
