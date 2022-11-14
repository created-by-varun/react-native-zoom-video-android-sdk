#import "RNZoomVideoSdkPhoneSupportCountryInfo.h"

@implementation RNZoomVideoSdkPhoneSupportCountryInfo

+ (NSDictionary *)mapCountry: (ZoomVideoSDKPhoneSupportCountryInfo *) country {
    @try {
        return @{
            @"countryID": [country countryID],
            @"countryName": [country countryName],
            @"countryCode": [country countryCode],
        };
    }
    @catch (NSException *e) {
        return @{};
    }
}

+ (NSMutableArray *)mapPhoneSupportCountryInfo: (NSArray<ZoomVideoSDKPhoneSupportCountryInfo *> *)countryList {

    NSMutableArray *mappedCountryArray = [NSMutableArray array];

    @try {
        [countryList enumerateObjectsUsingBlock:^(ZoomVideoSDKPhoneSupportCountryInfo * _Nonnull country, NSUInteger idx, BOOL * _Nonnull stop){
            [mappedCountryArray addObject: [RNZoomVideoSdkPhoneSupportCountryInfo mapCountry: country]];
        }];
    }
    @finally {
        return mappedCountryArray;
    }
}

RCT_EXPORT_MODULE()

@end
