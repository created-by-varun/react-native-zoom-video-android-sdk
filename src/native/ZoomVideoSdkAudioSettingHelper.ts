import { NativeModules } from 'react-native';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkAudioSettingHelper } = NativeModules;

export type ZoomVideoSdkAudioSettingHelperType = {
  isMicOriginalInputEnable: () => Promise<boolean>;
  enableMicOriginalInput: (enable: boolean) => Promise<Errors>;
};

export class ZoomVideoSdkAudioSettingHelper
  implements ZoomVideoSdkAudioSettingHelperType
{
  async isMicOriginalInputEnable() {
    return await RNZoomVideoSdkAudioSettingHelper.isMicOriginalInputEnable();
  }

  async enableMicOriginalInput(enable: boolean) {
    return await RNZoomVideoSdkAudioSettingHelper.enableMicOriginalInput(
      enable
    );
  }
}
