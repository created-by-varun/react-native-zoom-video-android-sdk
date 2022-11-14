import { EventType } from './useSdkEventListener';
import { useZoom } from './useZoom';
import { useEffect } from 'react';

export function useOnSSLCertVerifiedFailNotification(
  callback: () => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onSSLCertVerifiedFailNotification,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
