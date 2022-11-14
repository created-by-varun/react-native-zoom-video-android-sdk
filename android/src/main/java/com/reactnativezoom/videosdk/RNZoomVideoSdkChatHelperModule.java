package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.reactnativezoom.videosdk.convert.RNZoomVideoSDKErrors;

import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKChatHelper;
import us.zoom.sdk.ZoomVideoSDKUser;


public class RNZoomVideoSdkChatHelperModule extends ReactContextBaseJavaModule {
  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkChatHelperModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkChatHelper";
  }

  private ZoomVideoSDKChatHelper getChatHelper() {
    ZoomVideoSDKChatHelper chatHelper = null;
    try {
      chatHelper = ZoomVideoSDK.getInstance().getChatHelper();
      if (chatHelper == null) {
        throw new Exception("No Chat Helper Available");
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return chatHelper;
  }

  @ReactMethod
  public void isChatDisabled(Promise promise) {
    ZoomVideoSDKChatHelper chatHelper = getChatHelper();
    promise.resolve(chatHelper.isChatDisabled());
  }

  @ReactMethod
  public void isPrivateChatDisabled(Promise promise) {
    ZoomVideoSDKChatHelper chatHelper = getChatHelper();
    promise.resolve(chatHelper.isPrivateChatDisabled());
  }

  @ReactMethod
  public void sendChatToUser(String userId, String message, Promise promise) {
    ZoomVideoSDKChatHelper chatHelper = getChatHelper();
    if (chatHelper.isChatDisabled() || chatHelper.isPrivateChatDisabled()) {
      return;
    }
    ZoomVideoSDKUser user = RNZoomVideoSdkUserModule.getUser(userId);

    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(chatHelper.sendChatToUser(user, message)));
      }
    });
  }

  @ReactMethod
  public void sendChatToAll(String message, Promise promise) {
    ZoomVideoSDKChatHelper chatHelper = getChatHelper();
    if (chatHelper.isChatDisabled()) {
      return;
    }
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(chatHelper.sendChatToAll(message)));
      }
    });
  }

  @ReactMethod
  public void deleteChatMessage(String msgId, Promise promise) {
    ZoomVideoSDKChatHelper chatHelper = getChatHelper();
    if (chatHelper.isChatDisabled()) {
      return;
    }
    reactContext.getCurrentActivity().runOnUiThread(new Runnable() {
      @Override
      public void run() {
        promise.resolve(RNZoomVideoSDKErrors.valueOf(chatHelper.deleteChatMessage(msgId)));
      }
    });
  }

  @ReactMethod
  public void canChatMessageBeDeleted(@androidx.annotation.NonNull String msgId, Promise promise) {
    ZoomVideoSDKChatHelper chatHelper = getChatHelper();
    if (chatHelper.isChatDisabled()) {
      return;
    }
    promise.resolve(chatHelper.canChatMessageBeDeleted(msgId));
  }

}
