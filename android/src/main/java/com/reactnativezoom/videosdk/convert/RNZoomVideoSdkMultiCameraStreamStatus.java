package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKMultiCameraStreamStatus;

public class RNZoomVideoSdkMultiCameraStreamStatus {

  private static final Map<ZoomVideoSDKMultiCameraStreamStatus, String> multiCameraStreamStatus =
  new HashMap<ZoomVideoSDKMultiCameraStreamStatus, String>() {{
    put(ZoomVideoSDKMultiCameraStreamStatus.Status_Joined, "ZoomVideoSDKMultiCameraStreamStatus_Joined");
    put(ZoomVideoSDKMultiCameraStreamStatus.Status_Left, "ZoomVideoSDKMultiCameraStreamStatus_Left");
  }};

  public static String valueOf(ZoomVideoSDKMultiCameraStreamStatus name) {
    String status;
    try {
      status = (name != null) ? multiCameraStreamStatus.get(name) : null;
    } catch (NoSuchKeyException e) {
      status = null;
    }
    return status;
  }
}
