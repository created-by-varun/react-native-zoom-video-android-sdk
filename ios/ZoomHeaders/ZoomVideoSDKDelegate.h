//
//  ZoomVideoSDKDelegate.h
//  ZoomVideoSDK
//

#import <Foundation/Foundation.h>
#import "ZoomVideoSDKConstants.h"
#import "ZoomVideoSDKVideoRawData.h"
#import "ZoomVideoSDKAudioRawData.h"
#import "ZoomVideoSDKChatHelper.h"
#import "ZoomVideoSDKPreProcessRawData.h"
#import "ZoomVideoSDKVideoSender.h"
#import "ZoomVideoSDKAudioSender.h"
#import "ZoomVideoSDKVideoCapability.h"
#import "ZoomVideoSDKVideoHelper.h"
#import "ZoomVideoSDKAudioHelper.h"
#import "ZoomVideoSDKShareHelper.h"
#import "ZoomVideoSDKLiveStreamHelper.h"
#import "ZoomVideoSDKUserHelper.h"
#import "ZoomVideoSDKLiveTranscriptionHelper.h"

@class ZoomVideoSDKRawDataPipe;
@class ZoomVideoSDKVideoCanvas;

@class ZoomVideoSDKUser;
/*!
 @brief A listener class that groups together the callbacks related to a session.
 */
@protocol ZoomVideoSDKDelegate <NSObject>
@optional
/*!
 @brief The callback of session join.
 */
- (void)onSessionJoin;

/*!
 @brief The callback of session left.
 */
- (void)onSessionLeave;

/*!
 @brief The callback of all event error message.
 @param ErrorType error type in enumeration
 @param details The detail of error message.
 */
- (void)onError:(ZoomVideoSDKError)ErrorType detail:(NSInteger)details;

/*!
 @brief The callback of user join session.
 @param userArray Array contains join users.
 */
- (void)onUserJoin:(ZoomVideoSDKUserHelper * _Nullable)helper users:(NSArray <ZoomVideoSDKUser *>* _Nullable)userArray;

/*!
 @brief The callback of user left session.
 @param userArray Array contains leave users.
 */
- (void)onUserLeave:(ZoomVideoSDKUserHelper * _Nullable)helper users:(NSArray <ZoomVideoSDKUser *>* _Nullable)userArray;

/*!
 @brief The callback of user's video status change.
 @param userArray Array contains video status change users.
 */
- (void)onUserVideoStatusChanged:(ZoomVideoSDKVideoHelper * _Nullable)helper user:(NSArray <ZoomVideoSDKUser *>* _Nullable)userArray;

/*!
 @brief The callback of user's audio status change.
 @param userArray Array contains audio status change users.
 */
- (void)onUserAudioStatusChanged:(ZoomVideoSDKAudioHelper * _Nullable)helper user:(NSArray <ZoomVideoSDKUser *>* _Nullable)userArray;

/*!
 @brief The callback of user's share status change.
 @param status share status in enumeration.
 */
- (void)onUserShareStatusChanged:(ZoomVideoSDKShareHelper * _Nullable)helper user:(ZoomVideoSDKUser * _Nullable)user status:(ZoomVideoSDKReceiveSharingStatus)status;

/*!
 @brief The callback of user's live stream status change.
 @param status live stream status in enumeration.
 */
- (void)onLiveStreamStatusChanged:(ZoomVideoSDKLiveStreamHelper * _Nullable)helper status:(ZoomVideoSDKLiveStreamStatus)status;

/*!
 @brief The callback of instant message in the session.
 @param chatMessage the object which contains the message content.
 */
- (void)onChatNewMessageNotify:(ZoomVideoSDKChatHelper * _Nullable)helper message:(ZoomVideoSDKChatMessage * _Nullable)chatMessage;

/*!
 @brief Chat message be deleted callback. This function is used to inform the user host/myself the message be deleted..
 @param helper The pointer to chat helper object.
 @param msgID The ID of the deleted message.For more details, refer to {@link ZoomVideoSDKChatHelper}.
 @param type Indicates by whom the message was deleted.
 */
- (void)onChatMsgDeleteNotification:(ZoomVideoSDKChatHelper * _Nullable)helper messageID:(NSString * __nonnull)msgID deleteBy:(ZoomVideoSDKChatMsgDeleteBy) type;

/*!
 @brief The callback of session's host change.
 */
- (void)onUserHostChanged:(ZoomVideoSDKUserHelper * _Nullable)helper users:(ZoomVideoSDKUser * _Nullable)user;

/*!
@brief The callback of session's manager change.
*/
- (void)onUserManagerChanged:(ZoomVideoSDKUser * _Nullable)user;

/*!
@brief The callback of user's name change.
*/
- (void)onUserNameChanged:(ZoomVideoSDKUser * _Nullable)user;

/*!
 @brief The callback of active audio change.
 @param userArray The array of active users.
 */
