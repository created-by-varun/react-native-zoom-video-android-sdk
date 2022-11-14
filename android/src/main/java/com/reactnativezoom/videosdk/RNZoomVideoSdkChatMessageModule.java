package com.reactnativezoom.videosdk;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

import com.reactnativezoom.videosdk.RNZoomVideoSdkUserModule;

import us.zoom.sdk.ZoomVideoSDKChatMessage;
import us.zoom.sdk.ZoomVideoSDKUser;

public class RNZoomVideoSdkChatMessageModule extends ReactContextBaseJavaModule {
  private final ReactApplicationContext reactContext;

  RNZoomVideoSdkChatMessageModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNZoomVideoSdkChatMessage";
  }

  public static ReadableMap mapChatMessage(ZoomVideoSDKChatMessage chatMessage) {
    WritableMap mappedChatMessage = Arguments.createMap();
    ZoomVideoSDKUser receiver = chatMessage.getReceiverUser();
    if (receiver != null) {
      mappedChatMessage.putMap("receiverUser", RNZoomVideoSdkUserModule.mapUser(receiver));
    }
    mappedChatMessage.putMap("senderUser", RNZoomVideoSdkUserModule.mapUser(chatMessage.getSenderUser()));
    mappedChatMessage.putString("content", chatMessage.getContent());
    mappedChatMessage.putDouble("timestamp", chatMessage.getTimeStamp());
    mappedChatMessage.putBoolean("isChatToAll", chatMessage.isChatToAll());
    mappedChatMessage.putBoolean("isSelfSend", chatMessage.isSelfSend());
    mappedChatMessage.putString("messageID", chatMessage.getMessageId());
    return mappedChatMessage;
  }

}
