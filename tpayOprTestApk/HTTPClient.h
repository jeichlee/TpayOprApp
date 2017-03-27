//
//  HTTPClient.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "AFHTTPSessionManager.h"

// 프로토콜 명시
@protocol HTTPClientDelegate;

@interface HTTPClient : AFHTTPSessionManager

@property(nonatomic, weak) id<HTTPClientDelegate>delegate;

+(HTTPClient *)sharedHTTPClient:(NSString *)jsessionid;                                   // HTTPClient 객체 초기화(Singleton)
-(instancetype)initWithBaseURL:(NSURL *)url;                       // HTTPClient 객체 초기화 시 사용하는 메서드로 url 세팅 - 미사용
-(void)serverAPICall:(NSDictionary *)parameters andURL:(NSString *)api_type;  // HTTP Request 하는 부분
+(void)setBaseURL:(NSString *)url;

@end

// 프로토콜 정의
@protocol HTTPClientDelegate <NSObject>

@optional
-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(id)responseObject;
-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithOperations:(NSArray *)operations;
-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didFailWithError:(NSError *)error;


@end


