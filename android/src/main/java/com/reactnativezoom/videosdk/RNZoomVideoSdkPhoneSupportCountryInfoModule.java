package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkShareStatus;

import java.util.List;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKPhoneSupportCountryInfo;


public class RNZoomVideoSdkPhoneSupportCountryInfoModule extends ReactContextBaseJavaModule {
    
    private final ReactApplicationContext reactContext;

    RNZoomVideoSdkPhoneSupportCountryInfoModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNZoomVideoSdkPhoneSupportCountryInfo";
    }

    public static ReadableArray mapPhoneSupportCountryInfo(List<ZoomVideoSDKPhoneSupportCountryInfo> countryList) {
        WritableArray mappedCountryArray = new WritableNativeArray();
        for (ZoomVideoSDKPhoneSupportCountryInfo country : countryList) {
            mappedCountryArray.pushMap(mapCountry(country));
        }
        return mappedCountryArray;
    }

    public static ReadableMap mapCountry(ZoomVideoSDKPhoneSupportCountryInfo country) {
        WritableMap mappedCountry = Arguments.createMap();
        mappedCountry.putString("countryCode", country.getCountryCode());
        mappedCountry.putString("countryID", country.getCountryID());
        mappedCountry.putString("countryName", country.getCountryName());
        return mappedCountry;
    }
}
