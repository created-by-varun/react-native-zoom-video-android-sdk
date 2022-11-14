package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKLiveStreamHelper;

public class RNZoomVideoSdkLiveStreamHelperModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkLiveStreamHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkLiveStreamHelper";
  }

  private ZoomVideoSDKLiveStreamHelper getLiveStreamHelper() {
    ZoomVideoSDKLiveStreamHelper liveStreamHelper = null;
    try {
      liveStreamHelper = ZoomVideoSDK.getInstance().getLiveStreamHelper();
      if (liveStreamHelper == null) {
        throw new Exception("No Live Stream Helper Found");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return liveStreamHelper;
  }

  @ReactMethod
  public void canStartLiveStream(Promise promise) {
    promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveStreamHelper().canStartLiveStream()));
  }

  @ReactMethod
  public void startLiveStream(String streamUrl, String streamKey, String broadcastUrl, Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveStreamHelper().startLiveStream(streamUrl, streamKey, broadcastUrl)));
      }
    });
  }

  @ReactMethod
  public void stopLiveStream(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveStreamHelper().stopLiveStream()));
      }
    });
  }

}
