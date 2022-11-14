import { useContext } from 'react';

import { Context } from '../Context';

export function useZoom() {
  const context = useContext(Context);

  return context;
}
