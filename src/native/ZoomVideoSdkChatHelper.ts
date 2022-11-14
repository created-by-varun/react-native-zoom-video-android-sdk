import { NativeModules } from 'react-native';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkChatHelper } = NativeModules;

export type ZoomVideoSdkChatHelperType = {
  sendChatToUser: (userId: string, message: string) => Promise<Errors>;
  sendChatToAll: (message: string) => Promise<Errors>;
  deleteChatMessage: (msgId: string) => Promise<Errors>;
  canChatMessageBeDeleted: (msgId: string) => Promise<boolean>;
};

export class ZoomVideoSdkChatHelper implements ZoomVideoSdkChatHelperType {
  isChatDisabled = RNZoomVideoSdkChatHelper.isChatDisabled;
  isPrivateChatDisabled = RNZoomVideoSdkChatHelper.isPrivateChatDisabled;

  async sendChatToUser(userId: string, message: string) {
    return await RNZoomVideoSdkChatHelper.sendChatToUser(userId, message);
  }

  async sendChatToAll(message: string) {
    return await RNZoomVideoSdkChatHelper.sendChatToAll(message);
  }

  async deleteChatMessage(msgId: string) {
    if (msgId == null) {
      return;
    }
    return await RNZoomVideoSdkChatHelper.deleteChatMessage(msgId);
  }

  async canChatMessageBeDeleted(msgId: string) {
    if (msgId == null) {
      return;
    }
    return await RNZoomVideoSdkChatHelper.canChatMessageBeDeleted(msgId);
  }
}
