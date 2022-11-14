#import "RNZoomVideoSdkLiveTranscriptionLanguage.h"

@implementation RNZoomVideoSdkLiveTranscriptionLanguage

+ (NSDictionary *)mapLanguage: (ZoomVideoSDKLiveTranscriptionLanguage*) language {
    @try {
        NSMutableDictionary *mappedLanguage = [[NSMutableDictionary alloc] init];
        NSDictionary *languageData = @{
                @"languageId": @([language languageID]),
                @"languageName": [language languageName],
        };
        [mappedLanguage setDictionary:languageData];
        return mappedLanguage;
    }
    @catch (NSException *e) {
        return @{};
    }
}

+ (NSMutableArray *)mapLanguageArray: (NSArray <ZoomVideoSDKLiveTranscriptionLanguage*> *)languageArray {
    NSMutableArray *mappedLanguageArray = [NSMutableArray array];

    @try {
        [languageArray enumerateObjectsUsingBlock:^(ZoomVideoSDKLiveTranscriptionLanguage * _Nonnull language, NSUInteger idx, BOOL * _Nonnull stop) {
            [mappedLanguageArray addObject: [RNZoomVideoSdkLiveTranscriptionLanguage mapLanguage: language]];
        }];
    }
    @finally {
        return mappedLanguageArray;
    }
}

RCT_EXPORT_MODULE()
// TODO: Native methods here

@end
