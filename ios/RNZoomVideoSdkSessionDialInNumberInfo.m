#import "RNZoomVideoSdkSessionDialInNumberInfo.h"
#import "RCTConvert+RNZoomVideoSdk.h"

@implementation RNZoomVideoSdkSessionDialInNumberInfo

+ (NSDictionary *)mapSessionDialInNumberInfo: (ZoomVideoSDKDialInNumberInfo*) sessionDialInNumberInfo {
    @try {
        NSMutableDictionary *mappedSessionDialInNumberInfo = [[NSMutableDictionary alloc] init];
        NSDictionary *dialInNumberInfoData = @{
                @"countryId": [sessionDialInNumberInfo countryID],
                @"countryCode": [sessionDialInNumberInfo countryCode],
                @"countryName": [sessionDialInNumberInfo countryName],
                @"number": [sessionDialInNumberInfo number],
                @"displayNumber": [sessionDialInNumberInfo displayNumber],
                @"type": [[RCTConvert ZoomVideoSDKDialInNumTypeValuesReversed] objectForKey: @([sessionDialInNumberInfo type])],
        };
        [mappedSessionDialInNumberInfo setDictionary:dialInNumberInfoData];
        return mappedSessionDialInNumberInfo;
    }
    @catch (NSException *e) {
        return @{};
    }
}

+ (NSMutableArray *)mapSessionDialInNumberInfoArray: (NSArray <ZoomVideoSDKDialInNumberInfo*> *)dialInNumberInfoArray {
    NSMutableArray *mappedDialInNumberInfoArray = [NSMutableArray array];

    @try {
        [dialInNumberInfoArray enumerateObjectsUsingBlock:^(ZoomVideoSDKDialInNumberInfo * _Nonnull sessionDialInNumberInfo, NSUInteger idx, BOOL * _Nonnull stop) {
            [mappedDialInNumberInfoArray addObject: [RNZoomVideoSdkSessionDialInNumberInfo mapSessionDialInNumberInfo: sessionDialInNumberInfo]];
        }];
    }
    @finally {
        return mappedDialInNumberInfoArray;
    }
}

RCT_EXPORT_MODULE()
// TODO: Native methods here

@end