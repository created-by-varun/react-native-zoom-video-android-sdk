package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKSession;

public class RNZoomVideoSdkSessionStatisticsInfoModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkSessionStatisticsInfoModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkSessionStatisticsInfo";
  }

  private ZoomVideoSDKSession getSession() {
    ZoomVideoSDKSession session = null;
    try {
      session = ZoomVideoSDK.getInstance().getSession();
      if (session == null) {
        throw new Exception("No Session Found");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return session;
  }

  // -----------------------------------------------------------------------------------------------
  // region Audio Statistics Info
  // -----------------------------------------------------------------------------------------------

  @ReactMethod
  public void getAudioStatisticsInfo(Promise promise) {
    int recvFrequency = getSession().getSessionAudioStatisticInfo().getRecvFrequency();
    int recvJitter = getSession().getSessionAudioStatisticInfo().getRecvJitter();
    int recvLatency = getSession().getSessionAudioStatisticInfo().getRecvLatency();
    float recvPacketLossAvg = getSession().getSessionAudioStatisticInfo().getRecvPacketLossAvg();
    float recvPacketLossMax = getSession().getSessionAudioStatisticInfo().getRecvPacketLossMax();
    int sendFrequency = getSession().getSessionAudioStatisticInfo().getSendFrequency();
    int sendJitter = getSession().getSessionAudioStatisticInfo().getSendJitter();
    int sendLatency = getSession().getSessionAudioStatisticInfo().getSendLatency();
    float sendPacketLossAvg = getSession().getSessionAudioStatisticInfo().getSendPacketLossAvg();
    float sendPacketLossMax = getSession().getSessionAudioStatisticInfo().getSendPacketLossMax();

    WritableMap info = Arguments.createMap();
    info.putInt("recvFrequency", recvFrequency);
    info.putInt("recvJitter", recvJitter);
    info.putInt("recvLatency", recvLatency);
    info.putDouble("recvPacketLossAvg", recvPacketLossAvg);
    info.putDouble("recvPacketLossMax", recvPacketLossMax);
    info.putInt("sendFrequency", sendFrequency);
    info.putInt("sendJitter", sendJitter);
    info.putInt("sendLatency", sendLatency);
    info.putDouble("sendPacketLossAvg", sendPacketLossAvg);
    info.putDouble("sendPacketLossMax", sendPacketLossMax);

    promise.resolve(info);
  }

  @ReactMethod
  public void getAudioRecvFrequency(Promise promise) {
    int recvFrequency = getSession().getSessionAudioStatisticInfo().getRecvFrequency();
    promise.resolve(recvFrequency);
  }

  @ReactMethod
  public void getAudioRecvJitter(Promise promise) {
    int recvJitter = getSession().getSessionAudioStatisticInfo().getRecvJitter();
    promise.resolve(recvJitter);
  }

  @ReactMethod
  public void getAudioRecvLatency(Promise promise) {
    int recvLatency = getSession().getSessionAudioStatisticInfo().getRecvLatency();
    promise.resolve(recvLatency);
  }

  @ReactMethod
  public void getAudioRecvPacketLossAvg(Promise promise) {
    float recvPacketLossAvg = getSession().getSessionAudioStatisticInfo().getRecvPacketLossAvg();
    promise.resolve(recvPacketLossAvg);
  }

  @ReactMethod
  public void getAudioRecvPacketLossMax(Promise promise) {
    float recvPacketLossMax = getSession().getSessionAudioStatisticInfo().getRecvPacketLossMax();
    promise.resolve(recvPacketLossMax);
  }

  @ReactMethod
  public void getAudioSendFrequency(Promise promise) {
    int sendFrequency = getSession().getSessionAudioStatisticInfo().getSendFrequency();
    promise.resolve(sendFrequency);
  }

  @ReactMethod
  public void getAudioSendJitter(Promise promise) {
    int sendJitter = getSession().getSessionAudioStatisticInfo().getSendJitter();
    promise.resolve(sendJitter);
  }

  @ReactMethod
  public void getAudioSendLatency(Promise promise) {
    int sendLatency = getSession().getSessionAudioStatisticInfo().getSendLatency();
    promise.resolve(sendLatency);
  }

  @ReactMethod
  public void getAudioSendPacketLossAvg(Promise promise) {
    float sendPacketLossAvg = getSession().getSessionAudioStatisticInfo().getSendPacketLossAvg();
    promise.resolve(sendPacketLossAvg);
  }

  @ReactMethod
  public void getAudioSendPacketLossMax(Promise promise) {
    float sendPacketLossMax = getSession().getSessionAudioStatisticInfo().getSendPacketLossMax();
    promise.resolve(sendPacketLossMax);
  }

  // -----------------------------------------------------------------------------------------------
  // endregion
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // region Video Statistics Info
  // -----------------------------------------------------------------------------------------------

  @ReactMethod
  public void getVideoStatisticsInfo(Promise promise) {
    int recvFps = getSession().getSessionVideoStatisticInfo().getRecvFps();
    int recvFrameHeight = getSession().getSessionVideoStatisticInfo().getRecvFrameHeight();
    int recvFrameWidth = getSession().getSessionVideoStatisticInfo().getRecvFrameWidth();
    int recvJitter = getSession().getSessionVideoStatisticInfo().getRecvJitter();
    int recvLatency = getSession().getSessionVideoStatisticInfo().getRecvLatency();
    float recvPacketLossAvg = getSession().getSessionVideoStatisticInfo().getRecvPacketLossAvg();
    float recvPacketLossMax = getSession().getSessionVideoStatisticInfo().getRecvPacketLossMax();
    int sendFps = getSession().getSessionVideoStatisticInfo().getSendFps();
    int sendFrameHeight = getSession().getSessionVideoStatisticInfo().getSendFrameHeight();
    int sendFrameWidth = getSession().getSessionVideoStatisticInfo().getSendFrameWidth();
    int sendJitter = getSession().getSessionVideoStatisticInfo().getSendJitter();
    int sendLatency = getSession().getSessionVideoStatisticInfo().getSendLatency();
    float sendPacketLossAvg = getSession().getSessionVideoStatisticInfo().getSendPacketLossAvg();
    float sendPacketLossMax = getSession().getSessionVideoStatisticInfo().getSendPacketLossMax();

    WritableMap info = Arguments.createMap();
    info.putInt("recvFps", recvFps);
    info.putInt("recvFrameHeight", recvFrameHeight);
    info.putInt("recvFrameWidth", recvFrameWidth);
    info.putInt("recvJitter", recvJitter);
    info.putInt("recvLatency", recvLatency);
    info.putDouble("recvPacketLossAvg", recvPacketLossAvg);
    info.putDouble("recvPacketLossMax", recvPacketLossMax);
    info.putInt("sendFps", sendFps);
    info.putInt("sendFrameHeight", sendFrameHeight);
    info.putInt("sendFrameWidth", sendFrameWidth);
    info.putInt("sendJitter", sendJitter);
    info.putInt("sendLatency", sendLatency);
    info.putDouble("sendPacketLossAvg", sendPacketLossAvg);
    info.putDouble("sendPacketLossMax", sendPacketLossMax);

    promise.resolve(info);
  }

  @ReactMethod
  public void getVideoRecvFps(Promise promise) {
    int recvFps = getSession().getSessionVideoStatisticInfo().getRecvFps();
    promise.resolve(recvFps);
  }

  @ReactMethod
  public void getVideoRecvFrameHeight(Promise promise) {
    int recvFrameHeight = getSession().getSessionVideoStatisticInfo().getRecvFrameHeight();
    promise.resolve(recvFrameHeight);
  }

  @ReactMethod
  public void getVideoRecvFrameWidth(Promise promise) {
    int recvFrameWidth = getSession().getSessionVideoStatisticInfo().getRecvFrameWidth();
    promise.resolve(recvFrameWidth);
  }

  @ReactMethod
  public void getVideoRecvJitter(Promise promise) {
    int recvJitter = getSession().getSessionVideoStatisticInfo().getRecvJitter();
    promise.resolve(recvJitter);
  }

  @ReactMethod
  public void getVideoRecvLatency(Promise promise) {
    int recvLatency = getSession().getSessionVideoStatisticInfo().getRecvLatency();
    promise.resolve(recvLatency);
  }

  @ReactMethod
  public void getVideoRecvPacketLossAvg(Promise promise) {
    float recvPacketLossAvg = getSession().getSessionVideoStatisticInfo().getRecvPacketLossAvg();
    promise.resolve(recvPacketLossAvg);
  }

  @ReactMethod
  public void getVideoRecvPacketLossMax(Promise promise) {
    float recvPacketLossMax = getSession().getSessionVideoStatisticInfo().getRecvPacketLossMax();
    promise.resolve(recvPacketLossMax);
  }

  @ReactMethod
  public void getVideoSendFps(Promise promise) {
    int sendFps = getSession().getSessionVideoStatisticInfo().getSendFps();
    promise.resolve(sendFps);
  }

  @ReactMethod
  public void getVideoSendFrameHeight(Promise promise) {
    int sendFrameHeight = getSession().getSessionVideoStatisticInfo().getSendFrameHeight();
    promise.resolve(sendFrameHeight);
  }

  @ReactMethod
  public void getVideoSendFrameWidth(Promise promise) {
    int sendFrameWidth = getSession().getSessionVideoStatisticInfo().getSendFrameWidth();
    promise.resolve(sendFrameWidth);
  }

  @ReactMethod
  public void getVideoSendJitter(Promise promise) {
    int sendJitter = getSession().getSessionVideoStatisticInfo().getSendJitter();
    promise.resolve(sendJitter);
  }

  @ReactMethod
  public void getVideoSendLatency(Promise promise) {
    int sendLatency = getSession().getSessionVideoStatisticInfo().getSendLatency();
    promise.resolve(sendLatency);
  }

  @ReactMethod
  public void getVideoSendPacketLossAvg(Promise promise) {
    float sendPacketLossAvg = getSession().getSessionVideoStatisticInfo().getSendPacketLossAvg();
    promise.resolve(sendPacketLossAvg);
  }

  @ReactMethod
  public void getVideoSendPacketLossMax(Promise promise) {
    float sendPacketLossMax = getSession().getSessionVideoStatisticInfo().getSendPacketLossMax();
    promise.resolve(sendPacketLossMax);
  }

  // -----------------------------------------------------------------------------------------------
  // endregion
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // region Share Statistics Info
  // -----------------------------------------------------------------------------------------------

  @ReactMethod
  public void getShareStatisticsInfo(Promise promise) {
    int recvFps = getSession().getSessionShareStatisticInfo().getRecvFps();
    int recvFrameHeight = getSession().getSessionShareStatisticInfo().getRecvFrameHeight();
    int recvFrameWidth = getSession().getSessionShareStatisticInfo().getRecvFrameWidth();
    int recvJitter = getSession().getSessionShareStatisticInfo().getRecvJitter();
    int recvLatency = getSession().getSessionShareStatisticInfo().getRecvLatency();
    float recvPacketLossAvg = getSession().getSessionShareStatisticInfo().getRecvPacketLossAvg();
    float recvPacketLossMax = getSession().getSessionShareStatisticInfo().getRecvPacketLossMax();
    int sendFps = getSession().getSessionShareStatisticInfo().getSendFps();
    int sendFrameHeight = getSession().getSessionShareStatisticInfo().getSendFrameHeight();
    int sendFrameWidth = getSession().getSessionShareStatisticInfo().getSendFrameWidth();
    int sendJitter = getSession().getSessionShareStatisticInfo().getSendJitter();
    int sendLatency = getSession().getSessionShareStatisticInfo().getSendLatency();
    float sendPacketLossAvg = getSession().getSessionShareStatisticInfo().getSendPacketLossAvg();
    float sendPacketLossMax = getSession().getSessionShareStatisticInfo().getSendPacketLossMax();

    WritableMap info = Arguments.createMap();
    info.putInt("recvFps", recvFps);
    info.putInt("recvFrameHeight", recvFrameHeight);
    info.putInt("recvFrameWidth", recvFrameWidth);
    info.putInt("recvJitter", recvJitter);
    info.putInt("recvLatency", recvLatency);
    info.putDouble("recvPacketLossAvg", recvPacketLossAvg);
    info.putDouble("recvPacketLossMax", recvPacketLossMax);
    info.putInt("sendFps", sendFps);
    info.putInt("sendFrameHeight", sendFrameHeight);
    info.putInt("sendFrameWidth", sendFrameWidth);
    info.putInt("sendJitter", sendJitter);
    info.putInt("sendLatency", sendLatency);
    info.putDouble("sendPacketLossAvg", sendPacketLossAvg);
    info.putDouble("sendPacketLossMax", sendPacketLossMax);

    promise.resolve(info);
  }

  @ReactMethod
  public void getShareRecvFps(Promise promise) {
    int recvFps = getSession().getSessionShareStatisticInfo().getRecvFps();
    promise.resolve(recvFps);
  }

  @ReactMethod
  public void getShareRecvFrameHeight(Promise promise) {
    int recvFrameHeight = getSession().getSessionShareStatisticInfo().getRecvFrameHeight();
    promise.resolve(recvFrameHeight);
  }

  @ReactMethod
  public void getShareRecvFrameWidth(Promise promise) {
    int recvFrameWidth = getSession().getSessionShareStatisticInfo().getRecvFrameWidth();
    promise.resolve(recvFrameWidth);
  }

  @ReactMethod
  public void getShareRecvJitter(Promise promise) {
    int recvJitter = getSession().getSessionShareStatisticInfo().getRecvJitter();
    promise.resolve(recvJitter);
  }

  @ReactMethod
  public void getShareRecvLatency(Promise promise) {
    int recvLatency = getSession().getSessionShareStatisticInfo().getRecvLatency();
    promise.resolve(recvLatency);
  }

  @ReactMethod
  public void getShareRecvPacketLossAvg(Promise promise) {
    float recvPacketLossAvg = getSession().getSessionShareStatisticInfo().getRecvPacketLossAvg();
    promise.resolve(recvPacketLossAvg);
  }

  @ReactMethod
  public void getShareRecvPacketLossMax(Promise promise) {
    float recvPacketLossMax = getSession().getSessionShareStatisticInfo().getRecvPacketLossMax();
    promise.resolve(recvPacketLossMax);
  }

  @ReactMethod
  public void getShareSendFps(Promise promise) {
    int sendFps = getSession().getSessionShareStatisticInfo().getSendFps();
    promise.resolve(sendFps);
  }

  @ReactMethod
  public void getShareSendFrameHeight(Promise promise) {
    int sendFrameHeight = getSession().getSessionShareStatisticInfo().getSendFrameHeight();
    promise.resolve(sendFrameHeight);
  }

  @ReactMethod
  public void getShareSendFrameWidth(Promise promise) {
    int sendFrameWidth = getSession().getSessionShareStatisticInfo().getSendFrameWidth();
    promise.resolve(sendFrameWidth);
  }

  @ReactMethod
  public void getShareSendJitter(Promise promise) {
    int sendJitter = getSession().getSessionShareStatisticInfo().getSendJitter();
    promise.resolve(sendJitter);
  }

  @ReactMethod
  public void getShareSendLatency(Promise promise) {
    int sendLatency = getSession().getSessionShareStatisticInfo().getSendLatency();
    promise.resolve(sendLatency);
  }

  @ReactMethod
  public void getShareSendPacketLossAvg(Promise promise) {
    float sendPacketLossAvg = getSession().getSessionShareStatisticInfo().getSendPacketLossAvg();
    promise.resolve(sendPacketLossAvg);
  }

  @ReactMethod
  public void getShareSendPacketLossMax(Promise promise) {
    float sendPacketLossMax = getSession().getSessionShareStatisticInfo().getSendPacketLossMax();
    promise.resolve(sendPacketLossMax);
  }

  // -----------------------------------------------------------------------------------------------
  // endregion
  // -----------------------------------------------------------------------------------------------

}
