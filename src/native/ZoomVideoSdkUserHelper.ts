import { NativeModules } from 'react-native';

const { RNZoomVideoSdkUserHelper } = NativeModules;

export type ZoomVideoSdkUserHelperType = {
  changeName: (name: string, userId: string) => Promise<boolean>;
  makeHost: (userId: string) => Promise<boolean>;
  makeManager: (userId: string) => Promise<boolean>;
  revokeManager: (userId: string) => Promise<boolean>;
  removeUser: (userId: string) => Promise<boolean>;
};

export class ZoomVideoSdkUserHelper implements ZoomVideoSdkUserHelperType {
  async changeName(name: string, userId: string) {
    return await RNZoomVideoSdkUserHelper.changeName(name, userId);
  }

  async makeHost(userId: string) {
    return await RNZoomVideoSdkUserHelper.makeHost(userId);
  }

  async makeManager(userId: string) {
    return await RNZoomVideoSdkUserHelper.makeManager(userId);
  }

  async revokeManager(userId: string) {
    return await RNZoomVideoSdkUserHelper.revokeManager(userId);
  }

  async removeUser(userId: string) {
    return await RNZoomVideoSdkUserHelper.removeUser(userId);
  }
}
