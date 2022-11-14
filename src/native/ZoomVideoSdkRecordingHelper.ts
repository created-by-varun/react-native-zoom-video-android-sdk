import { NativeModules } from 'react-native';
import type { RecordingStatus } from './ZoomVideoSdk';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkRecordingHelper } = NativeModules;

export type ZoomVideoSdkRecordingHelperType = {
  canStartRecording: () => Promise<Errors>;
  startCloudRecording: () => Promise<Errors>;
  stopCloudRecording: () => Promise<Errors>;
  pauseCloudRecording: () => Promise<Errors>;
  resumeCloudRecording: () => Promise<Errors>;
  getCloudRecordingStatus: () => Promise<RecordingStatus>;
};

export class ZoomVideoSdkRecordingHelper
  implements ZoomVideoSdkRecordingHelperType
{
  async canStartRecording() {
    return await RNZoomVideoSdkRecordingHelper.canStartRecording();
  }

  async startCloudRecording() {
    return await RNZoomVideoSdkRecordingHelper.startCloudRecording();
  }

  async stopCloudRecording() {
    return await RNZoomVideoSdkRecordingHelper.stopCloudRecording();
  }

  async pauseCloudRecording() {
    return await RNZoomVideoSdkRecordingHelper.pauseCloudRecording();
  }

  async resumeCloudRecording() {
    return await RNZoomVideoSdkRecordingHelper.resumeCloudRecording();
  }

  async getCloudRecordingStatus() {
    return await RNZoomVideoSdkRecordingHelper.getCloudRecordingStatus();
  }
}
