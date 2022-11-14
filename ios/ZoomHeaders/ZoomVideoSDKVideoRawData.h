//
//  ZoomVideoSDKVideoRawData.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2019/1/29.
//  Copyright © 2019 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoomVideoSDKConstants.h"

/*!
 @class ZoomVideoSDKVideoRawData
 @brief A Class contains the information of video raw data.
 */
@interface ZoomVideoSDKVideoRawData : NSObject

/*!
 @brief y data pointer of video's YUV data.
 */
@property (nonatomic, assign) char *yBuffer;

/*!
 @brief u data pointer of video's YUV data.
 */
@property (nonatomic, assign) char *uBuffer;

/*!
 @brief v data pointer of video's YUV data.
 */
@property (nonatomic, assign) char *vBuffer;

/*!
 @brief Size of video for video data.
 */
@property (nonatomic, assign) CGSize size;

/*!
 @brief Query video raw data is limited.
 */
@property (nonatomic, assign) BOOL isLimited;

/*!
 @brief The raw data format of video data
 */
@property (nonatomic, assign) ZoomVideoSDKVideoRawDataFormat format;

/*!
 @brief The direction of video data.
 */
@property (nonatomic, assign) ZoomVideoSDKVideoRawDataRotation rotation;

/*!
 @brief Can add reference count or not
 */
- (BOOL)canAddRef;

/*!
 @brief Add reference count
 */
- (BOOL)addRef;

/*!
 @brief Minus reference count
 */
- (NSInteger)releaseRef;

@end

