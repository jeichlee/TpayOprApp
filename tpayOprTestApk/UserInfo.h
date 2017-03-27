//
//  UserInfo.h
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 21..
//  Copyright © 2017년 jeichlee. All rights reserved.
//
// 접속 사용자 MDN 및 DeviceID 관리를 위한 클래스
//

#import <Foundation/Foundation.h>

static NSMutableArray *userMdnArray;
static NSString *userDeviceId;

@interface UserInfo : NSObject

+(NSString *) getUserMdn;
+(NSString *) getUserMdn:(int) index;
+(NSMutableArray *) getUserAllMdn;
+(NSString *) getUserDeviceId;

+(void) setUserMdn:(NSString *)mdn;
+(void) setUserDeviceId:(NSString *)deviceId;

+(BOOL) removeUserMdn:(int) index targetMdn:(NSString *)mdn;
+(BOOL) removeUserAllMdn;

@end
