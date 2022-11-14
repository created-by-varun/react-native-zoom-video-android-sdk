package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;

public class RNZoomVideoSdkLiveTranscriptionStatus {

  private static final Map<ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionStatus, String> liveTranscriptionStatus =
    new HashMap<ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionStatus, String>() {{
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionStatus.ZoomVideoSDKLiveTranscription_Status_Stop, "ZoomVideoSDKLiveTranscription_Status_Stop");
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionStatus.ZoomVideoSDKLiveTranscription_Status_Start, "ZoomVideoSDKLiveTranscription_Status_Start");
    }};

  public static String valueOf(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionStatus name) {
    String status;
    try {
      status = (name != null) ? liveTranscriptionStatus .get(name) : null;
    } catch (NoSuchKeyException e) {
      status = null;
    }
    return status;
  }
}
