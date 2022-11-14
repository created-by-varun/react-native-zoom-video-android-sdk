package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKAudioStatus;

public class RNZoomVideoSdkAudioType {

  private static final Map<ZoomVideoSDKAudioStatus.ZoomVideoSDKAudioType, String> audioTypeStringMap =
    new HashMap<ZoomVideoSDKAudioStatus.ZoomVideoSDKAudioType, String>() {{
      put(ZoomVideoSDKAudioStatus.ZoomVideoSDKAudioType.ZoomVideoSDKAudioType_None, "ZoomVideoSDKAudioType_None");
      put(ZoomVideoSDKAudioStatus.ZoomVideoSDKAudioType.ZoomVideoSDKAudioType_VOIP, "ZoomVideoSDKAudioType_VOIP");
      put(ZoomVideoSDKAudioStatus.ZoomVideoSDKAudioType.ZoomVideoSDKAudioType_TELEPHONY, "ZoomVideoSDKAudioType_Telephony");
    }};

  public static String valueOf(ZoomVideoSDKAudioStatus.ZoomVideoSDKAudioType audioType) {
    String result;
    try {
      result = (audioType != null) ? audioTypeStringMap.get(audioType) : null;
    } catch (NoSuchKeyException e) {
      result = null;
    }
    return result;
  }

}
