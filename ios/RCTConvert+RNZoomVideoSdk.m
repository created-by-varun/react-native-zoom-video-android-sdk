#import <ZoomVideoSDK.h>

#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RCTConvert(RNZoomVideoSdk)

//We want to be able to reverse the enum. From ENUM => String.
//So we extend the built in RCT_ENUM_CONVERTER-macro
#define RCT_ENUM_CONVERTER_WITH_REVERSED(type, values, default, getter) \
+ (type)type:(id)json                                     \
{                                                         \
static NSDictionary *mapping;                           \
static dispatch_once_t onceToken;                       \
dispatch_once(&onceToken, ^{                            \
mapping = values;                                     \
});                                                     \
return [RCTConvertEnumValue(#type, mapping, @(default), json) getter]; \
}                                                        \
+ (NSDictionary *)type##ValuesReversed                        \
{                                                         \
    static NSDictionary *mapping;                           \
    static dispatch_once_t onceToken;                       \
    dispatch_once(&onceToken, ^{                            \
        NSArray *keys = values.allKeys;                     \
        NSArray *valuesArray = [values objectsForKeys:keys notFoundMarker:[NSNull null]];    \
        mapping = [NSDictionary dictionaryWithObjects:keys forKeys:valuesArray];\
    });                                                     \
    return mapping;                                         \
}

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKRawDataMemoryMode,
   (@{
        @"ZoomVideoSDKRawDataMemoryModeStack" : @(ZoomVideoSDKRawDataMemoryModeStack),
        @"ZoomVideoSDKRawDataMemoryModeHeap" : @(ZoomVideoSDKRawDataMemoryModeHeap)
    }),
    ZoomVideoSDKRawDataMemoryModeStack,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKVideoPreferenceMode,
    (@{
        @"ZoomVideoSDKVideoPreferenceMode_Balance" : @(ZoomVideoSDKVideoPreferenceMode_Balance),
        @"ZoomVideoSDKVideoPreferenceMode_Sharpness" : @(ZoomVideoSDKVideoPreferenceMode_Sharpness),
        @"ZoomVideoSDKVideoPreferenceMode_Smoothness" : @(ZoomVideoSDKVideoPreferenceMode_Smoothness),
        @"ZoomVideoSDKVideoPreferenceMode_Custom" : @(ZoomVideoSDKVideoPreferenceMode_Custom)
    }),
    ZoomVideoSDKVideoPreferenceMode_Balance,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKReceiveSharingStatus,
   (@{
        @"ZoomVideoSDKShareStatus_None" : @(ZoomVideoSDKReceiveSharingStatus_None),
        @"ZoomVideoSDKShareStatus_Stop" : @(ZoomVideoSDKReceiveSharingStatus_Stop),
        @"ZoomVideoSDKShareStatus_Pause" : @(ZoomVideoSDKReceiveSharingStatus_Pause),
        @"ZoomVideoSDKShareStatus_Start" : @(ZoomVideoSDKReceiveSharingStatus_Start),
        @"ZoomVideoSDKShareStatus_Resume" : @(ZoomVideoSDKReceiveSharingStatus_Resume)
    }),
    ZoomVideoSDKReceiveSharingStatus_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKRecordingStatus,
    (@{
        @"ZoomVideoSDKRecordingStatus_None" : @(ZoomVideoSDKRecordingStatus_None),
        @"ZoomVideoSDKRecordingStatus_Start" : @(ZoomVideoSDKRecordingStatus_Start),
        @"ZoomVideoSDKRecordingStatus_Stop" : @(ZoomVideoSDKRecordingStatus_Stop),
        @"ZoomVideoSDKRecordingStatus_DiskFull" : @(ZoomVideoSDKRecordingStatus_DiskFull),
        @"ZoomVideoSDKRecordingStatus_Pause" : @(ZoomVideoSDKRecordingStatus_Pause)
    }),
    ZoomVideoSDKRecordingStatus_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKError,
   (@{
       @"ZoomVideoSDKError_Success": @(Errors_Success),
       @"ZoomVideoSDKError_Wrong_Usage": @(Errors_Wrong_Usage),
       @"ZoomVideoSDKError_Internal_Error": @(Errors_Internal_Error),
       @"ZoomVideoSDKError_Uninitialize": @(Errors_Uninitialize),
       @"ZoomVideoSDKError_Memory_Error": @(Errors_Memory_Error),
       @"ZoomVideoSDKError_Load_Module_Error": @(Errors_Load_Module_Error),
       @"ZoomVideoSDKError_UnLoad_Module_Error": @(Errors_UnLoad_Module_Error),
       @"ZoomVideoSDKError_Invalid_Parameter": @(Errors_Invalid_Parameter),
       @"ZoomVideoSDKError_Call_Too_Frequently": @(Errors_Call_Too_Frequently),
       @"ZoomVideoSDKError_No_Impl": @(Errors_No_Impl),
       @"ZoomVideoSDKError_Dont_Support_Feature": @(Errors_Dont_Support_Feature),
       @"ZoomVideoSDKError_Unknown": @(Errors_Unknown),
       @"ZoomVideoSDKError_Auth_Base": @(Errors_Auth_Base),
       @"ZoomVideoSDKError_Auth_Error": @(Errors_Auth_Error),
       @"ZoomVideoSDKError_Auth_Empty_Key_or_Secret": @(Errors_Auth_Empty_Key_or_Secret),
       @"ZoomVideoSDKError_Auth_Wrong_Key_or_Secret": @(Errors_Auth_Wrong_Key_or_Secret),
       @"ZoomVideoSDKError_Auth_DoesNot_Support_SDK": @(Errors_Auth_DoesNot_Support_SDK),
       @"ZoomVideoSDKError_Auth_Disable_SDK": @(Errors_Auth_Disable_SDK),
       @"ZoomVideoSDKError_JoinSession_NoSessionName": @(Errors_JoinSession_NoSessionName),
       @"ZoomVideoSDKError_JoinSession_NoSessionToken": @(Errors_JoinSession_NoSessionToken),
       @"ZoomVideoSDKError_JoinSession_NoUserName": @(Errors_JoinSession_NoUserName),
       @"ZoomVideoSDKError_JoinSession_Invalid_SessionName": @(Errors_JoinSession_Invalid_SessionName),
       @"ZoomVideoSDKError_JoinSession_Invalid_Password": @(Errors_JoinSession_Invalid_Password),
       @"ZoomVideoSDKError_JoinSession_Invalid_SessionToken": @(Errors_JoinSession_Invalid_SessionToken),
       @"ZoomVideoSDKError_JoinSession_SessionName_TooLong": @(Errors_JoinSession_SessionName_TooLong),
       @"ZoomVideoSDKError_JoinSession_Token_MismatchedSessionName": @(Errors_JoinSession_Token_MismatchedSessionName),
       @"ZoomVideoSDKError_JoinSession_Token_NoSessionName": @(Errors_JoinSession_Token_NoSessionName),
       @"ZoomVideoSDKError_JoinSession_Token_RoleType_EmptyOrWrong": @(Errors_JoinSession_Token_RoleType_EmptyOrWrong),
       @"ZoomVideoSDKError_JoinSession_Token_UserIdentity_TooLong": @(Errors_JoinSession_Token_UserIdentity_TooLong),
       @"ZoomVideoSDKError_Session_Base": @(Errors_Session_Base),
       @"ZoomVideoSDKError_Session_Module_Not_Found": @(Errors_Session_Module_Not_Found),
       @"ZoomVideoSDKError_Session_Service_Invaild": @(Errors_Session_Service_Invaild),
       @"ZoomVideoSDKError_Session_Join_Failed": @(Errors_Session_Join_Failed),
       @"ZoomVideoSDKError_Session_No_Rights": @(Errors_Session_No_Rights),
       @"ZoomVideoSDKError_Session_Already_In_Progress": @(Errors_Session_Already_In_Progress),
       @"ZoomVideoSDKError_Session_Dont_Support_SessionType": @(Errors_Session_Dont_Support_SessionType),
       @"ZoomVideoSDKError_Session_Reconncting": @(Errors_Session_Reconncting),
       @"ZoomVideoSDKError_Session_Disconncting": @(Errors_Session_Disconncting),
       @"ZoomVideoSDKError_Session_Not_Started": @(Errors_Session_Not_Started),
       @"ZoomVideoSDKError_Session_Need_Password": @(Errors_Session_Need_Password),
       @"ZoomVideoSDKError_Session_Password_Wrong": @(Errors_Session_Password_Wrong),
       @"ZoomVideoSDKError_Session_Remote_DB_Error": @(Errors_Session_Remote_DB_Error),
       @"ZoomVideoSDKError_Session_Invalid_Param": @(Errors_Session_Invalid_Param),
       @"ZoomVideoSDKError_Session_Audio_Error": @(Errors_Session_Audio_Error),
       @"ZoomVideoSDKError_Session_Audio_No_Microphone": @(Errors_Session_Audio_No_Microphone),
       @"ZoomVideoSDKError_Session_Video_Error": @(Errors_Session_Video_Error),
       @"ZoomVideoSDKError_Session_Video_Device_Error": @(Errors_Session_Video_Device_Error),
       @"ZoomVideoSDKError_Session_Live_Stream_Error": @(Errors_Session_Live_Stream_Error),
       @"ZoomVideoSDKError_Session_Phone_Error": @(Errors_Session_Phone_Error),
       @"ZoomVideoSDKError_Dont_Support_Multi_Stream_Video_User": @(Errors_Dont_Support_Multi_Stream_Video_User),
       @"ZoomVideoSDKError_Fail_Assign_User_Privilege": @(Errors_Fail_Assign_User_Privilege),
       @"ZoomVideoSDKError_No_Recording_In_Process": @(Errors_No_Recording_In_Process),
       @"ZoomVideoSDKError_Malloc_Failed": @(Errors_Malloc_Failed),
       @"ZoomVideoSDKError_Not_In_Session": @(Errors_Not_In_Session),
       @"ZoomVideoSDKError_No_License": @(Errors_No_License),
       @"ZoomVideoSDKError_Video_Module_Not_Ready": @(Errors_Video_Module_Not_Ready),
       @"ZoomVideoSDKError_Video_Module_Error": @(Errors_Video_Module_Error),
       @"ZoomVideoSDKError_Video_device_error": @(Errors_Video_device_error),
       @"ZoomVideoSDKError_No_Video_Data": @(Errors_No_Video_Data),
       @"ZoomVideoSDKError_Share_Module_Not_Ready": @(Errors_Share_Module_Not_Ready),
       @"ZoomVideoSDKError_Share_Module_Error": @(Errors_Share_Module_Error),
       @"ZoomVideoSDKError_No_Share_Data": @(Errors_No_Share_Data),
       @"ZoomVideoSDKError_Audio_Module_Not_Ready": @(Errors_Audio_Module_Not_Ready),
       @"ZoomVideoSDKError_Audio_Module_Error": @(Errors_Audio_Module_Error),
       @"ZoomVideoSDKError_No_Audio_Data": @(Errors_No_Audio_Data),
       @"ZoomVideoSDKError_Preprocess_Rawdata_Error": @(Errors_Preprocess_Rawdata_Error),
       @"ZoomVideoSDKError_Rawdata_No_Device_Running": @(Errors_Rawdata_No_Device_Running),
       @"ZoomVideoSDKError_Rawdata_Init_Device": @(Errors_Rawdata_Init_Device),
       @"ZoomVideoSDKError_Rawdata_Virtual_Device": @(Errors_Rawdata_Virtual_Device),
       @"ZoomVideoSDKError_Rawdata_Cannot_Change_Virtual_Device_In_Preview": @(Errors_Rawdata_Cannot_Change_Virtual_Device_In_Preview),
       @"ZoomVideoSDKError_Rawdata_Internal_Error": @(Errors_Rawdata_Internal_Error),
       @"ZoomVideoSDKError_Rawdata_Send_Too_Much_Data_In_Single_Time": @(Errors_Rawdata_Send_Too_Much_Data_In_Single_Time),
       @"ZoomVideoSDKError_Rawdata_Send_Too_Frequently": @(Errors_Rawdata_Send_Too_Frequently),
       @"ZoomVideoSDKError_Rawdata_Virtual_Mic_Is_Terminate": @(Errors_Rawdata_Virtual_Mic_Is_Terminate),
       @"ZoomVideoSDKError_Session_Share_Error": @(Errors_Session_Share_Error),
       @"ZoomVideoSDKError_Session_Share_Module_Not_Ready": @(Errors_Session_Share_Module_Not_Ready),
       @"ZoomVideoSDKError_Session_Share_You_Are_Not_Sharing": @(Errors_Session_Share_You_Are_Not_Sharing),
       @"ZoomVideoSDKError_Session_Share_Type_Is_Not_Support": @(Errors_Session_Share_Type_Is_Not_Support),
       @"ZoomVideoSDKError_Session_Share_Internal_Error": @(Errors_Session_Share_Internal_Error),
       @"ZoomVideoSDKError_Session_Client_Incompatible": @(Errors_Session_Client_Incompatible),
    }),
    Errors_Unknown,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKAudioType,
   (@{
        @"ZoomVideoSDKAudioType_None" : @(ZoomVideoSDKAudioType_None),
        @"ZoomVideoSDKAudioType_VOIP" : @(ZoomVideoSDKAudioType_VOIP),
        @"ZoomVideoSDKAudioType_TELEPHONY" : @(ZoomVideoSDKAudioType_TELEPHONY),
        @"ZoomVideoSDKAudioType_Unknow" : @(ZoomVideoSDKAudioType_Unknow),
    }),
    ZoomVideoSDKAudioType_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKVideoAspect,
   (@{
        @"ZoomVideoSDKVideoAspect_Original" : @(ZoomVideoSDKVideoAspect_Original),
        @"ZoomVideoSDKVideoAspect_Full_Filled" : @(ZoomVideoSDKVideoAspect_Full_Filled),
        @"ZoomVideoSDKVideoAspect_LetterBox" : @(ZoomVideoSDKVideoAspect_LetterBox),
        @"ZoomVideoSDKVideoAspect_PanAndScan" : @(ZoomVideoSDKVideoAspect_PanAndScan),
    }),
    ZoomVideoSDKVideoAspect_Original,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKVideoResolution,
   (@{
        @"ZoomVideoSDKVideoResolution_90" : @(ZoomVideoSDKVideoResolution_90),
        @"ZoomVideoSDKVideoResolution_180" : @(ZoomVideoSDKVideoResolution_180),
        @"ZoomVideoSDKVideoResolution_360" : @(ZoomVideoSDKVideoResolution_360),
        @"ZoomVideoSDKVideoResolution_720" : @(ZoomVideoSDKVideoResolution_720),
    }),
    ZoomVideoSDKVideoResolution_90,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
   ZoomVideoSDKLiveStreamStatus,
   (@{
        @"ZoomVideoSDKLiveStreamStatus_None" : @(ZoomVideoSDKLiveStreamStatus_None),
        @"ZoomVideoSDKLiveStreamStatus_InProgress" : @(ZoomVideoSDKLiveStreamStatus_InProgress),
        @"ZoomVideoSDKLiveStreamStatus_Connecting" : @(ZoomVideoSDKLiveStreamStatus_Connecting),
        @"ZoomVideoSDKLiveStreamStatus_FailedTimeout" : @(ZoomVideoSDKLiveStreamStatus_FailedTimeout),
        @"ZoomVideoSDKLiveStreamStatus_StartFailed" : @(ZoomVideoSDKLiveStreamStatus_StartFailed),
        @"ZoomVideoSDKLiveStreamStatus_Ended" : @(ZoomVideoSDKLiveStreamStatus_Ended),
    }),
    ZoomVideoSDKLiveStreamStatus_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKPhoneStatus,
    (@{
        @"ZoomVideoSDKPhoneStatus_None" : @(ZoomVideoSDKPhoneStatus_None),
        @"ZoomVideoSDKPhoneStatus_Calling" : @(ZoomVideoSDKPhoneStatus_Calling),
        @"ZoomVideoSDKPhoneStatus_Ringing" : @(ZoomVideoSDKPhoneStatus_Ringing),
        @"ZoomVideoSDKPhoneStatus_Accepted" : @(ZoomVideoSDKPhoneStatus_Accepted),
        @"ZoomVideoSDKPhoneStatus_Success" : @(ZoomVideoSDKPhoneStatus_Success),
        @"ZoomVideoSDKPhoneStatus_Failed" : @(ZoomVideoSDKPhoneStatus_Failed),
        @"ZoomVideoSDKPhoneStatus_Canceling" : @(ZoomVideoSDKPhoneStatus_Canceling),
        @"ZoomVideoSDKPhoneStatus_Canceled" : @(ZoomVideoSDKPhoneStatus_Canceled),
        @"ZoomVideoSDKPhoneStatus_Cancel_Failed" : @(ZoomVideoSDKPhoneStatus_Cancel_Failed),
        @"ZoomVideoSDKPhoneStatus_Timeout" : @(ZoomVideoSDKPhoneStatus_Timeout),
    }),
    ZoomVideoSDKPhoneStatus_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKPhoneFailedReason,
    (@{
        @"ZoomVideoSDKPhoneFailedReason_None" : @(ZoomVideoSDKPhoneFailedReason_None),
        @"ZoomVideoSDKPhoneFailedReason_Busy" : @(ZoomVideoSDKPhoneFailedReason_Busy),
        @"ZoomVideoSDKPhoneFailedReason_Not_Available" : @(ZoomVideoSDKPhoneFailedReason_Not_Available),
        @"ZoomVideoSDKPhoneFailedReason_User_Hangup" : @(ZoomVideoSDKPhoneFailedReason_User_Hangup),
        @"ZoomVideoSDKPhoneFailedReason_Other_Fail" : @(ZoomVideoSDKPhoneFailedReason_Other_Fail),
        @"ZoomVideoSDKPhoneFailedReason_No_Answer" : @(ZoomVideoSDKPhoneFailedReason_No_Answer),
        @"ZoomVideoSDKPhoneFailedReason_Block_No_Host" : @(ZoomVideoSDKPhoneFailedReason_Block_No_Host),
        @"ZoomVideoSDKPhoneFailedReason_Block_High_Rate" : @(ZoomVideoSDKPhoneFailedReason_Block_High_Rate),
        @"ZoomVideoSDKPhoneFailedReason_Block_Too_Frequent" : @(ZoomVideoSDKPhoneFailedReason_Block_Too_Frequent),
    }),
    ZoomVideoSDKPhoneStatus_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKMultiCameraStreamStatus,
    (@{
        @"ZoomVideoSDKMultiCameraStreamStatus_Joined": @(ZoomVideoSDKMultiCameraStreamStatus_Joined),
        @"ZoomVideoSDKMultiCameraStreamStatus_Left": @(ZoomVideoSDKMultiCameraStreamStatus_Left),
    }),
    ZoomVideoSDKMultiCameraStreamStatus_Joined,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKChatMsgDeleteBy,
    (@{
        @"ZoomVideoSDKChatMsgDeleteBy_NONE" : @(ZoomVideoSDKChatMsgDeleteBy_NONE),
        @"ZoomVideoSDKChatMsgDeleteBy_SELF" : @(ZoomVideoSDKChatMsgDeleteBy_SELF),
        @"ZoomVideoSDKChatMsgDeleteBy_HOST" : @(ZoomVideoSDKChatMsgDeleteBy_HOST),
        @"ZoomVideoSDKChatMsgDeleteBy_DLP" : @(ZoomVideoSDKChatMsgDeleteBy_DLP)
    }),
    ZoomVideoSDKChatMsgDeleteBy_NONE,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKLiveTranscriptionStatus,
    (@{
        @"ZoomVideoSDKLiveTranscription_Status_Stop" : @(ZoomVideoSDKLiveTranscriptionStatus_Stop),
        @"ZoomVideoSDKLiveTranscription_Status_Start" : @(ZoomVideoSDKLiveTranscriptionStatus_Start),
    }),
    ZoomVideoSDKLiveTranscriptionStatus_Stop,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKLiveTranscriptionOperationType,
    (@{
        @"ZoomVideoSDKLiveTranscription_OperationType_None" : @(ZoomVideoSDKLiveTranscriptionOperationType_None),
        @"ZoomVideoSDKLiveTranscription_OperationType_Add" : @(ZoomVideoSDKLiveTranscriptionOperationType_Add),
        @"ZoomVideoSDKLiveTranscription_OperationType_Update" : @(ZoomVideoSDKLiveTranscriptionOperationType_Update),
        @"ZoomVideoSDKLiveTranscription_OperationType_Delete" : @(ZoomVideoSDKLiveTranscriptionOperationType_Delete),
        @"ZoomVideoSDKLiveTranscription_OperationType_Complete" : @(ZoomVideoSDKLiveTranscriptionOperationType_Complete),
        @"ZoomVideoSDKLiveTranscription_OperationType_NotSupported" : @(ZoomVideoSDKLiveTranscriptionOperationType_NotSupported),
    }),
    ZoomVideoSDKLiveTranscriptionOperationType_None,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
        ZoomVideoSDKSystemPermissionType,
    (@{
            @"ZoomVideoSDKSystemPermissionType_Camera" : @(ZoomVideoSDKSystemPermissionType_Camera),
            @"ZoomVideoSDKSystemPermissionType_Microphone" : @(ZoomVideoSDKSystemPermissionType_Microphone),
    }),
    ZoomVideoSDKSystemPermissionType_Camera,
    integerValue
)

RCT_ENUM_CONVERTER_WITH_REVERSED(
    ZoomVideoSDKDialInNumType,
    (@{
            @"ZoomVideoSDKDialInNumType_None" : @(ZoomVideoSDKDialInNumType_None),
            @"ZoomVideoSDKDialInNumType_Toll" : @(ZoomVideoSDKDialInNumType_Toll),
            @"ZoomVideoSDKDialInNumType_TollFree" : @(ZoomVideoSDKDialInNumType_TollFree),
    }),
    ZoomVideoSDKDialInNumType_None,
    integerValue
)

@end
