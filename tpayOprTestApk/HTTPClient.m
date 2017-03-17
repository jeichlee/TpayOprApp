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

+(HTTPClient *)sharedHTTPClient
{
    static HTTPClient *_sharedHTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHTTPClient = [[self alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _sharedHTTPClient.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedHTTPClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_sharedHTTPClient.requestSerializer setValue:@"_JSON_MESSAGE_" forHTTPHeaderField:@"_X2_IDENTIFIER_KEY_"];
        [_sharedHTTPClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      
    });
    return _sharedHTTPClient;
}

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

-(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock:(UIView *)progressBackground{
    return ^(NSURLSessionDataTask *task, id responseObject){
        if([self.delegate respondsToSelector:@selector(HTTPClient:didSucceedWithResponse:)]) {
            [self.delegate HTTPClient:self didSucceedWithResponse:responseObject];
        } else {
            NSLog(@"Delegate do not response success service");
        }
        [MBProgressHUD hideHUDForView:progressBackground animated:YES];
    };
}

-(void (^)(NSURLSessionDataTask *task, NSError * error))failBlock:(UIView *)progressBackground{
    return ^(NSURLSessionDataTask *task, NSError *error){
        if([self.delegate respondsToSelector:@selector(HTTPClient:didFailWithError:)]) {
            [self.delegate HTTPClient:self didFailWithError:error];
        } else {
            NSLog(@"Delegate do not response failed service");
        }
        [MBProgressHUD hideHUDForView:progressBackground animated:YES];
    };
}

-(void)serverAPICall:(NSDictionary *)parameters andURL:(NSString *)api_type
{
    NSString *url = [baseURL stringByAppendingString:api_type];
    UIView *progressBackground = [(UIViewController *)self.delegate view];
    [MBProgressHUD showHUDAddedTo:progressBackground animated:YES];
    [self POST:url parameters:parameters  success:[self successBlock:progressBackground] failure:[self failBlock:progressBackground]];
}

@end
