import { NativeModules } from 'react-native';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkTestAudioDeviceHelper } = NativeModules;

export type ZoomVideoSdkTestAudioDeviceHelperType = {
  startMicTest: () => Promise<Errors>;
  stopMicTest: () => Promise<Errors>;
  playMicTest: () => Promise<Errors>;
  startSpeakerTest: () => Promise<Errors>;
  stopSpeakerTest: () => Promise<Errors>;
};

export class ZoomVideoSdkTestAudioDeviceHelper
  implements ZoomVideoSdkTestAudioDeviceHelperType
{
  async startMicTest() {
    return await RNZoomVideoSdkTestAudioDeviceHelper.startMicTest();
  }

  async playMicTest() {
    return await RNZoomVideoSdkTestAudioDeviceHelper.playMicTest();
  }

  async startSpeakerTest() {
    return await RNZoomVideoSdkTestAudioDeviceHelper.startSpeakerTest();
  }

  async stopMicTest() {
    return await RNZoomVideoSdkTestAudioDeviceHelper.stopMicTest();
  }

  async stopSpeakerTest() {
    return await RNZoomVideoSdkTestAudioDeviceHelper.stopSpeakerTest();
  }
}
