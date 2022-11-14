package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKLiveStreamStatus;

public class RNZoomVideoSdkLiveStreamStatus {

  private static final Map<ZoomVideoSDKLiveStreamStatus, String> liveStreamStatus =
    new HashMap<ZoomVideoSDKLiveStreamStatus, String>() {{
      put(ZoomVideoSDKLiveStreamStatus.ZoomVideoSDKLiveStreamStatus_None, "ZoomVideoSDKLiveStreamStatus_None");
      put(ZoomVideoSDKLiveStreamStatus.ZoomVideoSDKLiveStreamStatus_InProgress, "ZoomVideoSDKLiveStreamStatus_InProgress");
      put(ZoomVideoSDKLiveStreamStatus.ZoomVideoSDKLiveStreamStatus_Connecting, "ZoomVideoSDKLiveStreamStatus_Connecting");
      put(ZoomVideoSDKLiveStreamStatus.ZoomVideoSDKLiveStreamStatus_FailedTimeout, "ZoomVideoSDKLiveStreamStatus_FailedTimeout");
      put(ZoomVideoSDKLiveStreamStatus.ZoomVideoSDKLiveStreamStatus_StartFailed, "ZoomVideoSDKLiveStreamStatus_StartFailed");
      put(ZoomVideoSDKLiveStreamStatus.ZoomVideoSDKLiveStreamStatus_Ended, "ZoomVideoSDKLiveStreamStatus_Ended");
    }};

  public static String valueOf(ZoomVideoSDKLiveStreamStatus name) {
    String status;
    try {
      status = (name != null) ? liveStreamStatus.get(name) : null;
    } catch (NoSuchKeyException e) {
      status = null;
    }
    return status;
  }

}
