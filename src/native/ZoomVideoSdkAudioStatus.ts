import { NativeModules } from 'react-native';
import type { AudioType } from './ZoomVideoSdk';

const { RNZoomVideoSdkAudioStatus } = NativeModules;

export type ZoomVideoSdkAudioStatusType = {
  isMuted: () => Promise<boolean>;
  isTalking: () => Promise<boolean>;
  getAudioType: () => Promise<AudioType>;
};

export class ZoomVideoSdkAudioStatus implements ZoomVideoSdkAudioStatusType {
  userId: string;

  constructor(userId: string) {
    this.userId = userId;
  }

  async isMuted() {
    return await RNZoomVideoSdkAudioStatus.isMuted(this.userId);
  }

  async isTalking() {
    return await RNZoomVideoSdkAudioStatus.isTalking(this.userId);
  }

  async getAudioType() {
    return await RNZoomVideoSdkAudioStatus.getAudioType(this.userId);
  }
}
