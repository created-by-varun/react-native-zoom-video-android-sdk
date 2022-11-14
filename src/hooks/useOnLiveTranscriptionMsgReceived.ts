import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type { LiveTranscriptionOperationType } from '../native/ZoomVideoSdk';
import type {ZoomVideoSdkUser} from "../native/ZoomVideoSdkUser";

export function useOnLiveTranscriptionMsgReceived(
    callback: (params: {
        ltMsg: string;
        pUser: ZoomVideoSdkUser
        type: LiveTranscriptionOperationType;
    }) => void
) {
    const zoom = useZoom();
    useEffect(() => {
        const listener = zoom.addListener(
            EventType.onLiveTranscriptionMsgReceived,
            callback
        );
        return () => listener.remove();
    }, [zoom, callback]);
}