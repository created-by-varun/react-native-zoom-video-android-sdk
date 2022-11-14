import { EventType } from './useSdkEventListener';
import { useZoom } from './useZoom';
import { useEffect } from 'react';

export function useOnProxySettingNotification(
  callback: () => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onProxySettingNotification,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