- (void)onUserActiveAudioChanged:(ZoomVideoSDKUserHelper * _Nullable)helper users:(NSArray <ZoomVideoSDKUser *>* _Nullable)userArray;

/*!
 @brief The callback of the session need password.
 */
- (void)onSessionNeedPassword:(ZoomVideoSDKError (^ _Nullable)(NSString * _Nullable password, BOOL leaveSessionIgnorePassword))completion;

/*!
 @brief The callback of the session password wrong.
 */
- (void)onSessionPasswordWrong:(ZoomVideoSDKError (^ _Nullable)(NSString * _Nullable password, BOOL leaveSessionIgnorePassword))completion;

/*!
 @brief This method is used to receive audio mixed raw data.
 @param rawData Audio's raw data.
 */
- (void)onMixedAudioRawDataReceived:(ZoomVideoSDKAudioRawData * _Nullable)rawData;

/*!
 @brief This method is used to receive each user audio raw data.
 @param rawData Audio's raw data.
 */
- (void)onOneWayAudioRawDataReceived:(ZoomVideoSDKAudioRawData * _Nullable)rawData user:(ZoomVideoSDKUser * _Nullable)user;

/*!
 @brief This method is used to receive share audio raw data.
 @param rawData Audio's raw data.
 */
- (void)onSharedAudioRawDataReceived:(ZoomVideoSDKAudioRawData * _Nullable)rawData;

/*!
 @brief Triggered when call out status changed.
 @param status call out status.
 @param failReason call out fail reason.
 */
- (void)onInviteByPhoneStatus:(ZoomVideoSDKPhoneStatus)status failReason:(ZoomVideoSDKPhoneFailedReason)failReason;

/**
 @brief Callback for when the command channel is ready to be used.
 After the SDK attempts to establish a connection for the command channel upon joining a session, this callback will be triggered once the connection attempt has completed.
 @param success  YES,command channel is ready to be used. NO, Failure, command channel was unable to connect.
 */
- (void)onCmdChannelConnectResult:(BOOL)success;

/**
 @brief Callback for when a message has been received from the command channel.Once the command channel is active, this callback is triggered each time a message has been received.
 @param commandContent Received command.
 @param sendUser The user who sent the command.
 */
- (void)onCommandReceived:(NSString * _Nullable)commandContent sendUser:(ZoomVideoSDKUser * _Nullable)sendUser;

/**
 @brief Callback for when the cloud recording status has changed (e.g. paused, stopped, resumed).
 @param status  status cloud recording status defined in [ZoomVideoSDKRecordingStatus].
 */
- (void)onCloudRecordingStatus:(ZoomVideoSDKRecordingStatus)status;

/**
 @brief Triggered when host ask you to unmute.
 */
- (void)onHostAskUnmute;

/**
 @brief When someone enables/disables multi-camera, all participants receive the callback event.
 @param status  status for multipul camera user join or left.
 @param user the user who enabled multi-camera.
 @param videoPipe the data pipe for the multi-camera.
 */
- (void)onMultiCameraStreamStatusChanged:(ZoomVideoSDKMultiCameraStreamStatus)status parentUser:(ZoomVideoSDKUser *_Nullable)user videoPipe:(ZoomVideoSDKRawDataPipe *_Nullable)videoPipe;

/**
 @brief When someone enables/disables multi-camera, all participants receive the callback event.
 @param status  status for multipul camera user join or left.
 @param user the user who enabled multi-camera.
 @param videoCanvas the video canvas for the multi-camera.
 */
- (void)onMultiCameraStreamStatusChanged:(ZoomVideoSDKMultiCameraStreamStatus)status parentUser:(ZoomVideoSDKUser *_Nullable)user videoCanvas:(ZoomVideoSDKVideoCanvas *_Nullable)videoCanvas;

/**
 @brief The callback for the event when the SDK requires system permissions to continue functioning.
 @param permissionType The type of system permission that is required.
 */
- (void)onSystemPermissionRequired:(ZoomVideoSDKSystemPermissionType)permissionType;

/**
 @brief live transcription status changed callback.
 @param status: the live transcription status.
 */
- (void)onLiveTranscriptionStatus:(ZoomVideoSDKLiveTranscriptionStatus)status;

/**
 @brief live transcription message received callback.
 @param ltMsg: an object pointer to the live transcription message content.
 @param user the pointer to the user who speak the message.
 @param type: the live transcription operation type.
 */
- (void)onLiveTranscriptionMsgReceived:(NSString *)ltMsg user:(ZoomVideoSDKUser *)user type:(ZoomVideoSDKLiveTranscriptionOperationType)type;

/**
 @brief The translation message error callback.
 @param speakingLanguage: an object of the spoken message language.
 @param transcriptLanguageId: an object of the message language you want to translate.
 */
