import { useEffect } from 'react';
import { useZoom } from './useZoom';
import { EventType } from './useSdkEventListener';

export function useOnHostAskUnmute(callback: () => void) {
    const zoom = useZoom();
    useEffect(() => {
        const listener = zoom.addListener(EventType.onHostAskUnmute, callback);
        return () => listener.remove();
    }, [zoom, callback]);
}