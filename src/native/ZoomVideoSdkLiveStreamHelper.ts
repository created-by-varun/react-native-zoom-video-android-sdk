import { NativeModules } from 'react-native';
import type { Errors } from '../native/ZoomVideoSdk';

const { RNZoomVideoSdkLiveStreamHelper } = NativeModules;

export type ZoomVideoSdkLiveStreamHelperType = {
  canStartLiveStream: () => Promise<Errors>;
  startLiveStream: (
    streamUrl: string,
    streamKey: string,
    broadcastUrl: string
  ) => Promise<Errors>;
  stopLiveStream: () => Promise<Errors>;
};

export class ZoomVideoSdkLiveStreamHelper
  implements ZoomVideoSdkLiveStreamHelperType
{
  async canStartLiveStream() {
    return await RNZoomVideoSdkLiveStreamHelper.canStartLiveStream();
  }

  async startLiveStream(
    streamUrl: string,
    streamKey: string,
    broadcastUrl: string
  ) {
    return await RNZoomVideoSdkLiveStreamHelper.startLiveStream(
      streamUrl,
      streamKey,
      broadcastUrl
    );
  }

  async stopLiveStream() {
    return await RNZoomVideoSdkLiveStreamHelper.stopLiveStream();
  }
}
