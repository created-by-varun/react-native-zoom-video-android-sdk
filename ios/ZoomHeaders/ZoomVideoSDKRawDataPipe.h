//
//  ZoomVideoSDKRenderer.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2019/2/1.
//  Copyright © 2019 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoomVideoSDKDelegate.h"

/*!
 @class ZoomVideoSDKRawDataPipe
 @brief A Class to manage the subscription and unsubscription of video or share raw data.
 */
@interface ZoomVideoSDKRawDataPipe : NSObject

/*!
 @brief This canvas type.
 */
- (ZoomVideoSDKVideoType)rawdataPipeType;
/*!
 @brief The user video status.
 @warning This interface be marked as deprecated, then it will be instead by ZoomVideoSDKRawDataPipe.videoStatus() and ZoomVideoSDKVideoCanvas.videoStatus()
 */
- (ZoomVideoSDKVideoStatus *_Nullable)videoStatus;

/*!
 @brief The user share status.
 @warning This interface be marked as deprecated, then it will be instead by ZoomVideoSDKRawDataPipe.shareStatus() and ZoomVideoSDKVideoCanvas.shareStatus()
 */
- (ZoomVideoSDKShareStatus *_Nullable)shareStatus;

/*!
 @brief Call the function to subscribe video or share raw data. You can subscribe your 'preview video' data with userid=0 before entering the session, you can call it  just after you called "joinSession:". Otherwise, you can subscribe video or share raw data using the real userid in callback "onUserJoin:".
 @return The result of the method.
 */
- (ZoomVideoSDKError)subscribeWithDelegate:(id<ZoomVideoSDKRawDataPipeDelegate>)delegate
                                  resolution:(ZoomVideoSDKVideoResolution)resolution;

/*!
 @brief Call the function to unsubscribe video or share raw data.
 @return The result of the method.
 */
- (ZoomVideoSDKError)unSubscribeWithDelegate:(id<ZoomVideoSDKRawDataPipeDelegate>)delegate;

@end

