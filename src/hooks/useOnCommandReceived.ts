import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnCommandReceived(
  callback: (params: { sender: string; command: string }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(EventType.onCommandReceived, callback);
    return () => listener.remove();
  }, [zoom, callback]);
}
