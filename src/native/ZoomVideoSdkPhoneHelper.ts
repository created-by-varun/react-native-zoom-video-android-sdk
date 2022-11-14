import { NativeModules } from 'react-native';
import type { ZoomVideoSdkPhoneSupportCountryInfo } from './ZoomVideoSdkPhoneSupportCountryInfo';
import type { PhoneStatus } from './ZoomVideoSdk';
import type { Errors } from '../native/ZoomVideoSdk';
import type {ZoomVideoSdkSessionDialInNumberInfo} from "./ZoomVideoSdkSessionDialInNumberInfo";

const { RNZoomVideoSdkPhoneHelper } = NativeModules;

export type ZoomVideoSdkPhoneHelperType = {
  cancelInviteByPhone: () => Promise<Errors>;
  getInviteByPhoneStatus: () => Promise<PhoneStatus>;
  getSupportCountryInfo: () => Promise<ZoomVideoSdkPhoneSupportCountryInfo[]>;
  inviteByPhone: (
    countryCode: string,
    phoneNumber: string,
    name: string
  ) => Promise<Errors>;
  isSupportPhoneFeature: () => Promise<boolean>;
  getSessionDialInNumbers: () => Promise<ZoomVideoSdkSessionDialInNumberInfo[]>
};

export class ZoomVideoSdkPhoneHelper implements ZoomVideoSdkPhoneHelperType {
  inviteByPhone(countryCode: string, phoneNumber: string, name: string) {
    return RNZoomVideoSdkPhoneHelper.inviteByPhone(
      countryCode,
      phoneNumber,
      name
    );
  }

  async cancelInviteByPhone() {
    return await RNZoomVideoSdkPhoneHelper.cancelInviteByPhone();
  }

  async getInviteByPhoneStatus() {
    return await RNZoomVideoSdkPhoneHelper.getInviteByPhoneStatus();
  }

  async getSupportCountryInfo() {
    return await RNZoomVideoSdkPhoneHelper.getSupportCountryInfo();
  }

  async isSupportPhoneFeature() {
    return await RNZoomVideoSdkPhoneHelper.isSupportPhoneFeature();
  }

  async getSessionDialInNumbers() {
    return await RNZoomVideoSdkPhoneHelper.getSessionDialInNumbers();
  }
}
