import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnCommandChannelConnectResult(
  callback: (success: boolean) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onCommandChannelConnectResult,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
