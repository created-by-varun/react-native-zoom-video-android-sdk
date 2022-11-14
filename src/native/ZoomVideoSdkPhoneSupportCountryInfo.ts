import { NativeModules } from 'react-native';

const { RNZoomVideoSdkPhoneSupportCountryInfo } = NativeModules;

export type ZoomVideoSdkPhoneSupportCountryInfoType = {
  getCountryCode: () => Promise<string>;
  getCountryID: () => Promise<string>;
  getCountryName: () => Promise<string>;
};

export class ZoomVideoSdkPhoneSupportCountryInfo
  implements ZoomVideoSdkPhoneSupportCountryInfoType
{
  private static instance: ZoomVideoSdkPhoneSupportCountryInfo;

  constructor() {}

  static getInstance() {
    if (!this.instance) {
      this.instance = new this();
    }
    return this.instance;
  }

  async getCountryCode() {
    return await RNZoomVideoSdkPhoneSupportCountryInfo.getCountryCode();
  }

  async getCountryID() {
    return await RNZoomVideoSdkPhoneSupportCountryInfo.getCountryID();
  }

  async getCountryName() {
    return await RNZoomVideoSdkPhoneSupportCountryInfo.getCountryName();
  }
}
