import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnSessionLeave(callback: () => void) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onSessionLeave, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
