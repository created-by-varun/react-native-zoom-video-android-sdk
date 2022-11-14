package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKCmdChannel;
import us.zoom.sdk.ZoomVideoSDKUser;

public class RNZoomVideoSdkCmdChannelModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    RNZoomVideoSdkCmdChannelModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNZoomVideoSdkCmdChannel";
    }

    private ZoomVideoSDKCmdChannel getCmdChannel() {
        ZoomVideoSDKCmdChannel cmdChannel = null;
        try {
            cmdChannel = ZoomVideoSDK.getInstance().getCmdChannel();
            if (cmdChannel == null) {
                throw new Exception("Command channel is not available");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cmdChannel;
    }

    @ReactMethod
    public void sendCommand(String receiverId, String strCmd, Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                ZoomVideoSDKCmdChannel cmdChannel = getCmdChannel();
                ZoomVideoSDKUser receiver = null;
                if (receiverId != null) {
                    receiver = RNZoomVideoSdkUserModule.getUser(receiverId);
                }
                promise.resolve(RNZoomVideoSDKErrors.valueOf(cmdChannel.sendCommand(receiver, strCmd)));
            }
        });
    }
}
