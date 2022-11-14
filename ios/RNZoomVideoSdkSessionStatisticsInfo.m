#import "RNZoomVideoSdkSessionStatisticsInfo.h"

@implementation RNZoomVideoSdkSessionStatisticsInfo

- (ZoomVideoSDKSession *)getSession
{
    ZoomVideoSDKSession* session = nil;

    @try {
        session = [[ZoomVideoSDK shareInstance] getSession];
        if (session == nil) {
            NSException *e = [NSException exceptionWithName:@"NoSessionFound" reason:@"No Session Found" userInfo:nil];
            @throw e;
        }
    } @catch (NSException *e) {
        NSLog(@"%@ - %@", e.name, e.reason);
    }

    return session;
}

RCT_EXPORT_MODULE()

// -----------------------------------------------------------------------------------------------
// Audio Statistics Info
// -----------------------------------------------------------------------------------------------

RCT_EXPORT_METHOD(getAudioStatisticsInfo:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFrequency = [[[self getSession] getSessionAudioStatisticInfo] recvFrequency];
    NSInteger recvJitter = [[[self getSession] getSessionAudioStatisticInfo] recvJitter];
    NSInteger recvLatency = [[[self getSession] getSessionAudioStatisticInfo] recvLatency];
    CGFloat recvPacketLossAvg = [[[self getSession] getSessionAudioStatisticInfo] recvPacketLossAvg];
    CGFloat recvPacketLossMax = [[[self getSession] getSessionAudioStatisticInfo] recvPacketLossMax];
    NSInteger sendFrequency = [[[self getSession] getSessionAudioStatisticInfo] sendFrequency];
    NSInteger sendJitter = [[[self getSession] getSessionAudioStatisticInfo] sendJitter];
    NSInteger sendLatency = [[[self getSession] getSessionAudioStatisticInfo] sendLatency];
    CGFloat sendPacketLossAvg = [[[self getSession] getSessionAudioStatisticInfo] sendPacketLossAvg];
    CGFloat sendPacketLossMax = [[[self getSession] getSessionAudioStatisticInfo] sendPacketLossMax];
    NSDictionary *dict = @{
        @"recvFrequency": @(recvFrequency),
        @"recvJitter": @(recvJitter),
        @"recvLatency": @(recvLatency),
        @"recvPacketLossAvg": @(recvPacketLossAvg),
        @"recvPacketLossMax": @(recvPacketLossMax),
        @"sendFrequency": @(sendFrequency),
        @"sendJitter": @(sendJitter),
        @"sendLatency": @(sendLatency),
        @"sendPacketLossAvg": @(sendPacketLossAvg),
        @"sendPacketLossMax": @(sendPacketLossMax),
    };

    resolve(dict);
}

RCT_EXPORT_METHOD(getAudioRecvFrequency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFrequency = [[[self getSession] getSessionAudioStatisticInfo] recvFrequency];
    resolve(@(recvFrequency));
}

RCT_EXPORT_METHOD(getAudioRecvJitter:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvJitter = [[[self getSession] getSessionAudioStatisticInfo] recvJitter];
    resolve(@(recvJitter));
}

RCT_EXPORT_METHOD(getAudioRecvLatency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvLatency = [[[self getSession] getSessionAudioStatisticInfo] recvLatency];
    resolve(@(recvLatency));
}

RCT_EXPORT_METHOD(getAudioRecvPacketLossAvg:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat recvPacketLossAvg = [[[self getSession] getSessionAudioStatisticInfo] recvPacketLossAvg];
    resolve(@(recvPacketLossAvg));
}

RCT_EXPORT_METHOD(getAudioRecvPacketLossMax:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat recvPacketLossMax = [[[self getSession] getSessionAudioStatisticInfo] recvPacketLossMax];
    resolve(@(recvPacketLossMax));
}

RCT_EXPORT_METHOD(getAudioSendFrequency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFrequency = [[[self getSession] getSessionAudioStatisticInfo] sendFrequency];
    resolve(@(sendFrequency));
}

