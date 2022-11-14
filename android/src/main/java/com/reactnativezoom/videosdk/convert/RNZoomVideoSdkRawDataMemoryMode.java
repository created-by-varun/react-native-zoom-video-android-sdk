package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKRawDataMemoryMode;

public class RNZoomVideoSdkRawDataMemoryMode {

  private static final Map<String, ZoomVideoSDKRawDataMemoryMode> rawDataMemoryMode =
    new HashMap<String, ZoomVideoSDKRawDataMemoryMode>() {{
      put("ZoomVideoSDKRawDataMemoryModeHeap", ZoomVideoSDKRawDataMemoryMode.ZoomVideoSDKRawDataMemoryModeHeap);
      put("ZoomVideoSDKRawDataMemoryModeStack", ZoomVideoSDKRawDataMemoryMode.ZoomVideoSDKRawDataMemoryModeStack);
    }};

  public static ZoomVideoSDKRawDataMemoryMode valueOf(String name) {
    ZoomVideoSDKRawDataMemoryMode mode;
    try {
      mode = (name != null) ? rawDataMemoryMode.get(name) : null;
    } catch (NoSuchKeyException e) {
      mode = null;
    }
    return mode;
  }

}
