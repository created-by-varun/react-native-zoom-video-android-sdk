import { NativeModules } from 'react-native';
import {
  validateNonEmptyStringProp,
  validateBooleanProp,
} from '../utils/validation';

const { RNZoomVideoSdk } = NativeModules;

export enum RawDataMemoryMode {
  Stack = 'ZoomVideoSDKRawDataMemoryModeStack',
  Heap = 'ZoomVideoSDKRawDataMemoryModeHeap',
}

export enum ShareStatus {
  None = 'ZoomVideoSDKShareStatus_None',
  Stop = 'ZoomVideoSDKShareStatus_Stop',
  Pause = 'ZoomVideoSDKShareStatus_Pause',
  Start = 'ZoomVideoSDKShareStatus_Start',
  Resume = 'ZoomVideoSDKShareStatus_Resume',
}

export enum LiveStreamStatus {
  None = 'ZoomVideoSDKLiveStreamStatus_None',
  InProgress = 'ZoomVideoSDKLiveStreamStatus_InProgress',
  Connecting = 'ZoomVideoSDKLiveStreamStatus_Connecting',
  FailedTimeout = 'ZoomVideoSDKLiveStreamStatus_FailedTimeout',
  StartFailed = 'ZoomVideoSDKLiveStreamStatus_StartFailed',
  Ended = 'ZoomVideoSDKLiveStreamStatus_Ended',
}

export enum RecordingStatus {
  None = 'ZoomVideoSDKRecordingStatus_None',
  Start = 'ZoomVideoSDKRecordingStatus_Start',
  Stop = 'ZoomVideoSDKRecordingStatus_Stop',
  DiskFull = 'ZoomVideoSDKRecordingStatus_DiskFull',
  Pause = 'ZoomVideoSDKRecordingStatus_Pause',
}

export enum AudioType {
  None = 'ZoomVideoSDKAudioType_None',
  VOIP = 'ZoomVideoSDKAudioType_VOIP',
  Telephony = 'ZoomVideoSDKAudioType_Telephony',
  Unknown = 'ZoomVideoSDKAudioType_Unknow',
}

export enum VideoAspect {
  Original = 'ZoomVideoSDKVideoAspect_Original',
  FullFilled = 'ZoomVideoSDKVideoAspect_Full_Filled',
  LetterBox = 'ZoomVideoSDKVideoAspect_LetterBox',
  PanAndScan = 'ZoomVideoSDKVideoAspect_PanAndScan',
}

export enum VideoResolution {
  Resolution90 = 'ZoomVideoSDKVideoResolution_90',
  Resolution180 = 'ZoomVideoSDKVideoResolution_180',
  Resolution360 = 'ZoomVideoSDKVideoResolution_360',
  Resolution720 = 'ZoomVideoSDKVideoResolution_720',
  Resolution1080 = 'ZoomVideoSDKVideoResoluton_1080',
}

export enum PhoneStatus {
  None = 'ZoomVideoSDKPhoneStatus_None',
  Calling = 'ZoomVideoSDKPhoneStatus_Calling',
  Ringing = 'ZoomVideoSDKPhoneStatus_Ringing',
  Accepted = 'ZoomVideoSDKPhoneStatus_Accepted',
  Success = 'ZoomVideoSDKPhoneStatus_Success',
  Failed = 'ZoomVideoSDKPhoneStatus_Failed',
  Canceling = 'ZoomVideoSDKPhoneStatus_Canceling',
  Canceled = 'ZoomVideoSDKPhoneStatus_Canceled',
  CancelFailed = 'ZoomVideoSDKPhoneStatus_Cancel_Failed',
  Timeout = 'ZoomVideoSDKPhoneStatus_Timeout',
}

export enum PhoneFailedReason {
  None = 'ZoomVideoSDKPhoneFailedReason_None',
  Busy = 'ZoomVideoSDKPhoneFailedReason_Busy',
  NotAvailable = 'ZoomVideoSDKPhoneFailedReason_Not_Available',
  UserHangup = 'ZoomVideoSDKPhoneFailedReason_User_Hangup',
  OtherFail = 'ZoomVideoSDKPhoneFailedReason_Other_Fail',
  NoAnswer = 'ZoomVideoSDKPhoneFailedReason_No_Answer',
  BlockNoHost = 'ZoomVideoSDKPhoneFailedReason_Block_No_Host',
  BlockHighRate = 'ZoomVideoSDKPhoneFailedReason_Block_High_Rate',
  BlockTooFrequent = 'ZoomVideoSDKPhoneFailedReason_Block_Too_Frequent',
}

