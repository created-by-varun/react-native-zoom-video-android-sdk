import * as React from 'react';
import {ZoomVideoSdkProvider} from '@zoom/react-native-videosdk';
import {NavigationContainer} from '@react-navigation/native';

import {Navigation} from './navigation';

export default function App() {
  return (
    <NavigationContainer>
      <ZoomVideoSdkProvider
        config={{
          appGroupId: 'group.test.sdk',
          domain: 'zoom.us',
          enableLog: true,
        }}>
        <Navigation />
      </ZoomVideoSdkProvider>
    </NavigationContainer>
  );
}
