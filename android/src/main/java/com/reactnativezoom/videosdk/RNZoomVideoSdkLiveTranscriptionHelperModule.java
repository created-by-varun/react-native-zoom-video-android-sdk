package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkLiveTranscriptionStatus;

import java.util.List;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;
import us.zoom.sdk.ZoomVideoSDKUser;

public class RNZoomVideoSdkLiveTranscriptionHelperModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkLiveTranscriptionHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkLiveTranscriptionHelper";
  }

  private ZoomVideoSDKLiveTranscriptionHelper getLiveTranscriptionHelper() {
    ZoomVideoSDKLiveTranscriptionHelper liveTranscriptionHelper = null;
    try {
      ZoomVideoSDKUser mySelf = ZoomVideoSDK.getInstance().getSession().getMySelf();
      liveTranscriptionHelper = mySelf.getLiveTranscriptionHelper();
      if (liveTranscriptionHelper == null) {
        throw new Exception("No Live Transcription Helper Found");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return liveTranscriptionHelper;
  }

  @ReactMethod
  public void canStartLiveTranscription(Promise promise) {
    promise.resolve(getLiveTranscriptionHelper().canStartLiveTranscription());
  }

  @ReactMethod
  public void getLiveTranscriptionStatus(Promise promise) {
    promise.resolve(RNZoomVideoSdkLiveTranscriptionStatus.valueOf(getLiveTranscriptionHelper().getLiveTranscriptionStatus()));
  }

  @ReactMethod
  public void startLiveTranscription(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveTranscriptionHelper().startLiveTranscription()));
      }
    });
  }

  @ReactMethod
  public void stopLiveTranscription(Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveTranscriptionHelper().stopLiveTranscription()));
      }
    });
  }

  @ReactMethod
  public void getAvailableSpokenLanguages(Promise promise) {
    List<ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage> languageList = getLiveTranscriptionHelper().getAvailableSpokenLanguages();

    if (languageList == null) {
      promise.reject("RNZoomVideoSdkLiveTranscriptionHelper::getAvailableSpokenLanguages", "there is no available language for live transcription");
      return;
    }

    promise.resolve(RNZoomVideoSdkILiveTranscriptionLanguageModule.mapLanguageArray(languageList));
  }

  @ReactMethod
  public void setSpokenLanguage(int languageID, Promise promise) {
    promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveTranscriptionHelper().setSpokenLanguage(languageID)));
  }

  @ReactMethod
  public void getSpokenLanguage(Promise promise) {
    ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage language = getLiveTranscriptionHelper().getSpokenLanguage();

    if (language == null) {
      promise.reject("RNZoomVideoSdkLiveTranscriptionHelper::getSpokenLanguage ", "spoken language doesn't exist");
      return;
    }

    promise.resolve(RNZoomVideoSdkILiveTranscriptionLanguageModule.mapLanguage(language));
  }

  @ReactMethod
  public void getAvailableTranslationLanguages(Promise promise) {
    List<ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage> languageList = getLiveTranscriptionHelper().getAvailableTranslationLanguages();

    if (languageList == null) {
      promise.reject("RNZoomVideoSdkLiveTranscriptionHelper::getAvailableTranslationLanguages", "there is no available translation language for live transcription");
      return;
    }

    promise.resolve(RNZoomVideoSdkILiveTranscriptionLanguageModule.mapLanguageArray(languageList));
  }

  @ReactMethod
  public void setTranslationLanguage(int languageID, Promise promise) {
    promise.resolve(RNZoomVideoSDKErrors.valueOf(getLiveTranscriptionHelper().setTranslationLanguage(languageID)));
  }

  @ReactMethod
  public void getTranslationLanguage(Promise promise) {
    ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage language = getLiveTranscriptionHelper().getTranslationLanguage();

    if (language == null) {
      promise.reject("RNZoomVideoSdkLiveTranscriptionHelper::getTranslationLanguage ", "translation language doesn't exist");
      return;
    }

    promise.resolve(RNZoomVideoSdkILiveTranscriptionLanguageModule.mapLanguage(language));
  }

}
