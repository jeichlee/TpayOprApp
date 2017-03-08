//
//  NFilterCommon.h
//  nFileterForiPhone
//
//  Created by 김기원 on 2016. 2. 16..
//
//

@import Foundation;

#define NF_versionInfo @"nFilter iOS 5.4.8"

typedef NS_ENUM (NSInteger, NFilterMasking)
{
    NFilterMaskingDefault,
    NFilterMaskingAll
};

typedef NS_ENUM (NSInteger, NFilterAttachType)
{
    NFilterAttachView,
    NFilterAttachViewController
};

typedef NS_ENUM (NSInteger, NFilterAESMode)
{
    NFilterAESModeCBC,
    NFilterAESModeECB
};

@interface NFilterCommon : NSObject
{
    
}

+ (void)soundPlay:(NSString*)pSoundFile;
@end