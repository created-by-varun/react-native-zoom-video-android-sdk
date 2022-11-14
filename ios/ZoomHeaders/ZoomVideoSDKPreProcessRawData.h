//
//  ZoomVideoSDKPreProcessRawData.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2020/2/26.
//  Copyright © 2020 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class ZoomVideoSDKPreProcessRawData
 @brief A Class contains the information of device capture video frame.
 */
@interface ZoomVideoSDKPreProcessRawData : NSObject

/*!
 @brief the size of video for the video data.
 */
@property (nonatomic, assign) CGSize size;

/*!
 @brief y data pointer of video's YUV data stride.
 */
@property (nonatomic, assign) int yStride;

/*!
 @brief u data pointer of video's YUV data stride.
 */
@property (nonatomic, assign) int uStride;

/*!
 @brief v data pointer of video's YUV data stride.
 */
@property (nonatomic, assign) int vStride;

/*!
 @brief Query video raw data is limited.
 */
@property (nonatomic, assign) BOOL isLimited;

/*!
@brief y data pointer of video's YUV data .
*/
- (char *)getYBuffer:(int)lineNum;

/*!
@brief u data pointer of video's YUV data .
*/
- (char *)getUBuffer:(int)lineNum;

/*!
@brief v data pointer of video's YUV data .
*/
- (char *)getVBuffer:(int)lineNum;

/*!
 @brief The raw data format of video data
 */
@property (nonatomic, assign) ZoomVideoSDKVideoRawDataFormat format;

/*!
 @brief The direction of video data.
 */
@property (nonatomic, assign) ZoomVideoSDKVideoRawDataRotation rotation;

@end

