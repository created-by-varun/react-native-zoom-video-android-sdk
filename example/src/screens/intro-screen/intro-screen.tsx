import React, {useEffect} from 'react';
import {
  View,
  SafeAreaView,
  TouchableOpacity,
  Text,
  Image,
  ImageBackground,
  StyleSheet,
  Platform,
  useWindowDimensions,
  Alert,
  ActionSheetIOS,
} from 'react-native';
import {EventType, useZoom} from '@zoom/react-native-videosdk';
import {Icon} from '../../components/icon';
import Carousel from 'react-native-reanimated-carousel';
import {
  checkMultiple,
  requestMultiple,
  openSettings,
  PERMISSIONS,
  RESULTS,
  Permission,
  PermissionStatus,
} from 'react-native-permissions';
import Animated, {
  Extrapolate,
  interpolate,
  useAnimatedStyle,
  useSharedValue,
} from 'react-native-reanimated';

const introImages = [
  /* TODO: Hide for now since we do not support other rendering methods.
  Platform.OS === 'ios'
    ? require('./images/intro-image1.png')
    : require('./images/intro-image1-android.png'),
   */
  require('./images/intro-image2.png'),
  require('./images/intro-image3.png'),
  require('./images/intro-image4.png'),
  require('./images/intro-image5.png'),
  require('./images/intro-image6.png'),
  require('./images/intro-image7.png'),
];

interface Props {
  navigation: any;
}

// TODO: Enable photo library permission when sharing view is done.
const platformPermissions = {
  ios: [
    PERMISSIONS.IOS.CAMERA,
    PERMISSIONS.IOS.MICROPHONE,
    //PERMISSIONS.IOS.PHOTO_LIBRARY,
  ],
  android: [
    PERMISSIONS.ANDROID.CAMERA,
    PERMISSIONS.ANDROID.RECORD_AUDIO,
    PERMISSIONS.ANDROID.BLUETOOTH_CONNECT,
    PERMISSIONS.ANDROID.READ_PHONE_STATE,
    PERMISSIONS.ANDROID.READ_EXTERNAL_STORAGE,
  ],
};

export function IntroScreen({ navigation }: Props) {
  const carouselWidth = useWindowDimensions().width;
  const introIndex = useSharedValue<number>(0);
  const zoom = useZoom();

  useEffect(() => {
    if (Platform.OS !== 'ios' && Platform.OS !== 'android') {
      return;
    }

    const permissions = platformPermissions[Platform.OS];
    let blockedAny = false;
    let notGranted: Permission[] = [];

    checkMultiple(permissions).then(
      (statuses: Record<Permission[number], PermissionStatus>) => {
        permissions.map((p: Permission) => {
          const status = statuses[p];
          if (status === RESULTS.BLOCKED) {
            blockedAny = true;
          } else if (status !== RESULTS.GRANTED) {
            notGranted.push(p);
          }
        });
        notGranted.length && requestMultiple(notGranted);
        blockedAny && openSettings();
      }
    );

    const inputProxyAccount = zoom.addListener(
      EventType.onProxySettingNotification,
      () => {
        Alert.alert('You are using a proxy, please open your browser to login.');
      }
    );

    const sslCertVerifiedFailNotification = zoom.addListener(
      EventType.onSSLCertVerifiedFailNotification,
      () => {
        Alert.alert('SSL Certificate Verify Fail Notification.');
      }
    );

    return () => {
      inputProxyAccount.remove();
      sslCertVerifiedFailNotification.remove();
    };
  }, []);

  return (
    <ImageBackground
      style={styles.container}
      source={require('./images/intro-bg.png')}>
      <SafeAreaView style={styles.container}>
        <View style={styles.topWrapper}>
          <Icon
            style={styles.hambergerMenu}
            name="hamburger"
            onPress={navigation.openDrawer}
          />
          {!!introIndex && (
              <View
                  style={{
                    marginTop: 20,
                    flexDirection: 'row',
                    justifyContent: 'space-between',
                    width: 100,
                    alignSelf: 'center',
                  }}>
                {introImages.map((_, index) => {
                  return (
                      <PaginationItem
                          activeDot={introIndex}
                          width={carouselWidth / 40}
                          index={index}
                          key={index}
                          length={introImages.length}
                      />
                  );
                })}
              </View>
          )}
          <View style={styles.padding} />
        </View>
        <Carousel
            loop
            width={carouselWidth}
            height={carouselWidth * 2}
            pagingEnabled={true}
            snapEnabled={true}
            autoPlay={false}
            data={introImages}
            mode="parallax"
            modeConfig={{
              parallaxScrollingScale: 0.9,
              parallaxScrollingOffset: 50,
            }}
            scrollAnimationDuration={1000}
            onProgressChange={(_, index) => {
              if (Number.isInteger(index)) {
                introIndex.value = index;
              }
            }}
            renderItem={({item}) => (
                <Image style={styles.introImage} source={item} />
          )}
        />
        <View style={styles.bottomWrapper} pointerEvents="box-none">
          <Image source={require('./images/curve-mask.png')} />
          <View style={styles.buttonWrapper}>
            <TouchableOpacity
              style={styles.createButton}
              onPress={() => navigation.navigate('Join')}>
              <Text style={styles.createText}>Create</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={styles.joinButton}
              onPress={() => navigation.navigate('Join', {isJoin: true})}>
              <Text style={styles.joinText}>Join</Text>
            </TouchableOpacity>
          </View>
        </View>
      </SafeAreaView>
    </ImageBackground>
  );
}

