package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;

public class RNZoomVideoSdkLiveTranscriptionOperationType {

  private static final Map<ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType, String> liveTranscriptionOperationType =
    new HashMap<ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType, String>() {{
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType.ZoomVideoSDKLiveTranscription_OperationType_None, "ZoomVideoSDKLiveTranscription_OperationType_None");
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType.ZoomVideoSDKLiveTranscription_OperationType_Update, "ZoomVideoSDKLiveTranscription_OperationType_Update");
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType.ZoomVideoSDKLiveTranscription_OperationType_Delete, "ZoomVideoSDKLiveTranscription_OperationType_Delete");
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType.ZoomVideoSDKLiveTranscription_OperationType_Complete, "ZoomVideoSDKLiveTranscription_OperationType_Complete");
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType.ZoomVideoSDKLiveTranscription_OperationType_Add, "ZoomVideoSDKLiveTranscription_OperationType_Add");
      put(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType.ZoomVideoSDKLiveTranscription_OperationType_NotSupported, "ZoomVideoSDKLiveTranscription_OperationType_NotSupported");
    }};

  public static String valueOf(ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType name) {
    String status;
    try {
      status = (name != null) ? liveTranscriptionOperationType.get(name) : null;
    } catch (NoSuchKeyException e) {
      status = null;
    }
    return status;
  }
}