RCT_EXPORT_METHOD(getAudioSendJitter:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendJitter = [[[self getSession] getSessionAudioStatisticInfo] sendJitter];
    resolve(@(sendJitter));
}

RCT_EXPORT_METHOD(getAudioSendLatency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendLatency = [[[self getSession] getSessionAudioStatisticInfo] sendLatency];
    resolve(@(sendLatency));
}

RCT_EXPORT_METHOD(getAudioSendPacketLossAvg:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat sendPacketLossAvg = [[[self getSession] getSessionAudioStatisticInfo] sendPacketLossAvg];
    resolve(@(sendPacketLossAvg));
}

RCT_EXPORT_METHOD(getAudioSendPacketLossMax:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat sendPacketLossMax = [[[self getSession] getSessionAudioStatisticInfo] sendPacketLossMax];
    resolve(@(sendPacketLossMax));
}

// -----------------------------------------------------------------------------------------------
// Video Statistics Info
// -----------------------------------------------------------------------------------------------

RCT_EXPORT_METHOD(getVideoStatisticsInfo:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFps = [[[self getSession] getSessionVideoStatisticInfo] recvFps];
    NSInteger recvFrameHeight = [[[self getSession] getSessionVideoStatisticInfo] recvFrameHeight];
    NSInteger recvFrameWidth = [[[self getSession] getSessionVideoStatisticInfo] recvFrameWidth];
    NSInteger recvJitter = [[[self getSession] getSessionVideoStatisticInfo] recvJitter];
    NSInteger recvLatency = [[[self getSession] getSessionVideoStatisticInfo] recvLatency];
    CGFloat recvPacketLossAvg = [[[self getSession] getSessionVideoStatisticInfo] recvPacketLossAvg];
    CGFloat recvPacketLossMax = [[[self getSession] getSessionVideoStatisticInfo] recvPacketLossMax];
    NSInteger sendFps = [[[self getSession] getSessionVideoStatisticInfo] sendFps];
    NSInteger sendFrameHeight = [[[self getSession] getSessionVideoStatisticInfo] sendFrameHeight];
    NSInteger sendFrameWidth = [[[self getSession] getSessionVideoStatisticInfo] sendFrameWidth];
    NSInteger sendJitter = [[[self getSession] getSessionVideoStatisticInfo] sendJitter];
    NSInteger sendLatency = [[[self getSession] getSessionVideoStatisticInfo] sendLatency];
    CGFloat sendPacketLossAvg = [[[self getSession] getSessionVideoStatisticInfo] sendPacketLossAvg];
    CGFloat sendPacketLossMax = [[[self getSession] getSessionVideoStatisticInfo] sendPacketLossMax];
    NSDictionary *dict = @{
        @"recvFps": @(recvFps),
        @"recvFrameHeight": @(recvFrameHeight),
        @"recvFrameWidth": @(recvFrameWidth),
        @"recvJitter": @(recvJitter),
        @"recvLatency": @(recvLatency),
        @"recvPacketLossAvg": @(recvPacketLossAvg),
        @"recvPacketLossMax": @(recvPacketLossMax),
        @"sendFps": @(sendFps),
        @"sendFrameHeight": @(sendFrameHeight),
        @"sendFrameWidth": @(sendFrameWidth),
        @"sendJitter": @(sendJitter),
        @"sendLatency": @(sendLatency),
        @"sendPacketLossAvg": @(sendPacketLossAvg),
        @"sendPacketLossMax": @(sendPacketLossMax),
    };

    resolve(dict);
}

RCT_EXPORT_METHOD(getVideoRecvFps:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFps = [[[self getSession] getSessionVideoStatisticInfo] recvFps];
    resolve(@(recvFps));
}

RCT_EXPORT_METHOD(getVideoRecvFrameHeight:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFrameHeight = [[[self getSession] getSessionVideoStatisticInfo] recvFrameHeight];
    resolve(@(recvFrameHeight));
}

RCT_EXPORT_METHOD(getVideoRecvFrameWidth:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFrameWidth = [[[self getSession] getSessionVideoStatisticInfo] recvFrameWidth];
    resolve(@(recvFrameWidth));
}

