package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKTestAudioDeviceHelper;

public class RNZoomVideoSdkTestAudioDeviceHelperModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkTestAudioDeviceHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkTestAudioDeviceHelper";
  }

  private ZoomVideoSDKTestAudioDeviceHelper getTestAudioDeviceHelper() {
    ZoomVideoSDKTestAudioDeviceHelper testAudioDeviceHelper = null;
    try {
      testAudioDeviceHelper = ZoomVideoSDK.getInstance().getTestAudioDeviceHelper();
      if (testAudioDeviceHelper == null) {
        throw new Exception ("Test audio is not available");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return testAudioDeviceHelper;
  }

  @ReactMethod
  public void startMicTest(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getTestAudioDeviceHelper().startMicTest()));
      }
    });
  }

  @ReactMethod
  public void stopMicTest(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getTestAudioDeviceHelper().stopMicTest()));
      }
    });
  }

  @ReactMethod
  public void playMicTest(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getTestAudioDeviceHelper().playMicTest()));
      }
    });
  }

  @ReactMethod
  public void startSpeakerTest(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getTestAudioDeviceHelper().startSpeakerTest()));
      }
    });
  }

  @ReactMethod
  public void stopSpeakerTest(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getTestAudioDeviceHelper().stopSpeakerTest()));
      }
    });
  }

}
