import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnError(callback: (error: any) => void) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onError, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
