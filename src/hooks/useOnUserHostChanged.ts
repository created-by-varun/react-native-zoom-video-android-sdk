import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ZoomVideoSdkUserType } from '../native/ZoomVideoSdkUser';

export function useOnUserHostChanged(
  callback: (changedUser: ZoomVideoSdkUserType) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onUserHostChanged, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