export enum ChatMessageDeleteType {
  None = 'ZoomVideoSDKChatMsgDeleteBy_NONE',
  Self = 'ZoomVideoSDKChatMsgDeleteBy_SELF',
  Host = 'ZoomVideoSDKChatMsgDeleteBy_HOST',
  Dlp = 'ZoomVideoSDKChatMsgDeleteBy_DLP',
}

export enum MultiCameraStreamStatus {
  Joined = 'ZoomVideoSDKMultiCameraStreamStatus_Joined',
  Left = 'ZoomVideoSDKMultiCameraStreamStatus_Left',
}

export enum LiveTranscriptionStatus {
  Stop = 'ZoomVideoSDKLiveTranscription_Status_Stop',
  Start = 'ZoomVideoSDKLiveTranscription_Status_Start',
}

export enum SystemPermissionType {
  Camera = 'ZoomVideoSDKSystemPermissionType_Camera',
  Microphone = 'ZoomVideoSDKSystemPermissionType_Microphone',
}

export enum LiveTranscriptionOperationType {
  None = 'ZoomVideoSDKLiveTranscription_OperationType_None',
  Update = 'ZoomVideoSDKLiveTranscription_OperationType_Update',
  Delete = 'ZoomVideoSDKLiveTranscription_OperationType_Delete',
  Complete = 'ZoomVideoSDKLiveTranscription_OperationType_Complete',
  Add = 'ZoomVideoSDKLiveTranscription_OperationType_Add',
  NotSupport = 'ZoomVideoSDKLiveTranscription_OperationType_NotSupported',
}

export enum ZoomVideoSDKDialInNumberType {
  None = 'ZoomVideoSDKDialInNumType_None',
  Toll = 'ZoomVideoSDKDialInNumType_Toll',
  TollFree = 'ZoomVideoSDKDialInNumType_TollFree',
}

