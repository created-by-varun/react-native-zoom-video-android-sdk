import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';
import type {ZoomVideoSdkLiveTranscriptionLanguage} from "../native/ZoomVideoSdkLiveTranscriptionLanguage";

export function useOnLiveTranscriptionMsgError(
    callback: (params: {
        spokenLanguage: ZoomVideoSdkLiveTranscriptionLanguage;
        transcriptLanguage: ZoomVideoSdkLiveTranscriptionLanguage;
    }) => void
) {
    const zoom = useZoom();
    useEffect(() => {
        const listener = zoom.addListener(
            EventType.onLiveTranscriptionMsgError,
            callback
        );
        return () => listener.remove();
    }, [zoom, callback]);
}