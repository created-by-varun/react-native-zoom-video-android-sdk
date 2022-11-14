import { NativeModules } from 'react-native';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkAudioHelper } = NativeModules;

export type ZoomVideoSdkAudioHelperType = {
  startAudio: () => Promise<Errors>;
  stopAudio: () => Promise<Errors>;
  muteAudio: (userId: string) => Promise<Errors>;
  unmuteAudio: (userId: string) => Promise<Errors>;
  subscribe: () => Promise<Errors>;
  unsubscribe: () => Promise<Errors>;
  setSpeaker: (isOn: boolean) => Promise<number>;
  getSpeakerStatus: () => Promise<boolean>;
  canSwitchSpeaker: () => Promise<boolean>;
  resetAudioSession: () => Promise<boolean>;
  cleanAudioSession: () => void;
};

export class ZoomVideoSdkAudioHelper implements ZoomVideoSdkAudioHelperType {
  async startAudio() {
    return await RNZoomVideoSdkAudioHelper.startAudio();
  }

  async stopAudio() {
    return await RNZoomVideoSdkAudioHelper.stopAudio();
  }

  async muteAudio(userId: string) {
    return await RNZoomVideoSdkAudioHelper.muteAudio(userId);
  }

  async unmuteAudio(userId: string) {
    return await RNZoomVideoSdkAudioHelper.unmuteAudio(userId);
  }

  async subscribe() {
    return await RNZoomVideoSdkAudioHelper.subscribe();
  }

  async unsubscribe() {
    return await RNZoomVideoSdkAudioHelper.unsubscribe();
  }

  async setSpeaker(isOn: boolean) {
    return await RNZoomVideoSdkAudioHelper.setSpeaker(isOn);
  }

  async getSpeakerStatus() {
    return await RNZoomVideoSdkAudioHelper.getSpeakerStatus();
  }

  async canSwitchSpeaker() {
    return await RNZoomVideoSdkAudioHelper.canSwitchSpeaker();
  }

  async resetAudioSession() {
    return await RNZoomVideoSdkAudioHelper.resetAudioSession();
  }

  async cleanAudioSession() {
    return await RNZoomVideoSdkAudioHelper.cleanAudioSession();
  }
}
