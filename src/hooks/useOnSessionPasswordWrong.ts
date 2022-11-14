import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnSessionPasswordWrong(callback: () => void) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onSessionPasswordWrong,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
