//
//  ZoomVideoSDKShareHelper.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2018/12/13.
//  Copyright © 2018 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 @class ZoomVideoSDKShareStatus
 @brief Share status of user
 */
@interface ZoomVideoSDKShareStatus : NSObject
/*!
 @brief The user's share status.
 */
@property (nonatomic, assign) ZoomVideoSDKReceiveSharingStatus  sharingStatus;

@end

/*!
 @class ZoomVideoSDKShareHelper
 @brief A class to operate share content.
 */
@interface ZoomVideoSDKShareHelper : NSObject

/*!
 @brief Share a content.
 @param view The view shared.
 @warning view, recommend to pass a single UIView's object, such as UIView, UIImageView or WKWebView.
 @warning It is not recommended to pass UIView after add subview WKWebView or UIImageView.
 @return The result of it.
 */
- (ZoomVideoSDKError)startShareWithView:(UIView * _Nullable)view;

/*!
 @brief Set to stop App share.
 @return The result of it.
 */
- (ZoomVideoSDKError)stopShare;

/*!
 @brief Set lock App share.
 @return The result of it.
 @warning Only Host/Manger can call the function.
 */
- (ZoomVideoSDKError)lockShare:(BOOL)lock;

/*!
 @brief Check share is locked or not.
 @return The result of it.
 */
- (BOOL)isShareLocked;

/*!
 @brief Check you're sharing or not.
 @return The result of it.
 */
- (BOOL)isSharingOut;

/*!
 @brief Check other is sharing or not.
 @return The result of it.
 */
- (BOOL)isOtherSharing;

/*!
 @brief Check myself is sharing screen or not.
 @return The result of it.
 */
- (BOOL)isScreenSharingOut;

/*!
 @brief Check other is audio or not share when screen sharing.
 @return The result of it.
 */
- (BOOL)isShareDeviceAudioEnabled;

/*!
 @brief Enble share audio when screen sharing.
 @param enable share audio or not.
 @return The result of it.
 */
- (BOOL)enableShareDeviceAudio:(BOOL)enable;

@end
