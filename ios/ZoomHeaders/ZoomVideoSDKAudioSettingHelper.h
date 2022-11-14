//
//  ZoomVideoSDKAudioSettingHelper.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2022/4/7.
//  Copyright © 2022 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class ZoomVideoSDKAudioSettingHelper
 @brief Audio setting interface.
 */
@interface ZoomVideoSDKAudioSettingHelper : NSObject

/*!
 @brief Enable or disable the original input of mic.
 @param enable YES indicates to enable the original input of mic.
 @return the result of it.
 */
- (ZoomVideoSDKError)enableMicOriginalInput:(BOOL)enable;

/*!
 @brief Get the flag to enable/disable the original input of mic.
 @return Enabled or disabled.
 */
- (BOOL)isMicOriginalInputEnable;

@end
