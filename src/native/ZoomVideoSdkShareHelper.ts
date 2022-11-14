import { NativeModules } from 'react-native';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkShareHelper } = NativeModules;

export type ZoomVideoSdkShareHelperType = {
  shareScreen: () => void;
  stopShare: () => Promise<Errors>;
  lockShare: (lock: boolean) => Promise<Errors>;
};

export class ZoomVideoSdkShareHelper implements ZoomVideoSdkShareHelperType {
  shareScreen = RNZoomVideoSdkShareHelper.shareScreen;
  stopShare = RNZoomVideoSdkShareHelper.stopShare;
  lockShare = RNZoomVideoSdkShareHelper.lockShare;
  isOtherSharing = RNZoomVideoSdkShareHelper.isOtherSharing;
  isScreenSharingOut = RNZoomVideoSdkShareHelper.isScreenSharingOut;
  isShareLocked = RNZoomVideoSdkShareHelper.isShareLocked;
  isSharingOut = RNZoomVideoSdkShareHelper.isSharingOut;
}
