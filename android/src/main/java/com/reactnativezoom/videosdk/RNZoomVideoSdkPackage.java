package com.reactnativezoom.videosdk;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.List;

public class RNZoomVideoSdkPackage implements ReactPackage {

  @Override
  public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
    List<ViewManager> managers = new ArrayList<>();
    managers.add(new RNZoomViewManager(reactContext));
    return managers;
  }

  @Override
  public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
    List<NativeModule> modules = new ArrayList<>();
    modules.add(new RNZoomVideoSdkModule(reactContext));
    modules.add(new RNZoomVideoSdkSessionModule(reactContext));
    modules.add(new RNZoomVideoSdkSessionStatisticsInfoModule(reactContext));
    modules.add(new RNZoomVideoSdkUserModule(reactContext));
    modules.add(new RNZoomVideoSdkUserHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkChatHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkChatMessageModule(reactContext));
    modules.add(new RNZoomVideoSdkShareHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkVideoStatusModule(reactContext));
    modules.add(new RNZoomVideoSdkAudioStatusModule(reactContext));
    modules.add(new RNZoomVideoSdkAudioHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkVideoHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkLiveStreamHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkVideoStatisticInfoModule(reactContext));
    modules.add(new RNZoomVideoSdkShareStatisticInfoModule(reactContext));
    modules.add(new RNZoomVideoSdkCmdChannelModule(reactContext));
    modules.add(new RNZoomVideoSdkRecordingHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkPhoneHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkAudioSettingHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkTestAudioDeviceHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkLiveTranscriptionHelperModule(reactContext));
    modules.add(new RNZoomVideoSdkILiveTranscriptionLanguageModule(reactContext));
    modules.add(new RNZoomVideoSdkSessionDialInNumberInfoModule(reactContext));
    return modules;
  }

}
