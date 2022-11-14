import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { PhoneStatus, PhoneFailedReason } from '../native/ZoomVideoSdk';

export function useOnInviteByPhoneStatus(
  callback: (params: { status: PhoneStatus; reason: PhoneFailedReason }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onInviteByPhoneStatus,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
