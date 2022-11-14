import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { ChatMessageDeleteType } from '../native/ZoomVideoSdk';

export function useOnChatNewMessageNotify(
  callback: (params: {
    messageID: string;
    deleteBy: ChatMessageDeleteType;
  }) => void
) {
  const zoom = useZoom();
  useEffect(() => {
    const listener = zoom.addListener(
      EventType.onChatDeleteMessageNotify,
      callback
    );
    return () => listener.remove();
  }, [zoom, callback]);
}
