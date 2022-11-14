package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import java.util.List;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKPhoneHelper;
import us.zoom.sdk.ZoomVideoSDKPhoneSupportCountryInfo;
import us.zoom.sdk.ZoomVideoSDKSessionDialInNumberInfo;


public class RNZoomVideoSdkPhoneHelperModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    RNZoomVideoSdkPhoneHelperModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNZoomVideoSdkPhoneHelper";
    }

    private ZoomVideoSDKPhoneHelper getPhoneHelper() {
        ZoomVideoSDKPhoneHelper phoneHelper = null;

        try {
            phoneHelper = ZoomVideoSDK.getInstance().getPhoneHelper();
            if (phoneHelper  == null) {
                throw new Exception("No Phone Helper Found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return phoneHelper;
    }

    @ReactMethod
    public void cancelInviteByPhone(Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getPhoneHelper().cancelInviteByPhone()));
            }
        });
    }

    @ReactMethod
    public void getInviteByPhoneStatus(Promise promise) {
        promise.resolve(getPhoneHelper().getInviteByPhoneStatus());
    }

    @ReactMethod
    public void getSupportCountryInfo(Promise promise) {

        List<ZoomVideoSDKPhoneSupportCountryInfo> countryList = getPhoneHelper().getSupportCountryInfo();

        if (countryList == null) {
            promise.reject("RNZoomVideoSdkPhoneHelper::getSupportCountryInfo", "Unable to get support country info");
        }

        promise.resolve(RNZoomVideoSdkPhoneSupportCountryInfoModule.mapPhoneSupportCountryInfo(countryList));
    }

    @ReactMethod
    public void inviteByPhone(String countryCode, String phoneNumber, String name, Promise promise) {
        reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                promise.resolve(RNZoomVideoSDKErrors.valueOf(getPhoneHelper().inviteByPhone(countryCode, phoneNumber, name)));
            }
        });
    }

    @ReactMethod
    public void isSupportPhoneFeature(Promise promise) {
        promise.resolve(getPhoneHelper().isSupportPhoneFeature());
    }

    @ReactMethod
    public void getSessionDialInNumbers(Promise promise) {
        List<ZoomVideoSDKSessionDialInNumberInfo> sessionDialInNumberList = getPhoneHelper().getSessionDialInNumbers();

        if (sessionDialInNumberList == null) {
            promise.reject("RNZoomVideoSdkPhoneHelper::getSessionDialInNumbers", "there is no session dial-in numbers");
            return;
        }

        promise.resolve(RNZoomVideoSdkSessionDialInNumberInfoModule.mapSessionDialInNumberInfoArray(sessionDialInNumberList));
    }
}
