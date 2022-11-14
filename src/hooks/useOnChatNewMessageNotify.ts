import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ZoomVideoSdkChatMessageType } from '../native/ZoomVideoSdkChatMessage';

export function useOnChatNewMessageNotify(
  callback: (newMessage: ZoomVideoSdkChatMessageType) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onChatNewMessageNotify,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
