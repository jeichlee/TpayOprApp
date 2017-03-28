//
//  MagicSEUtil.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 27..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "HTTPClient.h"
#import <UIKit/UIKit.h>

@interface MagicSEUtil : UIView <HTTPClientDelegate>

//@property(strong, nonatomic) id<HTTPClientDelegate> delegate;
//@property(nonatomic, copy) void (^didSucceedWithResponse)(NSMutableDictionary *);
//@property(nonatomic, copy) void (^didFailWithError)(NSError *);

-(NSString *) MSE_Init;                      // 암복호화 Session_key Get
-(NSString *) MSE_Enc:(NSString *)pureStr;   // 암복호화 Session_key 기준으로 String을 암호화
-(NSString *) MSE_Dec:(NSString *)encStr;    // 암복호화 Session_key 기준으로 String을 복호화

-(void) FreeMSE;

-(void)         INN_Call_Seq:(NSString *)func_name;     // 순차적 함수 호출
-(void)         INN_MSE_Handshake;                      // Session_key가 없는경우(만료 또는 미생성) 위 getMSESessionKey함수에서 사용
-(void)         INN_SecurityCertificate;                // 서버 호출하여 인증서 수신
-(void)         INN_SessionInitialize;

//-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(NSMutableDictionary *)responseObject;





@end
