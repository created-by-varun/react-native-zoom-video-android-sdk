package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKChatMessageDeleteType;

public class RNZoomVideoSdkChatMessageDeleteType {

  private static final Map<ZoomVideoSDKChatMessageDeleteType, String> chatMessageDeleteType =
    new HashMap<ZoomVideoSDKChatMessageDeleteType, String>() {{
      put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_DLP, "ZoomVideoSDKChatMsgDeleteBy_NONE");
      put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_HOST, "ZoomVideoSDKChatMsgDeleteBy_SELF");
      put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_NONE, "ZoomVideoSDKChatMsgDeleteBy_HOST");
      put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_SELF, "ZoomVideoSDKChatMsgDeleteBy_DLP");
    }};

  public static String valueOf(ZoomVideoSDKChatMessageDeleteType name) {
    String status;
    try {
      status = (name != null) ? chatMessageDeleteType.get(name) : null;
    } catch (NoSuchKeyException e) {
      status = null;
    }
    return status;
  }
}