export enum Errors {
  Success = 'ZoomVideoSDKError_Success',
  WrongUsage = 'ZoomVideoSDKError_Wrong_Usage',
  InternalError = 'ZoomVideoSDKError_Internal_Error',
  Uninitialize = 'ZoomVideoSDKError_Uninitialize',
  MemoryError = 'ZoomVideoSDKError_Memory_Error',
  LoadModuleError = 'ZoomVideoSDKError_Load_Module_Error',
  UnLoadModuleError = 'ZoomVideoSDKError_UnLoad_Module_Error',
  InvalidParameter = 'ZoomVideoSDKError_Invalid_Parameter',
  CallTooFrequntly = 'ZoomVideoSDKError_Call_Too_Frequently',
  NoImpl = 'ZoomVideoSDKError_No_Impl',
  DontSupportFeature = 'ZoomVideoSDKError_Dont_Support_Feature',
  Unknown = 'ZoomVideoSDKError_Unknown',
  AuthBase = 'ZoomVideoSDKError_Auth_Base',
  AuthError = 'ZoomVideoSDKError_Auth_Error',
  AuthEmptyKeyorSecret = 'ZoomVideoSDKError_Auth_Empty_Key_or_Secret',
  AuthWrongKeyorSecret = 'ZoomVideoSDKError_Auth_Wrong_Key_or_Secret',
  AuthDoesNotSupportSDK = 'ZoomVideoSDKError_Auth_DoesNot_Support_SDK',
  AuthDisableSDK = 'ZoomVideoSDKError_Auth_Disable_SDK',
  JoinSessionNoSessioName = 'ZoomVideoSDKError_JoinSession_NoSessionName',
  JoinSessioNoSessionToken = 'ZoomVideoSDKError_JoinSession_NoSessionToken',
  JoinSessionNoUserName = 'ZoomVideoSDKError_JoinSession_NoUserName',
  JoinSessionInvalidSessionName = 'ZoomVideoSDKError_JoinSession_Invalid_SessionName',
  JoinSessionInvalidPassword = 'ZoomVideoSDKError_JoinSession_InvalidPassword',
  JoinSessionInvalidSessionToken = 'ZoomVideoSDKError_JoinSession_Invalid_SessionToken',
  JoinSessionSessionNameTooLong = 'ZoomVideoSDKError_JoinSession_SessionName_TooLong',
  JoinSessionTokenMismatchedSessionName = 'ZoomVideoSDKError_JoinSession_Token_MismatchedSessionName',
  JoinSessionTokenNoSessionName = 'ZoomVideoSDKError_JoinSession_Token_NoSessionName',
  JoinSessionTokenRoleTypeEmptyOrWrong = 'ZoomVideoSDKError_JoinSession_Token_RoleType_EmptyOrWrong',
  JoinSessionTokenUserIdentityTooLong = 'ZoomVideoSDKError_JoinSession_Token_UserIdentity_TooLong',
  SessionBase = 'ZoomVideoSDKError_Session_Base',
  SessionModuleNotFound = 'ZoomVideoSDKError_Session_Module_Not_Found',
  SessionServiceInvaild = 'ZoomVideoSDKError_Session_Service_Invaild',
  SessionJoinFailed = 'ZoomVideoSDKError_Session_Join_Failed',
  SessionNoRights = 'ZoomVideoSDKError_Session_No_Rights',
  SessionAlreadyInProgress = 'ZoomVideoSDKError_Session_Already_In_Progress',
  SessionDontSupportSessionType = 'ZoomVideoSDKError_Session_Dont_Support_SessionType',
  SessionReconncting = 'ZoomVideoSDKError_Session_Reconncting',
  SessionDisconncting = 'ZoomVideoSDKError_Session_Disconncting',
  SessionNotStarted = 'ZoomVideoSDKError_Session_Not_Started',
  SessionNeedPassword = 'ZoomVideoSDKError_Session_Need_Password',
  SessionPasswordWrong = 'ZoomVideoSDKError_Session_Password_Wrong',
  SessionRemoteDBError = 'ZoomVideoSDKError_Session_Remote_DB_Error',
  SessionInvalidParam = 'ZoomVideoSDKError_Session_Invalid_Param',
  SessionAudioError = 'ZoomVideoSDKError_Session_Audio_Error',
  SessionAudioNoMicrophone = 'ZoomVideoSDKError_Session_Audio_No_Microphone',
  SessionVideoError = 'ZoomVideoSDKError_Session_Video_Error',
  SessionVideoDeviceError = 'ZoomVideoSDKError_Session_Video_Device_Error',
  SessionLiveStreamError = 'ZoomVideoSDKError_Session_Live_Stream_Error',
  SessionPhoneError = 'ZoomVideoSDKError_Session_Phone_Error',
  DontSupportMultiStreamVideoUser = 'ZoomVideoSDKError_Dont_Support_Multi_Stream_Video_User',
  FailAssignUserPrivilege = 'ZoomVideoSDKError_Fail_Assign_User_Privilege',
  NoRecordingInProcess = 'ZoomVideoSDKError_No_Recording_In_Process',
  MallocFailed = 'ZoomVideoSDKError_Malloc_Failed',
  NotInSession = 'ZoomVideoSDKError_Not_In_Session',
  NoLicense = 'ZoomVideoSDKError_No_License',
  VideoModuleNotReady = 'ZoomVideoSDKError_Video_Module_Not_Ready',
  VideoModuleError = 'ZoomVideoSDKError_Video_Module_Error',
  VideoDeviceError = 'ZoomVideoSDKError_Video_device_error',
  NoVideoData = 'ZoomVideoSDKError_No_Video_Data',
  ShareModuleNotReady = 'ZoomVideoSDKError_Share_Module_Not_Ready',
  ShareModuleError = 'ZoomVideoSDKError_Share_Module_Error',
  NoShareData = 'ZoomVideoSDKError_No_Share_Data',
  AudioModuleNotReady = 'ZoomVideoSDKError_Audio_Module_Not_Ready',
  AudioModuleError = 'ZoomVideoSDKError_Audio_Module_Error',
  NoAudioData = 'ZoomVideoSDKError_No_Audio_Data',
  PreprocessRawdataError = 'ZoomVideoSDKError_Preprocess_Rawdata_Error',
  RawdataNoDeviceRunning = 'ZoomVideoSDKError_Rawdata_No_Device_Running',
  RawdataInitDevice = 'ZoomVideoSDKError_Rawdata_Init_Device',
  RawdataVirtualDevice = 'ZoomVideoSDKError_Rawdata_Virtual_Device',
  RawdataCannotChangeVirtualDeviceInPreview = 'ZoomVideoSDKError_Rawdata_Cannot_Change_Virtual_Device_In_Preview',
  RawdataInternalError = 'ZoomVideoSDKError_Rawdata_Internal_Error',
  RawdataSendTooMuchDataInSingleTime = 'ZoomVideoSDKError_Rawdata_Send_Too_Much_Data_In_Single_Time',
  RawdataSendTooFrequently = 'ZoomVideoSDKError_Rawdata_Send_Too_Frequently',
  RawdataVirtualMicIsTerminate = 'ZoomVideoSDKError_Rawdata_Virtual_Mic_Is_Terminate',
  SessionShareError = 'ZoomVideoSDKError_Session_Share_Error',
  SessionShareModuleNotReady = 'ZoomVideoSDKError_Session_Share_Module_Not_Ready',
  SessionShareYouAreNotSharing = 'ZoomVideoSDKError_Session_Share_You_Are_Not_Sharing',
  SessionShareTypeIsNotSupport = 'ZoomVideoSDKError_Session_Share_Type_Is_Not_Support',
  SessionShareInternalError = 'ZoomVideoSDKError_Session_Share_Internal_Error',
  Permission_RECORD_AUDIO = 'ZoomVideoSDKError_Permission_RECORD_AUDIO',
  Permission_READ_PHONE_STATE = 'ZoomVideoSDKError_Permission_READ_PHONE_STATE',
  BLUETOOTH_CONNECT = 'ZoomVideoSDKError_Permission_BLUETOOTH_CONNECT',
  Session_Client_Incompatible = 'ZoomVideoSDKError_Session_Client_Incompatible',
}

