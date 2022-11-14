package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKAudioSettingHelper;

public class RNZoomVideoSdkAudioSettingHelperModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    RNZoomVideoSdkAudioSettingHelperModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNZoomVideoSdkAudioSettingHelper";
    }

    private ZoomVideoSDKAudioSettingHelper getAudioSettingHelper() {
        ZoomVideoSDKAudioSettingHelper audioSettingHelper = null;

        try {
            audioSettingHelper = ZoomVideoSDK.getInstance().getAudioSettingHelper();
            if (audioSettingHelper == null) {
                throw new Exception("No Audio Setting Helper Found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return audioSettingHelper;
    }

    @ReactMethod
    public void isMicOriginalInputEnable(Promise promise) {
        promise.resolve(getAudioSettingHelper().isMicOriginalInputEnable());
    }

    @ReactMethod
    public void enableMicOriginalInput(boolean enable, Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getAudioSettingHelper().enableMicOriginalInput(enable)));
            }
        });
    }
}
