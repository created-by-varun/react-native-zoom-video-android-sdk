import React from 'react';

import { useSdkHandler } from './hooks/useSdkHandler';
import type { InitConfig } from './native/ZoomVideoSdk';
import { Context } from './Context';

interface Props {
  config?: InitConfig;
  children?: React.ReactNode;
}

export const ZoomVideoSdkProvider: React.FC<Props> = ({ config, children }) => {
  const zoom = useSdkHandler(config);

  return <Context.Provider value={zoom}>{children}</Context.Provider>;
};
