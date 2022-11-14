package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKPhoneFailedReason;

public class RNZoomVideoSdkPhoneFailedReason {
    
    
    private static final Map<ZoomVideoSDKPhoneFailedReason, String> phoneFailedReason =
    new HashMap<ZoomVideoSDKPhoneFailedReason, String>() {{
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_Block_High_Rate, "ZoomVideoSDKPhoneFailedReason_Block_High_Rate");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_Block_No_Host, "ZoomVideoSDKPhoneFailedReason_Block_No_Host");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_Block_Too_Frequent, "ZoomVideoSDKPhoneFailedReason_Block_Too_Frequent");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_Busy, "ZoomVideoSDKPhoneFailedReason_Busy");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_No_Answer, "ZoomVideoSDKPhoneFailedReason_No_Answer");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_None, "ZoomVideoSDKPhoneFailedReason_None");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_Not_Available, "ZoomVideoSDKPhoneFailedReason_Not_Available");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_Other_Fail, "ZoomVideoSDKPhoneFailedReason_Other_Fail");
      put(ZoomVideoSDKPhoneFailedReason.PhoneFailedReason_User_Hangup, "ZoomVideoSDKPhoneFailedReason_User_Hangup");
    }};

  public static String valueOf(ZoomVideoSDKPhoneFailedReason name) {
    String status;
    try {
      status = (name != null) ? phoneFailedReason.get(name) : null;
    } catch (NoSuchKeyException e) {
      status = null;
    }
    return status;
  }
}