RCT_EXPORT_METHOD(getVideoRecvJitter:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvJitter = [[[self getSession] getSessionVideoStatisticInfo] recvJitter];
    resolve(@(recvJitter));
}

RCT_EXPORT_METHOD(getVideoRecvLatency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvLatency = [[[self getSession] getSessionVideoStatisticInfo] recvLatency];
    resolve(@(recvLatency));
}

RCT_EXPORT_METHOD(getVideoRecvPacketLossAvg:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat recvPacketLossAvg = [[[self getSession] getSessionVideoStatisticInfo] recvPacketLossAvg];
    resolve(@(recvPacketLossAvg));
}

RCT_EXPORT_METHOD(getVideoRecvPacketLossMax:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat recvPacketLossMax = [[[self getSession] getSessionVideoStatisticInfo] recvPacketLossMax];
    resolve(@(recvPacketLossMax));
}

RCT_EXPORT_METHOD(getVideoSendFps:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFps = [[[self getSession] getSessionVideoStatisticInfo] sendFps];
    resolve(@(sendFps));
}

RCT_EXPORT_METHOD(getVideoSendFrameHeight:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFrameHeight = [[[self getSession] getSessionVideoStatisticInfo] sendFrameHeight];
    resolve(@(sendFrameHeight));
}

RCT_EXPORT_METHOD(getVideoSendFrameWidth:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFrameWidth = [[[self getSession] getSessionVideoStatisticInfo] sendFrameWidth];
    resolve(@(sendFrameWidth));
}

RCT_EXPORT_METHOD(getVideoSendJitter:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendJitter = [[[self getSession] getSessionVideoStatisticInfo] sendJitter];
    resolve(@(sendJitter));
}

RCT_EXPORT_METHOD(getVideoSendLatency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendLatency = [[[self getSession] getSessionVideoStatisticInfo] sendLatency];
    resolve(@(sendLatency));
}

RCT_EXPORT_METHOD(getVideoSendPacketLossAvg:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat sendPacketLossAvg = [[[self getSession] getSessionVideoStatisticInfo] sendPacketLossAvg];
    resolve(@(sendPacketLossAvg));
}

RCT_EXPORT_METHOD(getVideoSendPacketLossMax:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat sendPacketLossMax = [[[self getSession] getSessionVideoStatisticInfo] sendPacketLossMax];
    resolve(@(sendPacketLossMax));
}

// -----------------------------------------------------------------------------------------------
// Share Statistics Info
// -----------------------------------------------------------------------------------------------

RCT_EXPORT_METHOD(getShareStatisticsInfo:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFps = [[[self getSession] getSessionShareStatisticInfo] recvFps];
    NSInteger recvFrameHeight = [[[self getSession] getSessionShareStatisticInfo] recvFrameHeight];
    NSInteger recvFrameWidth = [[[self getSession] getSessionShareStatisticInfo] recvFrameWidth];
    NSInteger recvJitter = [[[self getSession] getSessionShareStatisticInfo] recvJitter];
    NSInteger recvLatency = [[[self getSession] getSessionShareStatisticInfo] recvLatency];
    CGFloat recvPacketLossAvg = [[[self getSession] getSessionShareStatisticInfo] recvPacketLossAvg];
    CGFloat recvPacketLossMax = [[[self getSession] getSessionShareStatisticInfo] recvPacketLossMax];
    NSInteger sendFps = [[[self getSession] getSessionShareStatisticInfo] sendFps];
    NSInteger sendFrameHeight = [[[self getSession] getSessionShareStatisticInfo] sendFrameHeight];
    NSInteger sendFrameWidth = [[[self getSession] getSessionShareStatisticInfo] sendFrameWidth];
    NSInteger sendJitter = [[[self getSession] getSessionShareStatisticInfo] sendJitter];
    NSInteger sendLatency = [[[self getSession] getSessionShareStatisticInfo] sendLatency];
    CGFloat sendPacketLossAvg = [[[self getSession] getSessionShareStatisticInfo] sendPacketLossAvg];
    CGFloat sendPacketLossMax = [[[self getSession] getSessionShareStatisticInfo] sendPacketLossMax];
    NSDictionary *dict = @{
        @"recvFps": @(recvFps),
        @"recvFrameHeight": @(recvFrameHeight),
        @"recvFrameWidth": @(recvFrameWidth),
        @"recvJitter": @(recvJitter),
        @"recvLatency": @(recvLatency),
        @"recvPacketLossAvg": @(recvPacketLossAvg),
        @"recvPacketLossMax": @(recvPacketLossMax),
        @"sendFps": @(sendFps),
        @"sendFrameHeight": @(sendFrameHeight),
        @"sendFrameWidth": @(sendFrameWidth),
        @"sendJitter": @(sendJitter),
        @"sendLatency": @(sendLatency),
        @"sendPacketLossAvg": @(sendPacketLossAvg),
        @"sendPacketLossMax": @(sendPacketLossMax),
    };

    resolve(dict);
}

