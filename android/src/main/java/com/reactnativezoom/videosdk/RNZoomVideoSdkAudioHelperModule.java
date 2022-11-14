package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKAudioHelper;
import us.zoom.sdk.ZoomVideoSDKUser;
import com.reactnativezoom.videosdk.RNZoomVideoSdkUserModule;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

public class RNZoomVideoSdkAudioHelperModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkAudioHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkAudioHelper";
  }

  private ZoomVideoSDKAudioHelper getAudioHelper() {
    ZoomVideoSDKAudioHelper audioHelper = null;
    try {
      audioHelper = ZoomVideoSDK.getInstance().getAudioHelper();
      if (audioHelper == null) {
        throw new Exception("No Audio Helper Found");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return audioHelper;
  }

  @ReactMethod
  public void canSwitchSpeaker(Promise promise) {
    promise.resolve(getAudioHelper().canSwitchSpeaker());
  }

  @ReactMethod
  public void getSpeakerStatus(Promise promise) {
    promise.resolve(getAudioHelper().getSpeakerStatus());
  }

  @ReactMethod
  public void muteAudio(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
        @Override
        public void run() {
          promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().muteAudio(user)));
        }
      });
    }
  }

  @ReactMethod
  public void unmuteAudio(String userId, Promise promise) {
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);
    if (user != null) {
      reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
        @Override
        public void run() {
          promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().unMuteAudio(user)));
        }
      });
    }
  }
  @ReactMethod
  public void setSpeaker(boolean isOn, Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().setSpeaker(isOn)));
      }
    });
  }

  @ReactMethod
  public void startAudio(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().startAudio()));
      }
    });
  }

  @ReactMethod
  public void stopAudio(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().stopAudio()));
      }
    });
  }

  @ReactMethod
  public void subscribe(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().subscribe()));
      }
    });
  }

  @ReactMethod
  public void unsubscribe(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioHelper().unSubscribe()));
      }
    });
  }

  @ReactMethod
  public void resetAudioSession(Promise promise) {
    promise.resolve(false);
  }

  @ReactMethod
  public void cleanAudioSession(Promise promise) {
    promise.resolve(null);
  }


}
