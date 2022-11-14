import { ZoomVideoSdkUser, ZoomVideoSdkUserType } from './ZoomVideoSdkUser';

export type ZoomVideoSdkChatMessageType = {
  content: string;
  receiverUser?: ZoomVideoSdkUserType;
  senderUser: ZoomVideoSdkUserType;
  timestamp: number;
  isSelfSend: boolean;
  isChatToAll: boolean;
  messageID: string;
};

export class ZoomVideoSdkChatMessage implements ZoomVideoSdkChatMessageType {
  content;
  receiverUser;
  senderUser;
  timestamp;
  isSelfSend;
  isChatToAll;
  messageID;

  constructor(chatMessage: ZoomVideoSdkChatMessageType) {
    this.content = chatMessage.content;
    this.receiverUser = chatMessage.receiverUser
      ? new ZoomVideoSdkUser(chatMessage.receiverUser)
      : undefined;
    this.senderUser = new ZoomVideoSdkUser(chatMessage.senderUser);
    this.timestamp = chatMessage.timestamp;
    this.isSelfSend = chatMessage.isSelfSend;
    this.isChatToAll = chatMessage.isChatToAll;
    this.messageID = chatMessage.messageID;
  }
}
