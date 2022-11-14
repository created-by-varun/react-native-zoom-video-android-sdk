import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ZoomVideoSdkUserType } from '../native/ZoomVideoSdkUser';

export function useOnUserJoin(
  callback: (params: { remoteUsers: ZoomVideoSdkUserType[] }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onUserJoin, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
