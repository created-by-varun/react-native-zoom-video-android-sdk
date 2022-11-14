import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { MultiCameraStreamStatus } from '../native/ZoomVideoSdk';
import type { ZoomVideoSdkUserType } from '../native/ZoomVideoSdkUser';

export function useOnMultiCameraStreamStatusChanged(
  callback: (params: {
    status: MultiCameraStreamStatus;
    user: ZoomVideoSdkUserType;
  }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onMultiCameraStreamStatusChanged,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
