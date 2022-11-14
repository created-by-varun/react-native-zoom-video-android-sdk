package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKVideoPreferenceMode;

public class RNZoomVideoSdkVideoPreferenceMode {
    
    private static final Map<String, ZoomVideoSDKVideoPreferenceMode> videoPreference = 
        new HashMap<String, ZoomVideoSDKVideoPreferenceMode>() {{
            put("ZoomVideoSDKVideoPreferenceMode_Balance", ZoomVideoSDKVideoPreferenceMode.ZoomVideoSDKVideoPreferenceMode_Balance);
            put("ZoomVideoSDKVideoPreferenceMode_Smoothness", ZoomVideoSDKVideoPreferenceMode.ZoomVideoSDKVideoPreferenceMode_Smoothness);
            put("ZoomVideoSDKVideoPreferenceMode_Sharpness", ZoomVideoSDKVideoPreferenceMode.ZoomVideoSDKVideoPreferenceMode_Sharpness);
            put("ZoomVideoSDKVideoPreferenceMode_Custom", ZoomVideoSDKVideoPreferenceMode.ZoomVideoSDKVideoPreferenceMode_Custom);
    }};

    public static ZoomVideoSDKVideoPreferenceMode valueOf(String name) {
        ZoomVideoSDKVideoPreferenceMode preference;
        try {
            preference = (name != null) ? videoPreference.get(name) : null;
        } catch (NoSuchKeyException e) {
            preference = null;
        }
        return preference;
      } 
}
