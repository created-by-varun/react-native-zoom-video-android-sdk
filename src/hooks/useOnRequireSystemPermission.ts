import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { SystemPermissionType } from '../native/ZoomVideoSdk';

export function useOnRequireSystemPermission(
  callback: (permissionType: SystemPermissionType) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onRequireSystemPermission,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
