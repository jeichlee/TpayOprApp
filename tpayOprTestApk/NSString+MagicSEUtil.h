//
//  NSString+MagicSEUtil.h
//  tpayOprTestApk
//
//  Created by Elite on 2017. 3. 9..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"
#import "NSString+Common.h"

@interface MagicSEUtil : NSObject<HTTPClientDelegate>


// 외부 사용 함수
-(NSString *) MSE_Init;                      // 암복호화 Session_key Get
-(NSString *) MSE_Enc:(NSString *)pureStr;   // 암복호화 Session_key 기준으로 String을 암호화
-(NSString *) MSE_Dec:(NSString *)encStr;    // 암복호화 Session_key 기준으로 String을 복호화

-(void) FreeMSE;

// 내부 함수
-(void)         INN_Call_Seq:(NSString *)func_name;     // 순차적 함수 호출
-(void)         INN_MSE_Handshake;                      // Session_key가 없는경우(만료 또는 미생성) 위 getMSESessionKey함수에서 사용
-(void)         INN_SecurityCertificate;                // 서버 호출하여 인증서 수신
-(void)         INN_SessionInitialize;
//-(NSString *)   INN_Make_SessionKey;                    // 수신한 서버인증서 기준 Client Session Key 생성




@end
