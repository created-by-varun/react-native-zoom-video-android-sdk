package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.List;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKSession;
import us.zoom.sdk.ZoomVideoSDKUser;


public class RNZoomVideoSdkSessionModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkSessionModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkSession";
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

  @ReactMethod
  public void getMySelf(Promise promise) {
    ZoomVideoSDKUser mySelf = getSession().getMySelf();

    if (mySelf == null) {
      promise.reject("RNZoomVideoSdkSession::getMySelf ", "mySelf doesn't exist in the session");
      return;
    }

    promise.resolve(RNZoomVideoSdkUserModule.mapUser(mySelf));
  }

  @ReactMethod
  public void getRemoteUsers(Promise promise) {
    List<ZoomVideoSDKUser> remoteUsers = getSession().getRemoteUsers();

    if (remoteUsers == null) {
      promise.reject("RNZoomVideoSdkSession::getRemoteUsers", "remote users don't exist in the session");
      return;
    }

    promise.resolve(RNZoomVideoSdkUserModule.mapUserArray(remoteUsers));
  }

  @ReactMethod
  public void getSessionHost(Promise promise) {
    ZoomVideoSDKUser hostUser = getSession().getSessionHost();

    if (hostUser == null) {
      promise.reject("RNZoomVideoSdkSession::getSessionHost", "host user doesn't exist in the session");
      return;
    }

    promise.resolve(RNZoomVideoSdkUserModule.mapUser(hostUser));
  }

  @ReactMethod
  public void getSessionHostName(Promise promise) {
    String hostName = getSession().getSessionHostName();

    if (hostName == null) {
      promise.reject("RNZoomVideoSdkSession::getSessionHostName", "host name doesn't exist");
    }

    promise.resolve(hostName);
  }

  @ReactMethod
  public void getSessionName(Promise promise) {
    String sessionName = getSession().getSessionName();

    if (sessionName == null) {
      promise.reject("RNZoomVideoSdkSession::getSessionName", "session name doesn't exist");
    }

    promise.resolve(sessionName);
  }

  @ReactMethod
  public void getSessionID(Promise promise) {
    String sessionID = getSession().getSessionID();

    if (sessionID == null) {
      promise.reject("RNZoomVideoSdkSession::getSessionID", "session ID does not exist");
    }

    promise.resolve(sessionID);
  }

  @ReactMethod
  public void getSessionPassword(Promise promise) {
    String sessionPassword = getSession().getSessionPassword();

    if (sessionPassword == null) {
      promise.reject("RNZoomVideoSdkSession::getSessionPassword", "session password doesn't exist");
    }

    promise.resolve(sessionPassword);
  }

  @ReactMethod
  public void getSessionNumber(Promise promise) {
    long sessionNumber = getSession().getSessionNumber();
    promise.resolve(Long.toString(sessionNumber));

  }

  @ReactMethod
  public void getSessionPhonePasscode(Promise promise) {
    String sessionPhonePasscode = getSession().getSessionPhonePasscode();
    if (sessionPhonePasscode == null) {
      promise.reject("RNZoomVideoSdkSession::getSessionPhonePasscode", "session passcode doesn't exist");
    }
    promise.resolve(sessionPhonePasscode);

  }

  @ReactMethod
  public void getSessionShareStatisticInfo(Promise promise) {
    /* No-op: RNZoomVideoSdkSessionStatisticsInfoModule */
  }

  @ReactMethod
  public void getSessionVideoStatisticInfo(Promise promise) {
    /* No-op: RNZoomVideoSdkSessionStatisticsInfoModule */
  }

  @ReactMethod
  public void getSessionAudioStatisticInfo(Promise promise) {
    /* No-op: RNZoomVideoSdkSessionStatisticsInfoModule */
  }

}
