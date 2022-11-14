import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnSessionJoin(callback: (session: any) => void) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onSessionJoin, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
