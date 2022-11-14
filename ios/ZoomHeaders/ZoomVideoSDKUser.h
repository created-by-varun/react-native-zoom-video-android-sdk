//
//  ZoomVideoSDKUserInfo.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2018/12/7.
//  Copyright © 2018 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoomVideoSDKRawDataPipe.h"
#import "ZoomVideoSDKVideoCanvas.h"

/*!
 @class ZoomVideoSDKVideoStatisticInfo
 @brief Session video statistic information of the user
*/
@interface ZoomVideoSDKVideoStatisticInfo : NSObject
/*!
 @brief frame width
 */
@property (nonatomic, assign) NSInteger     width;
/*!
 @brief frame height
 */
@property (nonatomic, assign) NSInteger     height;
/*!
 @brief frame per second
 */
@property (nonatomic, assign) NSInteger     fps;
/*!
 @brief bits per second
 */
@property (nonatomic, assign) NSInteger     bps;

@end

/*!
 @class ZoomVideoSDKShareStatisticInfo
 @brief Session share statistic information of the user
*/
@interface ZoomVideoSDKShareStatisticInfo : NSObject
/*!
 @brief frame width
 */
@property (nonatomic, assign) NSInteger     width;
/*!
 @brief frame height
 */
@property (nonatomic, assign) NSInteger     height;
/*!
 @brief frame per second
 */
@property (nonatomic, assign) NSInteger     fps;
/*!
 @brief bits per second
 */
@property (nonatomic, assign) NSInteger     bps;

@end

/*!
 @class ZoomVideoSDKAudioStatus
 @brief Audio status of user
 */
@interface ZoomVideoSDKAudioStatus : NSObject
/*!
 @brief The user's audio is on/off.
 */
@property (nonatomic, assign) BOOL          isMuted;
/*!
 @brief The user is talking or not.
 */
@property (nonatomic, assign) BOOL          talking;
/*!
 @brief The user's audio type.
 */
@property (nonatomic, assign) ZoomVideoSDKAudioType  audioType;

@end

/*!
 @class ZoomVideoSDKUser
 @brief The user's information.
 */
@interface ZoomVideoSDKUser : NSObject
/*!
 @brief The user id.
 */
- (NSUInteger)getUserID;
/*!
 @brief The user's name.
 */
- (NSString *_Nullable)getUserName;
/*!
 @brief The userId in custom system. Which pass in jwt token or in SDKSessionContext.customUserId
 */
- (NSString *_Nullable)getCustomUserId;
/*!
 @brief The user is host or not.
 */
- (BOOL)isHost;
/*!
 @brief The user is Manager or not.
 */
- (BOOL)isManager;
/*!
 @brief The user video status.
 @warning This interface be marked as deprecated, then it will be instead by ZoomVideoSDKRawDataPipe.videoStatus() and ZoomVideoSDKVideoCanvas.videoStatus()
 */
- (ZoomVideoSDKVideoStatus *_Nullable)videoStatus DEPRECATED_ATTRIBUTE;
/*!
 @brief The user Audio status.
 */
- (ZoomVideoSDKAudioStatus *_Nullable)audioStatus;
/*!
 @brief The user share status.
 @warning This interface be marked as deprecated, then it will be instead by ZoomVideoSDKRawDataPipe.shareStatus() and ZoomVideoSDKVideoCanvas.shareStatus()
 */
- (ZoomVideoSDKShareStatus *_Nullable)shareStatus DEPRECATED_ATTRIBUTE;
/*!
 @brief Get video statistic info.
 */
- (ZoomVideoSDKVideoStatisticInfo *_Nullable)getVideoStatisticInfo;
/*!
 @brief Get share statistic info.
 */
- (ZoomVideoSDKShareStatisticInfo *_Nullable)getShareStatisticInfo;
/*!
 @brief Get video pipe.
 */
- (ZoomVideoSDKRawDataPipe *_Nullable)getVideoPipe;
/*!
 @brief Get multi-camera data pipe list.
 @return the return value is the pipe list
 */
- (NSArray <ZoomVideoSDKRawDataPipe *> *_Nullable)getMultiCameraStreamList;
/*!
 @brief Get share pipe.
 */
- (ZoomVideoSDKRawDataPipe *_Nullable)getSharePipe;
/*!
 @brief Get video canvas.
 */
- (ZoomVideoSDKVideoCanvas *_Nullable)getVideoCanvas;
/*!
 @brief Get multi-camera video canvas list.
 @return the return value is video canvas list.
 */
- (NSArray <ZoomVideoSDKVideoCanvas *> *_Nullable)getMultiCameraCanvasList;
/*!
 @brief Get share canvas.
 */
- (ZoomVideoSDKVideoCanvas *_Nullable)getShareCanvas;

@end
