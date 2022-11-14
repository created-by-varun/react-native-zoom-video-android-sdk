//
//  ZoomVideoSDKRecordingHelper.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2021/12/23.
//  Copyright © 2021 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @brief Class for using cloud recording in the session.
 See[ZoomVideoSDK.h#getRecordingHelper]
 */
@interface ZoomVideoSDKRecordingHelper : NSObject

/*!
 @brief Checks whether the current user has permission to start cloud recording.
 The following are the prerequisites to use the helper class:
 A cloud recording add-on plan
 Cloud recording feature enabled on the Web portal
 @return Errors_Success  if the current user can start recording. Otherwise, the user cannot start recording.See error codes defined in [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)canStartRecording;

/*!
 @brief Start cloud recording.
 @return Errors_Success if the start cloud recording request was successful.Otherwise, the start cloud recording request failed.
 Since cloud recording involves asynchronous operations, a return value of Errors_Success does not guarantee that the recording will start. See {@link ZoomVideoSDKDelegate#onCloudRecordingStatus} for information on how to confirm that recording has commenced.
 See error codes defined in [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)startCloudRecording;

/*!
 @brief Stop cloud recording.
 @return Errors_Success if the stop cloud recording request was successful.Otherwise, the stop cloud recording request failed.
 Since cloud recording involves asynchronous operations, a return value of Errors_Success does not guarantee that the recording will stop. See {@link ZoomVideoSDKDelegate#onCloudRecordingStatus} for information on how to confirm that recording has ended.
 See error codes defined in [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)stopCloudRecording;

/*!
 @brief Pause the ongoing cloud recording.
 @return Errors_Success if the pause cloud recording request was successful.Otherwise, the pause cloud recording request failed.
 Since cloud recording involves asynchronous operations, a return value of <code>Errors_Success</code> does not guarantee that the recording will pause. See {@link ZoomVideoSDKDelegate#onCloudRecordingStatus} for information on how to confirm that recording has paused.
 See error codes defined in [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)pauseCloudRecording;

/*!
 @brief Resume the previously paused cloud recording.
 @return Errors_Success if the resume cloud recording request was successful.Otherwise, the resume cloud recording request failed.
 Since cloud recording involves asynchronous operations, a return value of <code>Errors_Success</code> does not guarantee that the recording will resume. See {@link ZoomVideoSDKDelegate#onCloudRecordingStatus} for information on how to confirm that recording has resumed.
 See error codes defined in [ZoomVideoSDKError].
 */
- (ZoomVideoSDKError)resumeCloudRecording;

/*!
 @brief Get the current status of cloud recording.
 @return cloud recording status value defined in [ZoomVideoSDKRecordingStatus].
 */
- (ZoomVideoSDKRecordingStatus)getCloudRecordingStatus;

@end
