import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { RecordingStatus } from '../native/ZoomVideoSdk';

export function useOnCloudRecordingStatus(
  callback: (status: RecordingStatus) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onCloudRecordingStatus,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
