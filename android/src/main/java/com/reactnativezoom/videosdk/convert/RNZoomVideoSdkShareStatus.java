package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKShareStatus;

public class RNZoomVideoSdkShareStatus {

  private static final Map<ZoomVideoSDKShareStatus, String> shareStatus =
    new HashMap<ZoomVideoSDKShareStatus, String>() {{
      put(ZoomVideoSDKShareStatus.ZoomVideoSDKShareStatus_None, "ZoomVideoSDKShareStatus_None");
      put(ZoomVideoSDKShareStatus.ZoomVideoSDKShareStatus_Stop, "ZoomVideoSDKShareStatus_Stop");
      put(ZoomVideoSDKShareStatus.ZoomVideoSDKShareStatus_Start, "ZoomVideoSDKShareStatus_Start");
      put(ZoomVideoSDKShareStatus.ZoomVideoSDKShareStatus_Pause, "ZoomVideoSDKShareStatus_Pause");
      put(ZoomVideoSDKShareStatus.ZoomVideoSDKShareStatus_Resume, "ZoomVideoSDKShareStatus_Resume");
    }};

  public static String valueOf(ZoomVideoSDKShareStatus status) {
    String result;
    try {
      result = (status != null) ? shareStatus.get(status) : null;
    } catch (NoSuchKeyException e) {
      result = null;
    }
    return result;
  }

}
