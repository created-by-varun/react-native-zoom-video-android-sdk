import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ZoomVideoSdkUserType } from '../native/ZoomVideoSdkUser';

export function useOnUserLeave(
  callback: (params: {
    remoteUsers: ZoomVideoSdkUserType[];
    leftUsers: ZoomVideoSdkUserType[];
  }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onUserLeave, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
