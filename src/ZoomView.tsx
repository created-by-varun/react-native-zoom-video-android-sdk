import React from 'react';
import { requireNativeComponent, ViewProps } from 'react-native';
import type { VideoAspect } from './native/ZoomVideoSdk';

type ZoomViewProps = {
  userId: string | null;
  sharing?: boolean;
  preview?: boolean;
  fullScreen?: boolean;
  videoAspect?: VideoAspect;
  hasMultiCamera?: boolean;
  multiCameraIndex?: string | null;
} & ViewProps;

const NativeZoomView = requireNativeComponent<ZoomViewProps>('RNZoomView');

export const ZoomView = (props: ZoomViewProps) => {
  if (!props.userId) return null;

  return <NativeZoomView {...props} />;
};
