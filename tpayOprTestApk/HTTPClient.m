//
//  HTTPClient.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "HTTPClient.h"
#import "MBProgressHUD.h"

static NSString *baseURL = @"http://61.250.22.44:8001/app/handler/";

@implementation HTTPClient


// HTTPClient 객체 초기화(Singleton)
+(HTTPClient *)sharedHTTPClient:(NSString *)jsessionid
{
    static HTTPClient *_sharedHTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHTTPClient = [[self alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _sharedHTTPClient.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedHTTPClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_sharedHTTPClient.requestSerializer setValue:@"_JSON_MESSAGE_" forHTTPHeaderField:@"_X2_IDENTIFIER_KEY_"];
        [_sharedHTTPClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        if(jsessionid != nil) {
//            [_sharedHTTPClient.requestSerializer setValue:@"JSessionID" forHTTPHeaderField:jsessionid];
//        }
    });
    return _sharedHTTPClient;
}

// HTTPClient 객체 초기화 시 사용하는 메서드로 url 세팅 - 미사용
-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if(self)
    {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}


// HTTP 요청에 대한 응답 콜백을 HTTPClient Delegate에게 포워딩(Success시) - 해당 이벤트 시 구현은 각 viewController에서 구현
-(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock:progressBackground {
    return ^(NSURLSessionDataTask *task, id responseObject){
        NSHTTPURLResponse *response = ((NSHTTPURLResponse *)[task response]);
        NSDictionary *header = [response allHeaderFields];
        NSDictionary *body = [NSJSONSerialization JSONObjectWithData:responseObject options:1 error:nil];
        NSMutableDictionary *responseHeaderAndBody = [[NSMutableDictionary alloc]init];
        [responseHeaderAndBody setObject:header forKey:@"header"];
        [responseHeaderAndBody setObject:body forKey:@"body"];
        
        if([self.delegate respondsToSelector:@selector(HTTPClient:didSucceedWithResponse:)]) {
            [self.delegate HTTPClient:self didSucceedWithResponse:responseHeaderAndBody];
        } else {
            NSLog(@"Delegate do not response success service");
        }
        if(progressBackground != nil){
            [MBProgressHUD hideHUDForView:progressBackground animated:YES];
        }
    };
}


// HTTP 요청에 대한 응답 콜백을 HTTPClient Delegate에게 포워딩(Fail시) - 해당 이벤트 시 구현은 각 viewController에서 구현
-(void (^)(NSURLSessionDataTask *task, NSError * error))failBlock:progressBackground {
    return ^(NSURLSessionDataTask *task, NSError *error){
        if([self.delegate respondsToSelector:@selector(HTTPClient:didFailWithError:)]) {
            [self.delegate HTTPClient:self didFailWithError:error];
        } else {
            NSLog(@"Delegate do not response failed service");
        }
        if(progressBackground != nil){
            [MBProgressHUD hideHUDForView:progressBackground animated:YES];
        }
    };
}


// HTTP Request 하는 부분
-(void)serverAPICall:(NSDictionary *)parameters andURL:(NSString *)api_type
{
    NSLog(@"serverAPICall | api_type=%@", api_type);
    //todo: 위 baseURL을 Const로 선언하고 url 조합을 하고 싶은데 안된다...
    NSString *url = [baseURL stringByAppendingString:api_type];
    
    UIView *progressBackground = [[UIView alloc] init];
    if ([self.delegate isKindOfClass:[UIViewController class]] == 1){
        progressBackground = [(UIViewController *)self.delegate view];
    }else if([self.delegate isKindOfClass:[UIView class]] == 1){
        progressBackground = (UIView *)self.delegate;
    }else {
        progressBackground = [[UIView alloc] init];
    }
    
    [MBProgressHUD showHUDAddedTo:progressBackground animated:YES];
    //todo: Deprecated된 부분을 현행화 해야 함...
    [self POST:url parameters:parameters  success:[self successBlock:progressBackground] failure:[self failBlock:progressBackground]];
}

// baseURL 변경처리
+(void)setBaseURL:(NSString *)url{
    baseURL = url;
}

@end