RCT_EXPORT_METHOD(getShareRecvFps:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFps = [[[self getSession] getSessionShareStatisticInfo] recvFps];
    resolve(@(recvFps));
}

RCT_EXPORT_METHOD(getShareRecvFrameHeight:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFrameHeight = [[[self getSession] getSessionShareStatisticInfo] recvFrameHeight];
    resolve(@(recvFrameHeight));
}

RCT_EXPORT_METHOD(getShareRecvFrameWidth:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvFrameWidth = [[[self getSession] getSessionShareStatisticInfo] recvFrameWidth];
    resolve(@(recvFrameWidth));
}

RCT_EXPORT_METHOD(getShareRecvJitter:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvJitter = [[[self getSession] getSessionShareStatisticInfo] recvJitter];
    resolve(@(recvJitter));
}

RCT_EXPORT_METHOD(getShareRecvLatency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger recvLatency = [[[self getSession] getSessionShareStatisticInfo] recvLatency];
    resolve(@(recvLatency));
}

RCT_EXPORT_METHOD(getShareRecvPacketLossAvg:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat recvPacketLossAvg = [[[self getSession] getSessionShareStatisticInfo] recvPacketLossAvg];
    resolve(@(recvPacketLossAvg));
}

RCT_EXPORT_METHOD(getShareRecvPacketLossMax:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat recvPacketLossMax = [[[self getSession] getSessionShareStatisticInfo] recvPacketLossMax];
    resolve(@(recvPacketLossMax));
}

RCT_EXPORT_METHOD(getShareSendFps:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFps = [[[self getSession] getSessionShareStatisticInfo] sendFps];
    resolve(@(sendFps));
}

RCT_EXPORT_METHOD(getShareSendFrameHeight:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFrameHeight = [[[self getSession] getSessionShareStatisticInfo] sendFrameHeight];
    resolve(@(sendFrameHeight));
}

RCT_EXPORT_METHOD(getShareSendFrameWidth:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendFrameWidth = [[[self getSession] getSessionShareStatisticInfo] sendFrameWidth];
    resolve(@(sendFrameWidth));
}

RCT_EXPORT_METHOD(getShareSendJitter:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendJitter = [[[self getSession] getSessionShareStatisticInfo] sendJitter];
    resolve(@(sendJitter));
}

RCT_EXPORT_METHOD(getShareSendLatency:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSInteger sendLatency = [[[self getSession] getSessionShareStatisticInfo] sendLatency];
    resolve(@(sendLatency));
}

RCT_EXPORT_METHOD(getShareSendPacketLossAvg:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat sendPacketLossAvg = [[[self getSession] getSessionShareStatisticInfo] sendPacketLossAvg];
    resolve(@(sendPacketLossAvg));
}

RCT_EXPORT_METHOD(getShareSendPacketLossMax:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)
{
    CGFloat sendPacketLossMax = [[[self getSession] getSessionShareStatisticInfo] sendPacketLossMax];
    resolve(@(sendPacketLossMax));
}

@end
