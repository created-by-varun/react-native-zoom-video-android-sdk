import { NativeModules } from 'react-native';

const { RNZoomVideoSdkShareStatisticInfo } = NativeModules;

export type ZoomVideoSdkShareStatisticInfoType = {
  getBpf: () => Promise<boolean>;
  getFps: () => Promise<boolean>;
  getHeight: () => Promise<boolean>;
  getWidth: () => Promise<boolean>;
};

export class ZoomVideoSdkShareStatisticInfo
  implements ZoomVideoSdkShareStatisticInfoType
{
  userId: string;

  constructor(userId: string) {
    this.userId = userId;
  }

  async getBpf() {
    return await RNZoomVideoSdkShareStatisticInfo.getBpf(this.userId);
  }

  async getFps() {
    return await RNZoomVideoSdkShareStatisticInfo.getFps(this.userId);
  }

  async getHeight() {
    return await RNZoomVideoSdkShareStatisticInfo.getHeight(this.userId);
  }

  async getWidth() {
    return await RNZoomVideoSdkShareStatisticInfo.getWidth(this.userId);
  }
}
