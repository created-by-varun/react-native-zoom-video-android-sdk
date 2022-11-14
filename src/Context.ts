import { createContext } from 'react';
import type { EmitterSubscription } from 'react-native';
import type { EventType } from './hooks/useSdkEventListener';
import type { JoinSessionConfig } from './native/ZoomVideoSdk';
import { ZoomVideoSdkSession } from './native/ZoomVideoSdkSession';
import { ZoomVideoSdkUserHelper } from './native/ZoomVideoSdkUserHelper';
import { ZoomVideoSdkChatHelper } from './native/ZoomVideoSdkChatHelper';
import { ZoomVideoSdkShareHelper } from './native/ZoomVideoSdkShareHelper';
import { ZoomVideoSdkLiveStreamHelper } from './native/ZoomVideoSdkLiveStreamHelper';
import { ZoomVideoSdkAudioHelper } from './native/ZoomVideoSdkAudioHelper';
import { ZoomVideoSdkVideoHelper } from './native/ZoomVideoSdkVideoHelper';
import { ZoomVideoSdkCmdChannel } from './native/ZoomVideoSdkCmdChannel';
import { ZoomVideoSdkRecordingHelper } from './native/ZoomVideoSdkRecordingHelper';
import { ZoomVideoSdkAudioSettingHelper } from './native/ZoomVideoSdkAudioSettingHelper';
import { ZoomVideoSdkPhoneHelper } from './native/ZoomVideoSdkPhoneHelper';
import { ZoomVideoSdkTestAudioDeviceHelper } from './native/ZoomVideoSdkTestAudioDeviceHelper';
import { ZoomVideoSdkLiveTranscriptionHelper } from './native/ZoomVideoSdkLiveTranscriptionHelper';

function throwProviderError() {
  throw new Error(
    'Cannot access the Zoom Video SDK without a ZoomVideoSdkProvider component wrapping your entire application.'
  );
}

export interface ZoomVideoSdkContext {
  addListener: (
    event: EventType,
    handler: (data?: any) => void
  ) => EmitterSubscription;
  joinSession: (config: JoinSessionConfig) => Promise<ZoomVideoSdkSession>;
  leaveSession: (endSession?: boolean) => void;
  getSdkVersion: () => Promise<string>;
  isInSession: () => Promise<boolean>;
  session: ZoomVideoSdkSession;
  userHelper: ZoomVideoSdkUserHelper;
  chatHelper: ZoomVideoSdkChatHelper;
  shareHelper: ZoomVideoSdkShareHelper;
  liveStreamHelper: ZoomVideoSdkLiveStreamHelper;
  audioHelper: ZoomVideoSdkAudioHelper;
  audioSettingHelper: ZoomVideoSdkAudioSettingHelper;
  videoHelper: ZoomVideoSdkVideoHelper;
  cmdChannel: ZoomVideoSdkCmdChannel;
  recordingHelper: ZoomVideoSdkRecordingHelper;
  phoneHelper: ZoomVideoSdkPhoneHelper;
  testAudioDeviceHelper: ZoomVideoSdkTestAudioDeviceHelper;
  liveTranscriptionHelper: ZoomVideoSdkLiveTranscriptionHelper;
}

export const Context = createContext<ZoomVideoSdkContext>({
  addListener: throwProviderError as any,
  joinSession: throwProviderError as any,
  leaveSession: throwProviderError,
  getSdkVersion: throwProviderError as any,
  isInSession: throwProviderError as any,
  session: new ZoomVideoSdkSession(),
  userHelper: new ZoomVideoSdkUserHelper(),
  chatHelper: new ZoomVideoSdkChatHelper(),
  shareHelper: new ZoomVideoSdkShareHelper(),
  liveStreamHelper: new ZoomVideoSdkLiveStreamHelper(),
  audioHelper: new ZoomVideoSdkAudioHelper(),
  audioSettingHelper: new ZoomVideoSdkAudioSettingHelper(),
  videoHelper: new ZoomVideoSdkVideoHelper(),
  cmdChannel: new ZoomVideoSdkCmdChannel(),
  recordingHelper: new ZoomVideoSdkRecordingHelper(),
  phoneHelper: new ZoomVideoSdkPhoneHelper(),
  testAudioDeviceHelper: new ZoomVideoSdkTestAudioDeviceHelper(),
  liveTranscriptionHelper: new ZoomVideoSdkLiveTranscriptionHelper(),
});
