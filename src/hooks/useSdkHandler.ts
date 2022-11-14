import { useCallback, useEffect, useRef, useState } from 'react';

import {
  InitConfig,
  JoinSessionConfig,
  ZoomVideoSdk,
} from '../native/ZoomVideoSdk';
import { ZoomVideoSdkSession } from '../native/ZoomVideoSdkSession';
import { ZoomVideoSdkUserHelper } from '../native/ZoomVideoSdkUserHelper';
import { ZoomVideoSdkChatHelper } from '../native/ZoomVideoSdkChatHelper';
import { ZoomVideoSdkShareHelper } from '../native/ZoomVideoSdkShareHelper';
import { ZoomVideoSdkLiveStreamHelper } from '../native/ZoomVideoSdkLiveStreamHelper';
import { ZoomVideoSdkAudioHelper } from '../native/ZoomVideoSdkAudioHelper';
import { ZoomVideoSdkVideoHelper } from '../native/ZoomVideoSdkVideoHelper';
import type { ZoomVideoSdkContext } from '../Context';
import { useSdkEventListener } from './useSdkEventListener';
import { ZoomVideoSdkCmdChannel } from '../native/ZoomVideoSdkCmdChannel';
import { ZoomVideoSdkRecordingHelper } from '../native/ZoomVideoSdkRecordingHelper';
import { ZoomVideoSdkPhoneHelper } from '../native/ZoomVideoSdkPhoneHelper';
import { ZoomVideoSdkAudioSettingHelper } from '../native/ZoomVideoSdkAudioSettingHelper';
import { ZoomVideoSdkTestAudioDeviceHelper } from '../native/ZoomVideoSdkTestAudioDeviceHelper';
import { ZoomVideoSdkLiveTranscriptionHelper } from '../native/ZoomVideoSdkLiveTranscriptionHelper';

const DEFAULT_CONFIG: InitConfig = {
  domain: 'zoom.us',
  enableLog: true,
};

export function useSdkHandler(config: InitConfig = {}): ZoomVideoSdkContext {
  const sdkHandler = useRef(new ZoomVideoSdk());
  const sdkSessionHandler = useRef(new ZoomVideoSdkSession());
  const sdkUserHelperHandler = useRef(new ZoomVideoSdkUserHelper());
  const sdkChatHelperHandler = useRef(new ZoomVideoSdkChatHelper());
  const sdkShareHelperHandler = useRef(new ZoomVideoSdkShareHelper());
  const sdkLiveStreamHelperHandler = useRef(new ZoomVideoSdkLiveStreamHelper());
  const sdkAudioHelperHandler = useRef(new ZoomVideoSdkAudioHelper());
  const sdkAudioSettingHelperHandler = useRef(
    new ZoomVideoSdkAudioSettingHelper()
  );
  const sdkVideoHelperHandler = useRef(new ZoomVideoSdkVideoHelper());
  const sdkCmdChannelHandler = useRef(new ZoomVideoSdkCmdChannel());
  const sdkRecordingHelperHandler = useRef(new ZoomVideoSdkRecordingHelper());
  const sdkPhoneHelperHandler = useRef(new ZoomVideoSdkPhoneHelper());
  const sdkTestAudioDeviceHelper = useRef(
    new ZoomVideoSdkTestAudioDeviceHelper()
  );
  const sdkLiveTranscriptionHelper = useRef(
    new ZoomVideoSdkLiveTranscriptionHelper()
  );

  const [isInited, setIsInited] = useState(false);
  const { addListener } = useSdkEventListener();

  useEffect(() => {
    if (!isInited) {
      sdkHandler.current.initSdk({ ...DEFAULT_CONFIG, ...config });
      setIsInited(true);
    }
  }, [config, isInited]);

  const joinSession = useCallback((joinConfig: JoinSessionConfig) => {
    return sdkHandler.current.joinSession(joinConfig);
  }, []);

  const leaveSession = useCallback((endSession: boolean = false) => {
    sdkHandler.current.leaveSession(endSession);
  }, []);

  const getSdkVersion = useCallback(() => {
    return sdkHandler.current.getSdkVersion();
  }, []);

  const isInSession = useCallback(() => {
    return sdkHandler.current.isInSession();
  }, []);

  return {
    session: sdkSessionHandler.current,
    userHelper: sdkUserHelperHandler.current,
    chatHelper: sdkChatHelperHandler.current,
    shareHelper: sdkShareHelperHandler.current,
    liveStreamHelper: sdkLiveStreamHelperHandler.current,
    audioHelper: sdkAudioHelperHandler.current,
    audioSettingHelper: sdkAudioSettingHelperHandler.current,
    videoHelper: sdkVideoHelperHandler.current,
    cmdChannel: sdkCmdChannelHandler.current,
    recordingHelper: sdkRecordingHelperHandler.current,
    phoneHelper: sdkPhoneHelperHandler.current,
    testAudioDeviceHelper: sdkTestAudioDeviceHelper.current,
    liveTranscriptionHelper: sdkLiveTranscriptionHelper.current,
    addListener,
    joinSession,
    leaveSession,
    getSdkVersion,
    isInSession,
  };
}
