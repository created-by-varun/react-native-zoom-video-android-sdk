import { NativeModules } from 'react-native';

const { RNZoomVideoSdkSessionStatisticsInfo } = NativeModules;

export type ZoomVideoSdkSessionStatisticsInfoType = {
  audioStatisticsInfo?: () => Promise<ZoomVideoSdkSessionAudioStatisticsInfoType>;
  videoStatisticsInfo?: () => Promise<ZoomVideoSdkSessionVideoStatisticsInfoType>;
  shareStatisticsInfo?: () => Promise<ZoomVideoSdkSessionShareStatisticsInfoType>;
};

export type ZoomVideoSdkSessionAudioStatisticsInfoType = {
  audioRecvFrequency?: () => Promise<number>;
  audioRecvJitter?: () => Promise<number>;
  audioRecvLatency?: () => Promise<number>;
  audioRecvPacketLossAvg?: () => Promise<number>;
  audioRecvPacketLossMax?: () => Promise<number>;
  audioSendFrequency?: () => Promise<number>;
  audioSendJitter?: () => Promise<number>;
  audioSendLatency?: () => Promise<number>;
  audioSendPacketLossAvg?: () => Promise<number>;
  audioSendPacketLossMax?: () => Promise<number>;
};

export type ZoomVideoSdkSessionVideoStatisticsInfoType = {
  videoRecvFps?: () => Promise<number>;
  videoRecvFrameHeight?: () => Promise<number>;
  videoRecvFrameWidth?: () => Promise<number>;
  videoRecvJitter?: () => Promise<number>;
  videoRecvLatency?: () => Promise<number>;
  videoRecvPacketLossAvg?: () => Promise<number>;
  videoRecvPacketLossMax?: () => Promise<number>;
  videoSendFps?: () => Promise<number>;
  videoSendFrameHeight?: () => Promise<number>;
  videoSendFrameWidth?: () => Promise<number>;
  videoSendJitter?: () => Promise<number>;
  videoSendLatency?: () => Promise<number>;
  videoSendPacketLossAvg?: () => Promise<number>;
  videoSendPacketLossMax?: () => Promise<number>;
};

export type ZoomVideoSdkSessionShareStatisticsInfoType = {
  shareRecvFps?: () => Promise<number>;
  shareRecvFrameHeight?: () => Promise<number>;
  shareRecvFrameWidth?: () => Promise<number>;
  shareRecvJitter?: () => Promise<number>;
  shareRecvLatency?: () => Promise<number>;
  shareRecvPacketLossAvg?: () => Promise<number>;
  shareRecvPacketLossMax?: () => Promise<number>;
  shareSendFps?: () => Promise<number>;
  shareSendFrameHeight?: () => Promise<number>;
  shareSendFrameWidth?: () => Promise<number>;
  shareSendJitter?: () => Promise<number>;
  shareSendLatency?: () => Promise<number>;
  shareSendPacketLossAvg?: () => Promise<number>;
  shareSendPacketLossMax?: () => Promise<number>;
};

export class ZoomVideoSdkSessionStatisticsInfo
  implements
    ZoomVideoSdkSessionStatisticsInfoType,
    ZoomVideoSdkSessionAudioStatisticsInfoType,
    ZoomVideoSdkSessionVideoStatisticsInfoType,
    ZoomVideoSdkSessionShareStatisticsInfoType
{
  private static instance: ZoomVideoSdkSessionStatisticsInfo;

  constructor() {}

  static getInstance() {
    if (!this.instance) {
      this.instance = new this();
    }
    return this.instance;
  }

  async audioStatisticsInfo() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioStatisticsInfo();
  }

  async audioRecvFrequency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioRecvFrequency();
  }

  async audioRecvJitter() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioRecvJitter();
  }

  async audioRecvLatency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioRecvLatency();
  }

  async audioRecvPacketLossAvg() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioRecvPacketLossAvg();
  }

  async audioRecvPacketLossMax() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioRecvPacketLossMax();
  }

  async audioSendFrequency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioSendFrequency();
  }

  async audioSendJitter() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioSendJitter();
  }

  async audioSendLatency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioSendLatency();
  }

  async audioSendPacketLossAvg() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioSendPacketLossAvg();
  }

  async audioSendPacketLossMax() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getAudioSendPacketLossMax();
  }

  async videoStatisticsInfo() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoStatisticsInfo();
  }

  async videoRecvFps() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvFps();
  }

  async videoRecvFrameHeight() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvFrameHeight();
  }

  async videoRecvFrameWidth() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvFrameWidth();
  }

  async videoRecvJitter() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvJitter();
  }

  async videoRecvLatency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvLatency();
  }

  async videoRecvPacketLossAvg() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvPacketLossAvg();
  }

  async videoRecvPacketLossMax() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoRecvPacketLossMax();
  }

  async videoSendFps() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendFps();
  }

  async videoSendFrameHeight() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendFrameHeight();
  }

  async videoSendFrameWidth() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendFrameWidth();
  }

  async videoSendJitter() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendJitter();
  }

  async videoSendLatency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendLatency();
  }

  async videoSendPacketLossAvg() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendPacketLossAvg();
  }

  async videoSendPacketLossMax() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getVideoSendPacketLossMax();
  }

  async shareStatisticsInfo() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareStatisticsInfo();
  }

  async shareRecvFps() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvFps();
  }

  async shareRecvFrameHeight() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvFrameHeight();
  }

  async shareRecvFrameWidth() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvFrameWidth();
  }

  async shareRecvJitter() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvJitter();
  }

  async shareRecvLatency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvLatency();
  }

  async shareRecvPacketLossAvg() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvPacketLossAvg();
  }

  async shareRecvPacketLossMax() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareRecvPacketLossMax();
  }

  async shareSendFps() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendFps();
  }

  async shareSendFrameHeight() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendFrameHeight();
  }

  async shareSendFrameWidth() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendFrameWidth();
  }

  async shareSendJitter() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendJitter();
  }

  async shareSendLatency() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendLatency();
  }

  async shareSendPacketLossAvg() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendPacketLossAvg();
  }

  async shareSendPacketLossMax() {
    return await RNZoomVideoSdkSessionStatisticsInfo.getShareSendPacketLossMax();
  }
}
