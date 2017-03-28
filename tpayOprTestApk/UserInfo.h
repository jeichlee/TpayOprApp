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
static NSString *mdn;
static NSString *userDeviceId;
static NSString *serverCertificate;
static NSString *mseSessionKey;
static NSString *jsessionId;
static NSString *nfilterPublicKey;
static NSString *serverSessionId;



@interface UserInfo : NSObject

+(NSString *)       getUserMdn;
+(NSMutableArray *) getUserAllMdn;
+(NSString *)       getUserDeviceId;
+(NSString *)       getServerCerificate;
+(NSString *)       getJsessionId;
+(NSString *)       getMseSessionKey;
+(NSString *)       getNfilterPublicKey;
+(NSString *)       getServerSessionId;


+(void) setUserMdn:(NSString *)_mdn;
+(void) setServerCertificate:(NSString *)_cert;
+(void) setJsessionId:(NSString *)_session;
+(void) setUserDeviceId:(NSString *)_deviceId;
+(void) setMseSessionKey:(NSString *)_mseSessionKey;
+(void) setNfilterPublicKey:(NSString *)_nfilterPublicKey;
+(void) setServerSessionId:(NSString *)_serverSessionId;

// SessionExpired시 모두 초기화
+(void) freeExpiredInfo;


@end
