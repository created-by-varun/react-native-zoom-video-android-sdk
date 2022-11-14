# Zoom Video SDK for React Native

## Installation

In your React Native project, install the Video SDK:

`$ npm install @zoom/react-native-videosdk --save`

In the iOS and Android folders in your project, you will also need to [install the iOS and Android Zoom Video SDKs](https://marketplace.zoom.us/docs/sdk/video/react-native/getting-started#add-ios-or-android-sdk-to-wrapper), respectively.

## Usage

In the component file where you want to use the Video SDK, import `ZoomVideoSdkProvider`, `useZoom`, and `EventType`.

```js
import { ZoomVideoSdkProvider, useZoom,  EventType } from 'react-native-zoom-video-sdk';
```

Wrap your application with `ZoomVideoSdkProvider` and set the required configuration properties.

```js
{...}
return (
  <ZoomVideoSdkProvider
    config={{
    appGroupId: '{Your Apple Group ID here}',
    domain: 'zoom.us',
    enableLog: true,
  }}>
    <RestOfTheApp />
  </ZoomVideoSdkProvider>
)
```

Get the Video SDK instance.

```js
const zoom = useZoom();
```

Generate an [SDK JWT Token](https://marketplace.zoom.us/docs/sdk/video/auth).

Then, join a session.

```js
await zoom.joinSession({
  sessionName: 'name of video session',
  token: 'JWT goes here',
  username: 'name of user',
  audioOptions: {
    connect: true,
    mute: false,
  },
  videoOptions: {
    localVideoOn: true,
  },
  videoOptions: {
    localVideoOn: true,
  },
  sessionIdleTimeoutMins: 40,
});
```

## Sample App

Checkout the Zoom React Native Video SDK Sample App in the `example` directory.

## Documentation
Please visit [Video SDK for React Native](https://marketplace.zoom.us/docs/sdk/video/react-native) to learn how to use the SDK wrapper and run the sample application.

For the full list of APIs and Event Listeners, see the [Reference](https://marketplace.zoom.us/docs/sdk/video/react-native/reference).

## Need help?

If you're looking for help, try [Developer Support](https://devsupport.zoom.us/) or our [Developer Forum](https://devforum.zoom.us). Priority support is also available with [Premier Developer Support plans](https://zoom.us/docs/en-us/developer-support-plans.html).

## Changelog

For the changelog, see [Video SDK for React Native](https://marketplace.zoom.us/docs/changelog#labels/react-native).

## License

Use of this SDK is subject to our [License and Terms of Use](https://explore.zoom.us/docs/en-us/zoom_api_license_and_tou.html);

## Open Source Software Source Code

Some licenses for OSS contained in our products give you the right to access the source code under said license. You may obtain a copy of source code for the relevant OSS via the following link: https://zoom.us/opensource/source. Please obtain independent legal advice or counsel to determine your responsibility to make source code available under any specific OSS project.

Please see [oss_attribution.txt](oss_attribution.txt) for more information.

---
Copyright ©2022 Zoom Video Communications, Inc. All rights reserved.
