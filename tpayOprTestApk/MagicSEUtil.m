//
//  MagicSEUtil.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 27..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "MagicSEUtil.h"
#import "HTTPClient.h"

@interface MagicSEUtilTest()

@end

@implementation MagicSEUtilTest

//@synthesize delegate;
//@synthesize didSucceedWithResponse;
//@synthesize didFailWithError;

//-(id) init{
//    NSLog(@"init");
//    self = [super ];
//    
//    return self;
//}

-(NSString *) MSE_Init
{
    return nil;
}

-(id) init
{
    MagicSEUtilTest *MT = [[MagicSEUtilTest alloc]init];
//    MT.d
    return nil;
}


-(NSString *) MSE_Enc:(NSString *)pureStr
{
    return nil;
}

-(NSString *) MSE_Dec:(NSString *)encStr
{
    return nil;
}

-(void) FreeMSE
{
    
}

-(void)         INN_Call_Seq:(NSString *)func_name
{
    
}

-(void)         INN_MSE_Handshake
{
    
}

-(void)         INN_SecurityCertificate
{
    NSLog(@"INN_SecurityCertificate");
    HTTPClient *client = [HTTPClient sharedHTTPClient:nil];
    [client setDelegate:self];
    
    [client serverAPICall:nil andURL:@"App-SecurityCertificate"];
}

-(void)         INN_SessionInitialize
{
    
}

-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(NSMutableDictionary *)responseObject
{
    NSLog(@"didSucceedWithResponse | MagicSEUtil");
//    resultDict = nil;
//    resultDict = responseObject;
    
//    progress_yn = NO;
}

-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError | MagicSEUtil");
//    progr
}
@end
