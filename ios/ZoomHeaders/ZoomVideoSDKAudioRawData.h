//
//  ZoomVideoSDKAudioRawData.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2019/5/16.
//  Copyright © 2019 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class ZoomVideoSDKAudioRawData
 @brief A Class contains the information of audio raw data.
 */
@interface ZoomVideoSDKAudioRawData : NSObject

/*!
 @brief Pointer of audio buffer data.
 */
@property (nonatomic, assign) char      *buffer;

/*!
 @brief Audio buffer data length.
 */
@property (nonatomic, assign) NSInteger bufferLen;

/*!
 @brief Audio sampling rate.
 */
@property (nonatomic, assign) NSInteger sampleRate;

/*!
 @brief Number of audio channels.
 */
@property (nonatomic, assign) NSInteger channelNum;

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

