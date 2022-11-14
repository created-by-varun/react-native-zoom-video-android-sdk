package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.reactnativezoom.videosdk.RNZoomVideoSdkUserModule;
import com.reactnativezoom.videosdk.RNZoomVideoSdkChatMessageModule;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkLiveStreamStatus;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkRawDataMemoryMode;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkShareStatus;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkVideoResolution;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkPhoneFailedReason;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkPhoneStatus;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkMultiCameraStreamStatus;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkChatMessageDeleteType;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkLiveTranscriptionOperationType;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSdkLiveTranscriptionStatus;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKAudioHelper;
import us.zoom.sdk.ZoomVideoSDKAudioOption;
import us.zoom.sdk.ZoomVideoSDKAudioRawData;
import us.zoom.sdk.ZoomVideoSDKAudioStatus;
import us.zoom.sdk.ZoomVideoSDKChatHelper;
import us.zoom.sdk.ZoomVideoSDKChatMessage;
import us.zoom.sdk.ZoomVideoSDKErrors;
import us.zoom.sdk.ZoomVideoSDKInitParams;
import us.zoom.sdk.ZoomVideoSDKLiveStreamHelper;
import us.zoom.sdk.ZoomVideoSDKLiveStreamStatus;
import us.zoom.sdk.ZoomVideoSDKPasswordHandler;
import us.zoom.sdk.ZoomVideoSDKSession;
import us.zoom.sdk.ZoomVideoSDKSessionContext;
import us.zoom.sdk.ZoomVideoSDKDelegate;
import us.zoom.sdk.ZoomVideoSDKShareHelper;
import us.zoom.sdk.ZoomVideoSDKShareStatus;
import us.zoom.sdk.ZoomVideoSDKUser;
import us.zoom.sdk.ZoomVideoSDKUserHelper;
import us.zoom.sdk.ZoomVideoSDKVideoHelper;
import us.zoom.sdk.ZoomVideoSDKVideoOption;
import us.zoom.sdk.ZoomVideoSDKVideoStatus;
import us.zoom.sdk.ZoomVideoSDKRecordingStatus;
import us.zoom.sdk.ZoomVideoSDKPhoneFailedReason;
import us.zoom.sdk.ZoomVideoSDKPhoneStatus;
import us.zoom.sdk.ZoomVideoSDKVideoCanvas;
import us.zoom.sdk.ZoomVideoSDKRawDataPipe;
import us.zoom.sdk.ZoomVideoSDKMultiCameraStreamStatus;
import us.zoom.sdk.ZoomVideoSDKExtendParams;
import us.zoom.sdk.ZoomVideoSDKChatMessageDeleteType;
import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;
import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionStatus;
import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper.ZoomVideoSDKLiveTranscriptionOperationType;
import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage;
import us.zoom.sdk.ZoomVideoSDKProxySettingHandler;
import us.zoom.sdk.ZoomVideoSDKSSLCertificateInfo;

import androidx.annotation.Nullable;

import android.app.Service;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;

import java.util.List;

public class RNZoomVideoSdkModule extends ReactContextBaseJavaModule implements ZoomVideoSDKDelegate, LifecycleEventListener {

  private final String DEBUG_TAG = "ZoomVideoSdkDebug";
  private final ReactApplicationContext reactContext;

  protected Display display;
  protected DisplayMetrics displayMetrics;

  RNZoomVideoSdkModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
    reactContext.addLifecycleEventListener(this);

