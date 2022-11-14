//
//  ZoomVideoSDKCmdChannel.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2021/12/22.
//  Copyright © 2021 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @brief The command channel is a service tied to the current session, which allows users to send data or commands to other users in the same session.
 See[ZoomVideoSDK.h#getCmdChannel]
 */
@interface ZoomVideoSDKCmdChannel : NSObject
/**
 @brief Send custom commands to other users in the current session.
 @param commandContent the customized command.
 @param user An instance of ZoomVideoSDKUser associated with the user who will receive the command. See [ZoomVideoSDKUser]
 If receiver is set to nil, the command will be broadcast to all users.
 @return Errors_Success if the command has been successfully sent. Otherwise, the send command request failed.
 See error codes defined in [ZoomVideoSDKErrors].
 */
- (ZoomVideoSDKError)sendCommand:(NSString * _Nullable)commandContent receiveUser:(ZoomVideoSDKUser * _Nullable)user;

@end

