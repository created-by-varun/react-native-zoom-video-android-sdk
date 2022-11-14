import { NativeModules } from 'react-native';

const { RNZoomVideoSdkVideoStatisticInfo } = NativeModules;

export type ZoomVideoSdkVideoStatisticInfoType = {
  getBpf: () => Promise<boolean>;
  getFps: () => Promise<boolean>;
  getHeight: () => Promise<boolean>;
  getWidth: () => Promise<boolean>;
};

export class ZoomVideoSdkVideoStatisticInfo
  implements ZoomVideoSdkVideoStatisticInfoType
{
  userId: string;

  constructor(userId: string) {
    this.userId = userId;
  }

  async getBpf() {
    return await RNZoomVideoSdkVideoStatisticInfo.getBpf(this.userId);
  }

  async getFps() {
    return await RNZoomVideoSdkVideoStatisticInfo.getFps(this.userId);
  }

  async getHeight() {
    return await RNZoomVideoSdkVideoStatisticInfo.getHeight(this.userId);
  }

  async getWidth() {
    return await RNZoomVideoSdkVideoStatisticInfo.getWidth(this.userId);
  }
}
