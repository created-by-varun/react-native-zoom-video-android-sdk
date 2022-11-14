import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { LiveStreamStatus } from '../native/ZoomVideoSdk';

export function useOnLiveStreamStatusChanged(
  callback: (status: LiveStreamStatus) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onLiveStreamStatusChanged,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
