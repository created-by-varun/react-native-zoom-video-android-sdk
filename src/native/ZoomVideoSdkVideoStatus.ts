import { NativeModules, Platform } from 'react-native';

const { RNZoomVideoSdkVideoStatus } = NativeModules;

export type ZoomVideoSdkVideoStatusType = {
  hasVideoDevice: () => Promise<boolean>;
  isOn: () => Promise<boolean>;
};

export class ZoomVideoSdkVideoStatus implements ZoomVideoSdkVideoStatusType {
  userId: string;

  constructor(userId: string) {
    this.userId = userId;
  }

  async isOn() {
    return await RNZoomVideoSdkVideoStatus.isOn(this.userId);
  }

  async hasVideoDevice() {
    if (Platform.OS === 'ios') {
      return true;
    }
    return await RNZoomVideoSdkVideoStatus.hasVideoDevice(this.userId);
  }
}
