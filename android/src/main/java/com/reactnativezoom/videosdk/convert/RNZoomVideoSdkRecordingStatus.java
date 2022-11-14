package com.reactnativezoom.videosdk.convert;

import com.facebook.react.bridge.NoSuchKeyException;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKRecordingStatus;

public class RNZoomVideoSdkRecordingStatus {

    private static final Map<ZoomVideoSDKRecordingStatus, String> recordingStatus =
        new HashMap<ZoomVideoSDKRecordingStatus, String>() {{
            put(ZoomVideoSDKRecordingStatus.Recording_Start, "Recording_Start");
            put(ZoomVideoSDKRecordingStatus.Recording_Stop, "Recording_Stop");
            put(ZoomVideoSDKRecordingStatus.Recording_DiskFull, "Recording_DiskFull");
            put(ZoomVideoSDKRecordingStatus.Recording_Pause, "Recording_Pause");
        }};

    public static String valueOf(ZoomVideoSDKRecordingStatus status) {
        String result;
        try {
            result = (status != null) ? recordingStatus.get(status) : null;
        } catch (NoSuchKeyException e) {
            result = null;
        }
        return result;
    }
}