- (void)onLiveTranscriptionMsgError:(ZoomVideoSDKLiveTranscriptionLanguage *)spokenLanguage transLanguage:(ZoomVideoSDKLiveTranscriptionLanguage *)transcriptLanguage;

@end

/*!
 @brief Methods to handle virtual audio speaker.
 */
@protocol ZoomVideoSDKVirtualAudioSpeaker <NSObject>

@optional

/*!
 @brief This method is used to receive audio mixed raw data.
 @param rawData Audio's raw data.
 */
- (void)onVirtualSpeakerMixedAudioReceived:(ZoomVideoSDKAudioRawData * _Nullable)rawData;

/*!
 @brief This method is used to receive each user audio raw data.
 @param rawData Audio's raw data.
 */
- (void)onVirtualSpeakerOneWayAudioReceived:(ZoomVideoSDKAudioRawData * _Nullable)rawData user:(ZoomVideoSDKUser * _Nullable)user;

/*!
 @brief The callback event for receiving the share audio raw data.
 @param rawData Audio's raw data.
 */
- (void)onVirtualSpeakerSharedAudioReceived:(ZoomVideoSDKAudioRawData * _Nullable)rawData;

@end

#pragma mark - ZoomVideoSDKRawDataPipeDelegate
/*!
 @brief Methods to manage events for receiving video raw data.
 */
@protocol ZoomVideoSDKRawDataPipeDelegate <NSObject>

@optional

/*!
 @brief This method is used to receive video's NV12 data(CVPixelBufferRef).
 @param pixelBuffer Video's CVPixelBufferRef data.
 */
- (void)onPixelBuffer:(CVPixelBufferRef _Nullable )pixelBuffer
             rotation:(ZoomVideoSDKVideoRawDataRotation)rotation;

/*!
 @brief This method is used to receive video's YUV420 data.
 @param rawData Video's YUV420 data.
 */
- (void)onRawDataFrameReceived:(ZoomVideoSDKVideoRawData * _Nullable)rawData;

/*!
 @brief Callback event when the sender stop/start to sending raw data.
 @param userRawdataStatus Raw data is sending or not.
 */
- (void)onRawDataStatusChanged:(ZoomVideoSDKUserRawdataStatus)userRawdataStatus;

@end

#pragma mark - ZoomVideoSDKVideoSourcePreProcessor
/*!
 @brief Methods to modify default device capture raw data. @See ZoomVideoSDKSessionContext#preProcessor.
 */
@protocol ZoomVideoSDKVideoSourcePreProcessor <NSObject>

@optional
/*!
 @brief Callback on device capture video frame.
 @param rawData See ZoomVideoSDKPreProcessRawData
 */
- (void)onPreProcessRawData:(ZoomVideoSDKPreProcessRawData * _Nullable)rawData;

@end

#pragma mark - ZoomVideoSDKVideoSource
/*!
 @brief Custom external video source interface.
 */
@protocol ZoomVideoSDKVideoSource <NSObject>

@optional

/*!
 @brief Callback for video source prepare.
 @param rawDataSender See ZoomVideoSDKVideoSender
 @param supportCapabilityArray See ZoomVideoSDKVideoCapability
 @param suggestCapability See ZoomVideoSDKVideoCapability
 */
- (void)onInitialize:(ZoomVideoSDKVideoSender *_Nonnull)rawDataSender supportCapabilityArray:(NSArray *_Nonnull)supportCapabilityArray suggestCapability:(ZoomVideoSDKVideoCapability *_Nonnull)suggestCapability;

/*!
 @brief Callback for video size or fps changed.
 @param supportCapabilityArray See ZoomVideoSDKVideoCapability
 @param suggestCapability See ZoomVideoSDKVideoCapability
 */
- (void)onPropertyChange:(NSArray *_Nonnull)supportCapabilityArray suggestCapability:(ZoomVideoSDKVideoCapability *_Nonnull)suggestCapability;

/*!
 @brief Callback for video source should start send raw data.
 */
- (void)onStartSend;

/*!
 @brief Callback for video source should stop send raw data. eg.user mute video
 */
- (void)onStopSend;

/*!
 @brief Callback for video source uninitialized. eg.leave session.
 */
- (void)onUninitialized;

@end

/*!
 @brief Methods to handle virtual audio mic.
 */
@protocol ZoomVideoSDKVirtualAudioMic <NSObject>

@optional
/*!
 @brief Callback for video source prepare.
 @param rawDataSender you can send audio data based on this object, See ZoomVideoSDKAudioSender
 */
- (void)onMicInitialize:(ZoomVideoSDKAudioSender *_Nonnull)rawDataSender;

/*!
 @brief Callback for audio source can start send raw data.
 */
- (void)onMicStartSend;

/*!
 @brief Callback for audio source stop send raw data. eg.user mute audio
 */
- (void)onMicStopSend;

/*!
 @brief Callback for audio source uninitialized. eg.leave session.
 */
- (void)onMicUninitialized;

@end
