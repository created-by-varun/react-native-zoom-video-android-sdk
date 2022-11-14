//
//  ZoomVideoSDKUserHelper.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2018/12/7.
//  Copyright © 2018 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZoomVideoSDKUser;
/*!
 @class ZoomVideoSDKUserHelper
 @brief A class to operate user.
 */
@interface ZoomVideoSDKUserHelper : NSObject

/*!
 @brief Change username for user.
 @param inputName The name that you want to change.
 @param changeUser The user who you want to change name.
 @return The result of it.
 */
- (BOOL)changeName:(NSString*)inputName withUser:(ZoomVideoSDKUser *)changeUser;

/*!
 @brief Assign a user as the host in session.
 @param user The user who is specified as host in session.
 @return YES means that the method is called successfully, otherwise not.
 @warning only session host can run this function, and userId should not be myself.
 */
- (BOOL)makeHost:(ZoomVideoSDKUser *)user;

/*!
 @brief Assign a user as the manager in session.
 @param user The user who is specified as manager in session.
 @return YES means that the method is called successfully, otherwise not.
 @warning only session host can run this function, and userId should not be myself.
 */
- (BOOL)makeManager:(ZoomVideoSDKUser *)user;

/*!
 @brief Revoke the manager in session.
 @param user The user who is the manager in session.
 @return YES means that the method is called successfully, otherwise not.
 @warning only session host can run this function, and userId should not be myself.
 */
- (BOOL)revokeManager:(ZoomVideoSDKUser *)user;

/*!
 @brief Remove a user from the session.
 @param user The user to be removed from the session.
 @return YES means that the method is called successfully, otherwise not.
 @warning The method is available only for the host, and the host can not remove himself.
 */
- (BOOL)removeUser:(ZoomVideoSDKUser *)user;

@end
