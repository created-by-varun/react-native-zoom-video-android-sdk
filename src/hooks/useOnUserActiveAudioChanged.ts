import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ZoomVideoSdkUserType } from '../native/ZoomVideoSdkUser';

export function useOnUserActiveAudioChanged(
  callback: (params: { changedUsers: ZoomVideoSdkUserType[] }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onUserActiveAudioChanged,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
