package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;

import java.util.List;

import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;

public class RNZoomVideoSdkILiveTranscriptionLanguageModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkILiveTranscriptionLanguageModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RZoomVideoSdkNILiveTranscriptionLanguageModule";
  }


  public static ReadableArray mapLanguageArray(List<ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage> languageList) {
    WritableArray mapLanguageArray = new WritableNativeArray();
    for (ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage language : languageList) {
      mapLanguageArray.pushMap(mapLanguage(language));
    }
    return mapLanguageArray;
  }

  public static ReadableMap mapLanguage(ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage language) {
    WritableMap mappedLanguage = Arguments.createMap();
    mappedLanguage.putInt("languageId", language.getLTTLanguageID());
    mappedLanguage.putString("languageName", language.getLTTLanguageName());
    return mappedLanguage;
  }

}
