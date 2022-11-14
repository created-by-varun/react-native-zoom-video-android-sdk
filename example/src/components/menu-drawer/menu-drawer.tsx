import React, { useEffect, useState } from 'react';
import {
  View,
  SafeAreaView,
  Text,
  TouchableOpacity,
  Linking,
  StyleSheet,
  Platform,
  Alert,
  ActionSheetIOS,
} from 'react-native';
import { Icon } from '../icon';
import {
  DrawerContentScrollView,
  useDrawerStatus,
} from '@react-navigation/drawer';

import { useZoom } from '@zoom/react-native-videosdk';

const SDK_URL = 'https://marketplace.zoom.us';

function VersionText() {
  const [version, setVersion] = useState('');
  const zoom = useZoom();
  const isDrawerOpen = useDrawerStatus() === 'open';

  useEffect(() => {
    isDrawerOpen && zoom.getSdkVersion().then((v: string) => setVersion(v));
  }, [zoom, isDrawerOpen]);

  return <Text style={styles.version}>Version: {version}</Text>;
}

export function MenuDrawer() {
  const zoom = useZoom();
  const onPressAudioTest = async () => {
    let options = [
      {
        text: 'Start Mic Test',
        onPress: async () => {
          const error = await zoom.testAudioDeviceHelper.startMicTest();
          console.log(error);
        },
      },
      {
        text: 'Stop Mic Test',
        onPress: async () => {
          const error = await zoom.testAudioDeviceHelper.stopMicTest();
          console.log(error);
        },
      },
      {
        text: 'Play Mic Test',
        onPress: async () => {
          const error = await zoom.testAudioDeviceHelper.playMicTest();
          console.log(error);
        },
      },
      {
        text: 'Start Speaker Test',
        onPress: async () => {
          const error = await zoom.testAudioDeviceHelper.startSpeakerTest();
          console.log(error);
        },
      },
      {
        text: 'Stop Speaker Test',
        onPress: async () => {
          const error = await zoom.testAudioDeviceHelper.stopSpeakerTest();
          console.log(error);
        },
      },
    ];

    if (Platform.OS === 'android') {
      Alert.alert('Audio Test', '', options, { cancelable: true });
    }

    if (Platform.OS === 'ios') {
      ActionSheetIOS.showActionSheetWithOptions(
          {
            options: ['Cancel', ...options.map((option) => option.text)],
            cancelButtonIndex: 0,
          },
          (buttonIndex) => {
            // eslint-disable-next-line eqeqeq
            if (buttonIndex != 0) {
              options[buttonIndex - 1].onPress();
            }
          }
      );
    }
  };

  return (
    <DrawerContentScrollView
      contentContainerStyle={styles.container}
      scrollEnabled={false}>
      <SafeAreaView style={styles.contentWrapper}>
        <View>
          <Text style={styles.title}>Video SDK Playground</Text>
          <TouchableOpacity
            style={styles.itemWrapper}
            onPress={() => Linking.openURL(SDK_URL)}>
            <Icon name="questionBalloon" />
            <Text style={styles.itemText}>Zoom Video SDK</Text>
          </TouchableOpacity>
          <TouchableOpacity
              style={styles.itemWrapper}
              onPress={onPressAudioTest}
          >
            <Icon name="speakerOff" style={styles.audioIcon} />
            <Text style={styles.itemText}>Audio Test</Text>
          </TouchableOpacity>
          <View style={styles.separator} />
        </View>
        <VersionText />
      </SafeAreaView>
    </DrawerContentScrollView>
  );
}

const styles = StyleSheet.create({
  audioIcon: {
    width: 30,
    height: 30,
  },
  container: {
    flex: 1,
  },
  contentWrapper: {
    flex: 1,
    paddingVertical: 16,
    justifyContent: 'space-between',
  },
  title: {
    paddingLeft: 16,
    marginBottom: 24,
    fontSize: 20,
  },
  itemWrapper: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingLeft: 16,
    marginBottom: 12,
  },
  itemText: {
    marginLeft: 24,
    fontSize: 16,
  },
  separator: {
    height: 1,
    width: '100%',
    marginLeft: 16,
    backgroundColor: '#EEE',
  },
  version: {
    alignSelf: 'center',
    color: '#666',
  },
});
