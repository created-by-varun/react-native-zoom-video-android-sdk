//
//  ZoomVideoSDKTestAudioDeviceHelper.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2022/6/20.
//  Copyright © 2022 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class ZoomVideoSDKTestAudioDeviceHelper
 @brief Test audio device interface.
 */
@interface ZoomVideoSDKTestAudioDeviceHelper : NSObject

/*!
 @brief Startthe mic test. This will start recording the input from the miic. Once the recording is complete, call stopMicTest to finish the recording.
 @return If the function succeeds, the return value is Errors_Success. Otherwise failed. To get extended error information, see [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)startMicTest;

/*!
 @brief Stop the mic test. The SDK will return an error if there was no mic test. Before calling this, you must successfully start the mic test by calling startMicTest.
 @return If the function succeeds, the return value is Errors_Success. Otherwise failed. To get extended error information, see [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)stopMicTest;

/*!
 @brief Play the mic recorded sound. If there was no mic test, the SDK returns an error. A mic test must be completed (i.e. startMicTest and stopMicTest are successfully executed) before calling this.
 @return If the function succeeds, the return value is Errors_Success. Otherwise failed. To get extended error information, see [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)playMicTest;

/*!
 @brief Start the speaker test.
 @return If the function succeeds, the return value is Errors_Success. Otherwise failed. To get extended error information, see [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)startSpeakerTest;

/*!
 @brief Stop the speaker test. The SDK will return an error if there was no speaker test. Before calling this, you must successfully start the speaker test by calling startSpeakerTest.
 @return If the function succeeds, the return value is Errors_Success. Otherwise failed. To get extended error information, see [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)stopSpeakerTest;

@end

