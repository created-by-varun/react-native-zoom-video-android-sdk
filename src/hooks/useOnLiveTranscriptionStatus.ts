import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { LiveTranscriptionStatus } from '../native/ZoomVideoSdk';

export function useOnLiveTranscriptionStatus(
  callback: (status: LiveTranscriptionStatus) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onLiveTranscriptionStatus,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
