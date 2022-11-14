package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKVideoAspect;

public class RNZoomVideoSdkVideoAspect {

  private static final Map<String, ZoomVideoSDKVideoAspect> videoAspect =
    new HashMap<String, ZoomVideoSDKVideoAspect>() {{
      put("ZoomVideoSDKVideoAspect_Original", ZoomVideoSDKVideoAspect.ZoomVideoSDKVideoAspect_Original);
      put("ZoomVideoSDKVideoAspect_Full_Filled", ZoomVideoSDKVideoAspect.ZoomVideoSDKVideoAspect_Full_Filled);
      put("ZoomVideoSDKVideoAspect_LetterBox", ZoomVideoSDKVideoAspect.ZoomVideoSDKVideoAspect_LetterBox);
      put("ZoomVideoSDKVideoAspect_PanAndScan", ZoomVideoSDKVideoAspect.ZoomVideoSDKVideoAspect_PanAndScan);
    }};

  public static ZoomVideoSDKVideoAspect valueOf(String name) {
    ZoomVideoSDKVideoAspect aspect;
    try {
      aspect = (name != null) ? videoAspect.get(name) : null;
    } catch (NoSuchKeyException e) {
      aspect = null;
    }
    return aspect;
  }

}
