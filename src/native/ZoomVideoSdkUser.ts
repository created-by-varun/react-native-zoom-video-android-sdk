import { NativeModules } from 'react-native';
import { ZoomVideoSdkVideoStatus } from './ZoomVideoSdkVideoStatus';
import { ZoomVideoSdkAudioStatus } from './ZoomVideoSdkAudioStatus';
import { ZoomVideoSdkVideoStatisticInfo } from './ZoomVideoSdkVideoStatisticInfo';
import { ZoomVideoSdkShareStatisticInfo } from './ZoomVideoSdkShareStatisticInfo';
import type { ShareStatus } from './ZoomVideoSdk';

const { RNZoomVideoSdkUser } = NativeModules;

/*
 * - Objective data types are for ease of use. In general, the user-related data is
 *   obtained when the target user is retrieved:
 *
 *    const mySelf: ZoomVideoSdkUserType  = await zoom.session.getMySelf();
 *    if (mySelf.isHost) {
 *      ...
 *    }
 *
 * - Some of the info that changes frequently needs to be retrieved by async calls
 *   and it needs to be made through the native methods:
 *
 *    const mySelf: ZoomVideoSdkUserType  = await zoom.session.getMySelf();
 *    const mySelfInstance: ZoomVideoSdkUser = new ZoommVideoSdkUser(mySelf);
 *    const fps = await mySelfInstance.videoStatisticInfo.getFps();
 *
 * - Async functions like getIsHost(), getIsManager(), getUserName return the current
 *   values whereas the corresponding object data isHost, isManager, userName contains
 *   the initial value when it's retrieved and never gets updated.
 *
 *    const mySelf: ZoomVideoSdkUser = new ZoommVideoSdkUser(await zoom.session.getMySelf());
 *    const isManager = await mySelf.getIsManager();
 *
 */

export type ZoomVideoSdkUserType = {
  // Object data types
  userId: string;
  customUserId: string;
  userName: string;
  isHost: boolean;
  isManager: boolean;
  hasMultiCamera: boolean;
  multiCameraIndex: string;

  // Class instance data types
  getIsHost: () => Promise<boolean>;
  getIsManager: () => Promise<boolean>;
  getUserName: () => Promise<string>;
  getShareStatus: () => Promise<ShareStatus>;
  videoStatus: ZoomVideoSdkVideoStatus;
  audioStatus: ZoomVideoSdkAudioStatus;
  videoStatisticInfo: ZoomVideoSdkVideoStatisticInfo;
  shareStatisticInfo: ZoomVideoSdkShareStatisticInfo;
};

export class ZoomVideoSdkUser implements ZoomVideoSdkUserType {
  userId;
  customUserId;
  userName;
  isHost;
  isManager;
  hasMultiCamera;
  multiCameraIndex;
  videoStatus;
  audioStatus;
  videoStatisticInfo;
  shareStatisticInfo;

  constructor(user: ZoomVideoSdkUserType) {
    this.userId = user.userId;
    this.customUserId = user.customUserId;
    this.userName = user.userName;
    this.isHost = user.isHost;
    this.isManager = user.isManager;
    this.hasMultiCamera = false;
    this.multiCameraIndex = '0';
    this.videoStatus = new ZoomVideoSdkVideoStatus(user.userId);
    this.audioStatus = new ZoomVideoSdkAudioStatus(user.userId);
    this.videoStatisticInfo = new ZoomVideoSdkVideoStatisticInfo(user.userId);
    this.shareStatisticInfo = new ZoomVideoSdkShareStatisticInfo(user.userId);
  }

  async getUserName() {
    return await RNZoomVideoSdkUser.getUserName(this.userId);
  }

  async getShareStatus() {
    return await RNZoomVideoSdkUser.getShareStatus(this.userId);
  }

  async getIsHost() {
    return await RNZoomVideoSdkUser.isHost(this.userId);
  }

  async getIsManager() {
    return await RNZoomVideoSdkUser.isManager(this.userId);
  }
}
