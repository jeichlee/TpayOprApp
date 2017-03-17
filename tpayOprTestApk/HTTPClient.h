//
//  HTTPClient.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol HTTPClientDelegate;
@interface HTTPClient : AFHTTPSessionManager

@property(nonatomic, weak) id<HTTPClientDelegate>delegate;

//Initialization Methods
+(HTTPClient *)sharedHTTPClient;
-(instancetype)initWithBaseURL:(NSURL *)url;
-(void)serverAPICall:(NSDictionary *)parameters andURL:(NSString *)api_type;

@end

@protocol HTTPClientDelegate <NSObject>

@optional
-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(id)responseObject;
-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithOperations:(NSArray *)operations;
-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didFailWithError:(NSError *)error;


@end