    display = ((WindowManager) reactContext.getSystemService(Service.WINDOW_SERVICE)).getDefaultDisplay();
    displayMetrics = new DisplayMetrics();
    display.getMetrics(displayMetrics);
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdk";
  }

  public String[] supportedEvents() {
    return new String[] {
      "onSessionJoin",
      "onSessionLeave",
      "onUserJoin",
      "onUserLeave",
      "onUserVideoStatusChanged",
      "onUserAudioStatusChanged",
      "onLiveStreamStatusChanged",
      "onUserShareStatusChanged",
      "onChatNewMessageNotify",
      "onUserNameChanged",
      "onUserHostChanged",
      "onUserManagerChanged",
      "onUserActiveAudioChanged",
      "onSessionNeedPassword",
      "onSessionPasswordWrong",
      "onError",
      "onCmdChannelConnectResult",
      "onCommandReceived",
      "onCloudRecordingStatus",
      "onHostAskUnmute",
      "onInviteByPhoneStatus",
      "onLiveTranscriptionStatus",
      "onLiveTranscriptionMsgReceived",
      "onLiveTranscriptionMsgError",
      "onChatDeleteMessageNotify",
      "onMultiCameraStreamStatusChanged",
    };
  }

  @ReactMethod
  public void initSdk(ReadableMap config, Promise promise) {
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        ZoomVideoSDKInitParams params = new ZoomVideoSDKInitParams();
        params.domain = config.getString("domain");
        params.enableLog = config.getBoolean("enableLog");

        if (config.hasKey("logFilePrefix")) {
          params.logFilePrefix = config.getString("logFilePrefix");
        }

        if (config.hasKey("enableFullHD")) {
          params.enableFullHD = config.getBoolean("enableFullHD");
        }

        params.videoRawDataMemoryMode = RNZoomVideoSdkRawDataMemoryMode.valueOf(config.getString("videoRawDataMemoryMode"));
        params.audioRawDataMemoryMode = RNZoomVideoSdkRawDataMemoryMode.valueOf(config.getString("audioRawDataMemoryMode"));
        params.shareRawDataMemoryMode = RNZoomVideoSdkRawDataMemoryMode.valueOf(config.getString("shareRawDataMemoryMode"));

        if (config.hasKey("speakerFilePath")) {
          String speakerFilePath = config.getString("speakerFilePath");
          ZoomVideoSDKExtendParams extendParams = new ZoomVideoSDKExtendParams();
          extendParams.speakerTestFilePath = speakerFilePath;
          params.extendParam = extendParams;
        }

        ZoomVideoSDK sdk = ZoomVideoSDK.getInstance();
        int initResult = sdk.initialize(reactContext.getCurrentActivity(), params);

        switch (initResult) {
          case ZoomVideoSDKErrors.Errors_Success:
            Log.d(DEBUG_TAG, "SDK initialized successfully");
            promise.resolve("SDK initialized successfully");
            break;
          default:
            Log.d(DEBUG_TAG, String.format("SDK failed to initialize with error code: %lu", initResult));
            promise.reject("sdkinit_failed", RNZoomVideoSDKErrors.valueOf(initResult), (WritableMap) null);
            break;
        }

        refreshRotation();
      }
    });
  }

  @ReactMethod
  public void joinSession(ReadableMap config, Promise promise) {
    ZoomVideoSDKAudioOption audioOption = new ZoomVideoSDKAudioOption();
    ReadableMap audioOptionConfig = config.getMap("audioOptions");
    audioOption.connect = audioOptionConfig.getBoolean("connect");
    audioOption.mute = audioOptionConfig.getBoolean("mute");

    ZoomVideoSDKVideoOption videoOption = new ZoomVideoSDKVideoOption();
    ReadableMap videoOptionConfig = config.getMap("videoOptions");
    videoOption.localVideoOn = videoOptionConfig.getBoolean("localVideoOn");

    ZoomVideoSDKSessionContext sessionContext = new ZoomVideoSDKSessionContext();
    sessionContext.sessionName = config.getString("sessionName");
    sessionContext.userName = config.getString("userName");
    sessionContext.token = config.getString("token");
    sessionContext.sessionPassword = config.getString("sessionPassword");
    sessionContext.audioOption = audioOption;
    sessionContext.videoOption = videoOption;
    sessionContext.sessionIdleTimeoutMins = config.getInt("sessionIdleTimeoutMins");

    ZoomVideoSDK.getInstance().addListener(this);

    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        try {
          ZoomVideoSDKSession session = ZoomVideoSDK.getInstance().joinSession(sessionContext);
          promise.resolve(null);
        } catch(Exception e) {
          promise.reject("joinSession_failure", "Join Session failed", (WritableMap) null);
        }
      }
    });
  }

  @ReactMethod
  public void leaveSession(boolean shouldEndSession, Promise promise) {
    ZoomVideoSDK.getInstance().removeListener(this);

    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(ZoomVideoSDK.getInstance().leaveSession(shouldEndSession)));
      }
    });
  }

  @ReactMethod
  public void getSdkVersion(Promise promise) {
    promise.resolve(ZoomVideoSDK.getInstance().getSDKVersion());
  }

  @ReactMethod
  public void isInSession(Promise promise) {
    promise.resolve(ZoomVideoSDK.getInstance().isInSession());
  }

  // -----------------------------------------------------------------------------------------------
  // region ZoomVideoSDKDelegate
  // -----------------------------------------------------------------------------------------------

  @Override
  public void onProxySettingNotification(ZoomVideoSDKProxySettingHandler handler) {
    Log.d(DEBUG_TAG, "onProxySettingNotification");
    WritableMap params = Arguments.createMap();
    params.putString("proxyHost", handler.getProxyHost());
    params.putInt("proxyPort", handler.getProxyPort());
    params.putString("proxyDescription", handler.getProxyDescription());
    sendEvent(reactContext, "onProxySettingNotification", params);
  }

  @Override
  public void onSSLCertVerifiedFailNotification(ZoomVideoSDKSSLCertificateInfo info){
    Log.d(DEBUG_TAG, "onSSLCertVerifiedFailNotification");
    WritableMap params = Arguments.createMap();
    params.putString("certIssuedTo", info.getCertIssuedTo());
    params.putString("certIssuedBy", info.getCertIssuedBy());
    params.putString("certSerialNum", info.getCertSerialNum());
    params.putString("certFingerprint", info.getCertFingerprint());
    sendEvent(reactContext, "onSSLCertVerifiedFailNotification", params);
  }

  @Override
  public void onSessionJoin() {
    WritableMap params = Arguments.createMap();
    ReadableMap mySelf = RNZoomVideoSdkUserModule.mapUser(ZoomVideoSDK.getInstance().getSession().getMySelf());
    params.putMap("mySelf", mySelf);
    sendEvent(reactContext, "onSessionJoin", params);
  }

  @Override
  public void onSessionLeave() {
    sendEvent(reactContext, "onSessionLeave", Arguments.createMap());
  }

  @Override
  public void onError(int i) {
    WritableMap params = Arguments.createMap();
    params.putString("errorType", RNZoomVideoSDKErrors.valueOf(i));
    sendEvent(reactContext, "onError", params);
  }

  @Override
  public void onUserJoin(ZoomVideoSDKUserHelper userHelper, List<ZoomVideoSDKUser> userList) {
    List<ZoomVideoSDKUser> remoteUsers = ZoomVideoSDK.getInstance().getSession().getRemoteUsers();
    WritableMap params = Arguments.createMap();
    params.putArray("joinedUsers", RNZoomVideoSdkUserModule.mapUserArray(userList));
    params.putArray("remoteUsers", RNZoomVideoSdkUserModule.mapUserArray(remoteUsers));
    sendEvent(reactContext, "onUserJoin", params);
  }

  @Override
  public void onUserLeave(ZoomVideoSDKUserHelper userHelper, List<ZoomVideoSDKUser> userList) {
    List<ZoomVideoSDKUser> remoteUsers = ZoomVideoSDK.getInstance().getSession().getRemoteUsers();
    WritableMap params = Arguments.createMap();
    params.putArray("leftUsers", RNZoomVideoSdkUserModule.mapUserArray(userList));
    params.putArray("remoteUsers", RNZoomVideoSdkUserModule.mapUserArray(remoteUsers));
    sendEvent(reactContext, "onUserLeave", params);
  }

  @Override
  public void onUserVideoStatusChanged(ZoomVideoSDKVideoHelper videoHelper, List<ZoomVideoSDKUser> userList) {
    WritableMap params = Arguments.createMap();
    params.putArray("changedUsers", RNZoomVideoSdkUserModule.mapUserArray(userList));
    sendEvent(reactContext, "onUserVideoStatusChanged", params);
  }

  @Override
  public void onUserAudioStatusChanged(ZoomVideoSDKAudioHelper audioHelper, List<ZoomVideoSDKUser> userList) {
    WritableMap params = Arguments.createMap();
    params.putArray("changedUsers", RNZoomVideoSdkUserModule.mapUserArray(userList));
    sendEvent(reactContext, "onUserAudioStatusChanged", params);
  }

  @Override
  public void onUserShareStatusChanged(ZoomVideoSDKShareHelper shareHelper, ZoomVideoSDKUser user, ZoomVideoSDKShareStatus shareStatus) {
    WritableMap params = Arguments.createMap();
    params.putMap("user", RNZoomVideoSdkUserModule.mapUser(user));
    params.putString("status", RNZoomVideoSdkShareStatus.valueOf(shareStatus));
    sendEvent(reactContext, "onUserShareStatusChanged", params);
  }

  @Override
  public void onLiveStreamStatusChanged(ZoomVideoSDKLiveStreamHelper liveStreamHelper, ZoomVideoSDKLiveStreamStatus liveStreamStatus) {
    WritableMap params = Arguments.createMap();
    params.putString("status", RNZoomVideoSdkLiveStreamStatus.valueOf(liveStreamStatus));
    sendEvent(reactContext, "onLiveStreamStatusChanged", params);
  }

  @Override
  public void onChatNewMessageNotify(ZoomVideoSDKChatHelper chatHelper, ZoomVideoSDKChatMessage chatMessage) {
    String content = chatMessage.getContent();
    ZoomVideoSDKUser sender = chatMessage.getSenderUser();
    sendEvent(reactContext, "onChatNewMessageNotify", (WritableMap) RNZoomVideoSdkChatMessageModule.mapChatMessage(chatMessage));
  }

  @Override
  public void onUserNameChanged(ZoomVideoSDKUser user) {
    WritableMap params = Arguments.createMap();
    params.putMap("changedUser", RNZoomVideoSdkUserModule.mapUser(user));
    sendEvent(reactContext, "onUserNameChanged", params);
  }

  @Override
  public void onUserHostChanged(ZoomVideoSDKUserHelper userHelper, ZoomVideoSDKUser user) {
    WritableMap params = Arguments.createMap();
    params.putMap("changedUser", RNZoomVideoSdkUserModule.mapUser(user));
    sendEvent(reactContext, "onUserHostChanged", params);
  }

  @Override
  public void onUserManagerChanged(ZoomVideoSDKUser user) {
    WritableMap params = Arguments.createMap();
    params.putMap("changedUser", RNZoomVideoSdkUserModule.mapUser(user));
    sendEvent(reactContext, "onUserManagerChanged", params);
  }

  @Override
  public void onUserActiveAudioChanged(ZoomVideoSDKAudioHelper audioHelper, List<ZoomVideoSDKUser> userList) {
    WritableMap params = Arguments.createMap();
    params.putArray("changedUsers", RNZoomVideoSdkUserModule.mapUserArray(userList));
    sendEvent(reactContext, "onUserActiveAudioChanged", params);
  }

  @Override
  public void onSessionNeedPassword(ZoomVideoSDKPasswordHandler passwordHandler) {
    passwordHandler.leaveSessionIgnorePassword();
    sendEvent(reactContext, "onSessionNeedPassword", null);
  }

  @Override
  public void onSessionPasswordWrong(ZoomVideoSDKPasswordHandler passwordHandler) {
    passwordHandler.leaveSessionIgnorePassword();
    sendEvent(reactContext, "onSessionPasswordWrong", null);
  }

  @Override
  public void onMixedAudioRawDataReceived(ZoomVideoSDKAudioRawData audioRawData) {
    Log.d(DEBUG_TAG, "onMixedAudioRawDataReceived");
  }

  @Override
  public void onOneWayAudioRawDataReceived(ZoomVideoSDKAudioRawData audioRawData, ZoomVideoSDKUser user) {
    Log.d(DEBUG_TAG, "onOneWayAudioRawDataReceived");
  }

  @Override
  public void onShareAudioRawDataReceived(ZoomVideoSDKAudioRawData audioRawData) {
    Log.d(DEBUG_TAG, "onShareAudioRawDataReceived");
  }

  @Override
  public void onCommandReceived(ZoomVideoSDKUser sender, String strCmd) {
    Log.d(DEBUG_TAG, "onCommandReceived");

    WritableMap params = Arguments.createMap();
    params.putString("sender", sender.getUserID());
    params.putString("command", strCmd);
    sendEvent(reactContext, "onCommandReceived", params);
  }

  @Override
  public void onCommandChannelConnectResult(boolean isSuccess) {
    Log.d(DEBUG_TAG, "onCommandChannelConnectResult");

    WritableMap params = Arguments.createMap();
    params.putBoolean("success", isSuccess);
    sendEvent(reactContext, "onCommandChannelConnectResult", params);
  }

  @Override
  public void onCloudRecordingStatus(ZoomVideoSDKRecordingStatus status) {
    Log.d(DEBUG_TAG, "onCloudRecordingStatus");
  }

  @Override
  public void onHostAskUnmute() {
    Log.d(DEBUG_TAG, "onHostAskUnmute");
  }

  @Override
  public void onInviteByPhoneStatus(ZoomVideoSDKPhoneStatus status, ZoomVideoSDKPhoneFailedReason reason) {
    Log.d(DEBUG_TAG, "onInviteByPhoneStatus, status: " + status + ", reason: " + reason);

    WritableMap params = Arguments.createMap();
    params.putString("status", RNZoomVideoSdkPhoneStatus.valueOf(status));
    params.putString("reason", RNZoomVideoSdkPhoneFailedReason.valueOf(reason));
    sendEvent(reactContext, "onInviteByPhoneStatus", params);
  }

  @Override
  public void onMultiCameraStreamStatusChanged(ZoomVideoSDKMultiCameraStreamStatus status, ZoomVideoSDKUser user, ZoomVideoSDKVideoCanvas canvas) {
    Log.d(DEBUG_TAG, "onMultiCameraStreamStatusChanged, VideoCanvas");

    WritableMap params = Arguments.createMap();
    params.putString("status", RNZoomVideoSdkMultiCameraStreamStatus.valueOf(status));
    params.putMap("user", RNZoomVideoSdkUserModule.mapUser(user));
    sendEvent(reactContext, "onMultiCameraStreamStatusChanged", params);
  }

  @Override
  public void onMultiCameraStreamStatusChanged(ZoomVideoSDKMultiCameraStreamStatus status, ZoomVideoSDKUser user, ZoomVideoSDKRawDataPipe videoPipe) {
    Log.d(DEBUG_TAG, "onMultiCameraStreamStatusChanged, RawDataPipe");
  }

  @Override
  public void onChatDeleteMessageNotify(ZoomVideoSDKChatHelper chatHelper, String msgID, ZoomVideoSDKChatMessageDeleteType deleteBy) {
    Log.d(DEBUG_TAG, "onChatDeleteMessageNotify, msgID: " + msgID + ", deleteBy: " + deleteBy);

    WritableMap params = Arguments.createMap();
    params.putString("msgID", msgID);
    params.putString("deleteBy", RNZoomVideoSdkChatMessageDeleteType.valueOf(deleteBy));
    sendEvent(reactContext, "onChatDeleteMessageNotify", params);
  }

  @Override
  public void onLiveTranscriptionStatus(ZoomVideoSDKLiveTranscriptionStatus status) {
    Log.d(DEBUG_TAG, "onLiveTranscriptionStatus, status: " + status);

    WritableMap params = Arguments.createMap();
    params.putString("status", RNZoomVideoSdkLiveTranscriptionStatus.valueOf(status));
    sendEvent(reactContext, "onLiveTranscriptionStatus", params);
  }

  @Override
  public void onLiveTranscriptionMsgReceived(String ltMsg, ZoomVideoSDKUser pUser,ZoomVideoSDKLiveTranscriptionOperationType type) {
    Log.d(DEBUG_TAG, "onLiveTranscriptionMsgReceived, ltMsg: " + ltMsg + ", pUser: " + pUser + ", type: " + type);

    WritableMap params = Arguments.createMap();
    params.putString("ltMsg", ltMsg);
    params.putString("pUser", pUser.getUserID());
    params.putString("type", RNZoomVideoSdkLiveTranscriptionOperationType.valueOf(type));
    sendEvent(reactContext, "onLiveTranscriptionMsgReceived", params);
  }

  @Override
  public void onLiveTranscriptionMsgError(ILiveTranscriptionLanguage spokenLanguage, ILiveTranscriptionLanguage transcriptLanguage) {
    Log.d(DEBUG_TAG, "onLiveTranscriptionMsgError, spokenLanguage: " + spokenLanguage + ", transcriptLanguage: " + transcriptLanguage);

    WritableMap params = Arguments.createMap();
    params.putString("spokenLanguage", spokenLanguage.getLTTLanguageName());
    params.putString("transcriptLanguage", transcriptLanguage.getLTTLanguageName());
    sendEvent(reactContext, "onLiveTranscriptionMsgError", params);
  }

  // -----------------------------------------------------------------------------------------------
  // endregion
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // region LifecycleEventListener
  // -----------------------------------------------------------------------------------------------

  @Override
  public void onHostResume() {
    refreshRotation();
    Log.d(DEBUG_TAG, "onHostResume");
  }

  @Override
  public void onHostPause() {
    Log.d(DEBUG_TAG, "onHostPause");
  }

  @Override
  public void onHostDestroy() {
    Log.d(DEBUG_TAG, "onHostDestroy");
  }



  // -----------------------------------------------------------------------------------------------
  // endregion
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // region Helper Methods
  // -----------------------------------------------------------------------------------------------

  protected void refreshRotation() {
    int displayRotation = display.getRotation();
    if (ZoomVideoSDK.getInstance().getVideoHelper() != null) {
      ZoomVideoSDK.getInstance().getVideoHelper().rotateMyVideo(displayRotation);
    }
  }

  private void sendEvent(ReactContext reactContext, String eventName, @Nullable WritableMap params) {
    reactContext
      .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
      .emit(eventName, params);
  }

  // -----------------------------------------------------------------------------------------------
  // endregion
  // -----------------------------------------------------------------------------------------------

}
