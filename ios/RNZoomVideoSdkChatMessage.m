#import "RNZoomVideoSdkChatMessage.h"
#import "RNZoomVideoSdkUser.h"

@implementation RNZoomVideoSdkChatMessage

+ (NSDictionary *)mapChatMessage: (ZoomVideoSDKChatMessage *)chatMessage {
    @try {
        NSMutableDictionary *mappedChatMessage = [[NSMutableDictionary alloc] init];
        NSDictionary *chatData = @{
            @"content": [chatMessage content],
            @"senderUser": [RNZoomVideoSdkUser mapUser:[chatMessage senderUser]],
            @"timestamp": @([chatMessage timeStamp]),
            @"isChatToAll": @([chatMessage isChatToAll]),
            @"isSelfSend": @([chatMessage isSelfSend]),
            @"messageID": [chatMessage messageID]
        };
        [mappedChatMessage setDictionary:chatData];
        ZoomVideoSDKUser *receiverUser = [chatMessage receiverUser];
        if (receiverUser != nil) {
            mappedChatMessage[@"receiverUser"] = [RNZoomVideoSdkUser mapUser:receiverUser];
        }
        return mappedChatMessage;
    }
    @catch (NSException *e) {
        return @{};
    }
}

RCT_EXPORT_MODULE()
// TODO: Native methods here

@end
