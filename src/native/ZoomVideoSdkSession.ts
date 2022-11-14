import { NativeModules } from 'react-native';

import { ZoomVideoSdkUser } from './ZoomVideoSdkUser';
import {
  ZoomVideoSdkSessionStatisticsInfo,
  ZoomVideoSdkSessionAudioStatisticsInfoType,
  ZoomVideoSdkSessionVideoStatisticsInfoType,
  ZoomVideoSdkSessionShareStatisticsInfoType,
} from './ZoomVideoSdkSessionStatisticsInfo';

const { RNZoomVideoSdkSession } = NativeModules;

export type ZoomVideoSdkSessionType = {
  getSessionName: () => Promise<string>;
  getSessionID: () => Promise<string>;
  getSessionPassword: () => Promise<string>;
  getSessionHostName: () => Promise<string>;
  getSessionHost: () => Promise<ZoomVideoSdkUser>;
  getRemoteUsers: () => Promise<ZoomVideoSdkUser[]>;
  getMySelf: () => Promise<ZoomVideoSdkUser>;
  getSessionNumber: () => Promise<string>;
  getSessionPhonePasscode: () => Promise<string>;
  getAudioStatisticsInfo: () => Promise<ZoomVideoSdkSessionAudioStatisticsInfoType>;
  getAudioRecvFrequency: () => Promise<number>;
  getAudioRecvJitter: () => Promise<number>;
  getAudioRecvLatency: () => Promise<number>;
  getAudioRecvPacketLossAvg: () => Promise<number>;
  getAudioRecvPacketLossMax: () => Promise<number>;
  getAudioSendFrequency: () => Promise<number>;
  getAudioSendJitter: () => Promise<number>;
  getAudioSendLatency: () => Promise<number>;
  getAudioSendPacketLossAvg: () => Promise<number>;
  getAudioSendPacketLossMax: () => Promise<number>;
  getVideoStatisticsInfo: () => Promise<ZoomVideoSdkSessionVideoStatisticsInfoType>;
  getVideoRecvFps: () => Promise<number>;
  getVideoRecvFrameHeight: () => Promise<number>;
  getVideoRecvFrameWidth: () => Promise<number>;
  getVideoRecvJitter: () => Promise<number>;
  getVideoRecvLatency: () => Promise<number>;
  getVideoRecvPacketLossAvg: () => Promise<number>;
  getVideoRecvPacketLossMax: () => Promise<number>;
  getVideoSendFps: () => Promise<number>;
  getVideoSendFrameHeight: () => Promise<number>;
  getVideoSendFrameWidth: () => Promise<number>;
  getVideoSendJitter: () => Promise<number>;
  getVideoSendLatency: () => Promise<number>;
  getVideoSendPacketLossAvg: () => Promise<number>;
  getVideoSendPacketLossMax: () => Promise<number>;
  getShareStatisticsInfo: () => Promise<ZoomVideoSdkSessionShareStatisticsInfoType>;
  getShareRecvFps: () => Promise<number>;
  getShareRecvFrameHeight: () => Promise<number>;
  getShareRecvFrameWidth: () => Promise<number>;
  getShareRecvJitter: () => Promise<number>;
  getShareRecvLatency: () => Promise<number>;
  getShareRecvPacketLossAvg: () => Promise<number>;
  getShareRecvPacketLossMax: () => Promise<number>;
  getShareSendFps: () => Promise<number>;
  getShareSendFrameHeight: () => Promise<number>;
  getShareSendFrameWidth: () => Promise<number>;
  getShareSendJitter: () => Promise<number>;
  getShareSendLatency: () => Promise<number>;
  getShareSendPacketLossAvg: () => Promise<number>;
  getShareSendPacketLossMax: () => Promise<number>;
};

export class ZoomVideoSdkSession implements ZoomVideoSdkSessionType {

  async getSessionName() {
    const sessionName = await RNZoomVideoSdkSession.getSessionName();

    return sessionName;
  }

  async getSessionPassword() {
    const sessionPassword = await RNZoomVideoSdkSession.getSessionPassword();

    return sessionPassword;
  }

