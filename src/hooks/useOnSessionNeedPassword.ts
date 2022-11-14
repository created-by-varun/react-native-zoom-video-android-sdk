import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnSessionNeedPassword(callback: () => void) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onSessionNeedPassword,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
