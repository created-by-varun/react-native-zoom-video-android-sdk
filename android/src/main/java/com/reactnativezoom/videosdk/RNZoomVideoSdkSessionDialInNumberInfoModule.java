package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkDialInNumberType;

import java.util.List;

import us.zoom.sdk.ZoomVideoSDKSessionDialInNumberInfo;

public class RNZoomVideoSdkSessionDialInNumberInfoModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkSessionDialInNumberInfoModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkSessionDialInNumberInfo";
  }

  public static ReadableMap mapSessionDialInNumberInfo(ZoomVideoSDKSessionDialInNumberInfo sessionDialInNumberInfo) {
    WritableMap mappedDialInNumberInfo = Arguments.createMap();
    mappedDialInNumberInfo.putString("countryId", sessionDialInNumberInfo.getCountryId());
    mappedDialInNumberInfo.putString("countryCode", sessionDialInNumberInfo.getCountryCode());
    mappedDialInNumberInfo.putString("countryName", sessionDialInNumberInfo.getCountryName());
    mappedDialInNumberInfo.putString("number", sessionDialInNumberInfo.getNumber());
    mappedDialInNumberInfo.putString("displayNumber", sessionDialInNumberInfo.getDisplayNumber());
    mappedDialInNumberInfo.putString("type", RNZoomVideoSdkDialInNumberType.valueOf(sessionDialInNumberInfo.getType()));
    return mappedDialInNumberInfo;
  }

  public static ReadableArray mapSessionDialInNumberInfoArray(List<ZoomVideoSDKSessionDialInNumberInfo> dialInNumberInfoList) {
    WritableArray mapSessionDialInNumberInfoArray = new WritableNativeArray();
    for (ZoomVideoSDKSessionDialInNumberInfo dialInNumberInfo : dialInNumberInfoList) {
      mapSessionDialInNumberInfoArray.pushMap(mapSessionDialInNumberInfo(dialInNumberInfo));
    }
    return mapSessionDialInNumberInfoArray;
  }

}
