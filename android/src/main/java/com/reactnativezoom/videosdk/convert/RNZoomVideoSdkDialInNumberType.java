package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKDialInNumberType;

public class RNZoomVideoSdkDialInNumberType {

    private static final Map<ZoomVideoSDKDialInNumberType, String> dialInNumberTypeMap =
            new HashMap<ZoomVideoSDKDialInNumberType, String>() {{
                put(ZoomVideoSDKDialInNumberType.ZoomVideoSDKDialInNumType_None, "ZoomVideoSDKDialInNumType_None");
                put(ZoomVideoSDKDialInNumberType.ZoomVideoSDKDialInNumType_Toll, "ZoomVideoSDKDialInNumType_Toll");
                put(ZoomVideoSDKDialInNumberType.ZoomVideoSDKDialInNumType_TollFree, "ZoomVideoSDKDialInNumType_TollFree");
            }};

    public static String valueOf(ZoomVideoSDKDialInNumberType dialInNumberType) {
        String result;
        try {
            result = (dialInNumberType != null) ? dialInNumberTypeMap.get(dialInNumberType) : null;
        } catch (NoSuchKeyException e) {
            result = null;
        }
        return result;
    }
}