  async getSessionHostName() {
    const sessionHostName = await RNZoomVideoSdkSession.getSessionHostName();

    return sessionHostName;
  }

  async getSessionID() {
    const sessionID = await RNZoomVideoSdkSession.getSessionID();

    return sessionID;
  }

  async getSessionHost() {
    const user = await RNZoomVideoSdkSession.getSessionHost();

    return new ZoomVideoSdkUser(user);
  }

  async getRemoteUsers() {
    const users = await RNZoomVideoSdkSession.getRemoteUsers();

    return users.map((user: ZoomVideoSdkUser) => new ZoomVideoSdkUser(user));
  }

  async getMySelf() {
    const user = await RNZoomVideoSdkSession.getMySelf();

    return new ZoomVideoSdkUser(user);
  }

  async getSessionNumber() {
    const sessionNumber = await RNZoomVideoSdkSession.getSessionNumber();

    return sessionNumber;
  }

  async getSessionPhonePasscode() {
    const sessionPhonePasscode = await RNZoomVideoSdkSession.getSessionPhonePasscode();

    return sessionPhonePasscode;
  }

  async getAudioStatisticsInfo() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioStatisticsInfo();
  }

  async getAudioRecvFrequency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioRecvFrequency();
  }

  async getAudioRecvJitter() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioRecvJitter();
  }

  async getAudioRecvLatency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioRecvLatency();
  }

  async getAudioRecvPacketLossAvg() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioRecvPacketLossAvg();
  }

  async getAudioRecvPacketLossMax() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioRecvPacketLossMax();
  }

  async getAudioSendFrequency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioSendFrequency();
  }

  async getAudioSendJitter() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioSendJitter();
  }

  async getAudioSendLatency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioSendLatency();
  }

  async getAudioSendPacketLossAvg() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioSendPacketLossAvg();
  }

  async getAudioSendPacketLossMax() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.audioSendPacketLossMax();
  }

  async getVideoStatisticsInfo() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoStatisticsInfo();
  }

  async getVideoRecvFps() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvFps();
  }

  async getVideoRecvFrameHeight() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvFrameHeight();
  }

  async getVideoRecvFrameWidth() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvFrameWidth();
  }

  async getVideoRecvJitter() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvJitter();
  }

  async getVideoRecvLatency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvLatency();
  }

  async getVideoRecvPacketLossAvg() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvPacketLossAvg();
  }

  async getVideoRecvPacketLossMax() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoRecvPacketLossMax();
  }

  async getVideoSendFps() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendFps();
  }

  async getVideoSendFrameHeight() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendFrameHeight();
  }

  async getVideoSendFrameWidth() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendFrameWidth();
  }

  async getVideoSendJitter() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendJitter();
  }

  async getVideoSendLatency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendLatency();
  }

  async getVideoSendPacketLossAvg() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendPacketLossAvg();
  }

  async getVideoSendPacketLossMax() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.videoSendPacketLossMax();
  }

  async getShareStatisticsInfo() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareStatisticsInfo();
  }

  async getShareRecvFps() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvFps();
  }

  async getShareRecvFrameHeight() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvFrameHeight();
  }

  async getShareRecvFrameWidth() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvFrameWidth();
  }

  async getShareRecvJitter() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvJitter();
  }

  async getShareRecvLatency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvLatency();
  }

  async getShareRecvPacketLossAvg() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvPacketLossAvg();
  }

  async getShareRecvPacketLossMax() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareRecvPacketLossMax();
  }

  async getShareSendFps() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendFps();
  }

  async getShareSendFrameHeight() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendFrameHeight();
  }

  async getShareSendFrameWidth() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendFrameWidth();
  }

  async getShareSendJitter() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendJitter();
  }

  async getShareSendLatency() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendLatency();
  }

  async getShareSendPacketLossAvg() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendPacketLossAvg();
  }

  async getShareSendPacketLossMax() {
    const info = new ZoomVideoSdkSessionStatisticsInfo();

    return info.shareSendPacketLossMax();
  }
}
