//
//  ZoomVideoSDKChatHelper.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2019/1/9.
//  Copyright © 2019 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class ZoomVideoSDKChatMessage
 @brief A class that contains all the information for a message.
 */

@class ZoomVideoSDKUser;
@interface ZoomVideoSDKChatMessage : NSObject

/*!
 @brief The message ID.
 */
@property (nonatomic, strong) NSString   * _Nullable messageID;
/*!
 @brief The sender user.
 */
@property (nonatomic, strong) ZoomVideoSDKUser   * _Nullable senderUser;

/*!
 @brief The receiver user.
 */
@property (nonatomic, strong) ZoomVideoSDKUser   * _Nullable receiverUser;

/*!
 @brief The message content.
 */
@property (nonatomic, strong) NSString     * _Nullable content;
/*!
 @brief The message sent time in timestamp.
 */
@property (nonatomic, assign) long long    timeStamp;
/*!
 @brief The message is send to all user or not.
 */
@property (nonatomic, assign) BOOL         isChatToAll;
/*!
 @brief The message is send by me or not.
 */
@property (nonatomic, assign) BOOL         isSelfSend;

@end

/*!
 @class ZoomVideoSDKChatHelper
 @brief A class to operate the instant message in session.
 */
@interface ZoomVideoSDKChatHelper : NSObject

/*!
 @brief Call the function to send a message to a specified user.
 @param user The user who you want to send message.
 @param content The content what you want to send.
 @return The result of it.
 */
- (ZoomVideoSDKError)SendChatToUser:(ZoomVideoSDKUser * _Nullable)user Content:(NSString * _Nullable)content;

/*!
 @brief Call the function to send a message to all users.
 @param content The content what you want to send.
 @return The result of it.
 */
- (ZoomVideoSDKError)SendChatToAll:(NSString * _Nullable)content;

/**
 @brief Determine whether the message can be deleted.
 @param msgID The message ID.
 @return YES indicates the message can be deleted. Otherwise NO.
 */
-(BOOL)canChatMessageBeDeleted:(NSString *__nonnull)msgID;

/*!
 @brief Delete chat message by message id.
 @param msgID The message ID.
 @return If the function succeeds, it will return ZMVideoSDKErrors_Success, otherwise failed.
 */
- (ZoomVideoSDKError)deleteChatMessage:(NSString * __nonnull)msgID;

/*!
 @brief Call the function to check that chat feature is disabled or not.
 @return Yes means disabled, otherwise enabled.
 */
- (BOOL)IsChatDisabled;

/*!
 @brief Call the function to check that private chats are disabed or not.
 @return Yes means disabled, Otherwise enabled.
 */
- (BOOL)IsPrivateChatDisabled;

@end