const PaginationItem: React.FC<{
  index: number;
  length: number;
  width: number;
  activeDot: Animated.SharedValue<number>;
}> = props => {
  const {activeDot, index, length, width} = props;

  const animStyle = useAnimatedStyle(() => {
    let inputRange = [index - 1, index, index + 1];
    let outputRange = [-width, 0, width];

    if (index === 0 && activeDot?.value > length - 1) {
      inputRange = [length - 1, length, length + 1];
      outputRange = [-width, 0, width];
    }

    return {
      transform: [
        {
          translateX: interpolate(
              activeDot?.value,
              inputRange,
              outputRange,
              Extrapolate.CLAMP
          ),
        },
      ],
    };
  }, [activeDot, index, length]);
  return (
      <View
          // eslint-disable-next-line react-native/no-inline-styles
          style={{
            backgroundColor: 'white',
            width,
            height: width,
            borderRadius: 50,
            overflow: 'hidden',
          }}>
        <Animated.View
            style={[
              // eslint-disable-next-line react-native/no-inline-styles
              {
                borderRadius: 50,
                backgroundColor: '#26292E',
                flex: 1,
              },
              animStyle,
            ]}
        />
      </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  topWrapper: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  hambergerMenu: {
    width: 24,
    height: 24,
    marginLeft: 16,
    marginTop: 16,
  },
  padding: {
    width: 24,
    marginLeft: 16,
  },
  introImage: {
    width: '100%',
    height: '100%',
    alignSelf: 'center',
    resizeMode: 'contain',
  },
  dotStyle: {
    width: 7,
    height: 7,
    borderRadius: 5,
    marginHorizontal: 0,
    backgroundColor: '#FFF',
  },
  bottomWrapper: {
    position: 'absolute',
    left: 0,
    bottom: 0,
    width: '100%',
    height: '100%',
    justifyContent: 'flex-end',
  },
  buttonWrapper: {
    paddingTop: 24,
    backgroundColor: '#FFF',
  },
  createButton: {
    marginHorizontal: 30,
    paddingVertical: 12,
    alignItems: 'center',
    borderRadius: 12,
    backgroundColor: '#0070F3',
  },
  createText: {
    fontSize: 18,
    color: '#FFF',
  },
  joinButton: {
    marginTop: 8,
    marginBottom: 32,
    paddingVertical: 8,
    alignItems: 'center',
  },
  joinText: {
    paddingVertical: 12,
    fontSize: 18,
    color: '#0070F3',
  },
});
