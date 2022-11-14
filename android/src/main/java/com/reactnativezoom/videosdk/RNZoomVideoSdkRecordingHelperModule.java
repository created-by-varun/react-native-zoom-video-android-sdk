package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkRecordingStatus;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKRecordingHelper;

public class RNZoomVideoSdkRecordingHelperModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    RNZoomVideoSdkRecordingHelperModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNZoomVideoSdkRecordingHelper";
    }

    private ZoomVideoSDKRecordingHelper getRecordingHelper() {
        ZoomVideoSDKRecordingHelper recordingHelper = null;
        try {
            recordingHelper = ZoomVideoSDK.getInstance().getRecordingHelper();
            if (recordingHelper == null) {
                throw new Exception ("Recording is not available");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recordingHelper;
    }

    @ReactMethod
    public void canStartRecording(Promise promise) {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(getRecordingHelper().canStartRecording()));
    }

    @ReactMethod
    public void startCloudRecording(Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getRecordingHelper().startCloudRecording()));
            }
        });
    }

    @ReactMethod
    public void stopCloudRecording(Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getRecordingHelper().stopCloudRecording()));
            }
        });
    }

    @ReactMethod
    public void pauseCloudRecording(Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getRecordingHelper().pauseCloudRecording()));
            }
        });
    }

    @ReactMethod
    public void resumeCloudRecording(Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getRecordingHelper().resumeCloudRecording()));
            }
        });
    }

    @ReactMethod
    public void getCloudRecordingStatus(Promise promise) {
        promise.resolve(RNZoomVideoSdkRecordingStatus.valueOf(getRecordingHelper().getCloudRecordingStatus()));
    }
}
