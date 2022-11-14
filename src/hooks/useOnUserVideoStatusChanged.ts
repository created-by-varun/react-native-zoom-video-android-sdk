import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ZoomVideoSdkUserType } from '../native/ZoomVideoSdkUser';

export function useOnUserVideoStatusChanged(
  callback: (params: { changedUsers: ZoomVideoSdkUserType[] }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onUserVideoStatusChanged,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