export type InitConfig = {
  domain?: string;
  enableLog?: boolean;
  logFilePrefix?: string;
  appGroupId?: string;
  enableFullHD?: boolean; // Availble for certain Android hardware only.
  videoRawDataMemoryMode?: RawDataMemoryMode;
  audioRawDataMemoryMode?: RawDataMemoryMode;
  shareRawDataMemoryMode?: RawDataMemoryMode;
  speakerFilePath?: string;
};

export type JoinSessionConfig = {
  sessionName: string;
  sessionPassword?: string;
  token: string;
  userName: string;
  audioOptions?: {
    connect?: boolean;
    mute?: boolean;
  };
  videoOptions?: {
    localVideoOn?: boolean;
  };
  sessionIdleTimeoutMins: number;
};

export type ZoomVideoSdkType = {
  // Methods
  initSdk: (config: InitConfig) => void;
  joinSession: (config: JoinSessionConfig) => Promise<void>;
  leaveSession: (endSession?: boolean) => void; // Maybe the error result?
  getSdkVersion: () => Promise<string>;
};

export class ZoomVideoSdk implements ZoomVideoSdkType {
  initSdk(config: InitConfig) {
    validateNonEmptyStringProp(config, 'initConfig', 'domain');
    validateBooleanProp(config, 'initConfig', 'enableLog');
    return RNZoomVideoSdk.initSdk(config);
  }

  joinSession(config: JoinSessionConfig) {
    validateNonEmptyStringProp(config, 'JoinSessionConfig', 'sessionName');
    validateNonEmptyStringProp(config, 'JoinSessionConfig', 'userName');
    validateNonEmptyStringProp(config, 'JoinSessionConfig', 'token');
    return RNZoomVideoSdk.joinSession(config);
  }

  // We don't need to do anything right now so we just pass through the native call.
  leaveSession = RNZoomVideoSdk.leaveSession;

  getSdkVersion = RNZoomVideoSdk.getSdkVersion;

  isInSession = RNZoomVideoSdk.isInSession;
}
