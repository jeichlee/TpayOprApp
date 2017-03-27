//
//  MagicSEUtil.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 27..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "MagicSEUtil.h"
#import "HTTPClient.h"
#import "UserInfo.h"

@interface MagicSEUtilTest()
{
    char callType; // 'C' : SecurityCertificate, 'I' : SessionInitialize
}
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
    callType = 'C';
    
    HTTPClient *client = [HTTPClient sharedHTTPClient:nil];
    [client setDelegate:self];
    
    [client serverAPICall:nil andURL:@"App-SecurityCertificate"];
}

-(void)         INN_SessionInitialize
{
    NSLog(@"INN_SessionInitialize");
    callType = 'I';
    
    HTTPClient *client = [HTTPClient sharedHTTPClient:nil];
    [client setDelegate:self];
    
    [client serverAPICall:nil andURL:@"App-SessionInitialize"];
}

-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(NSMutableDictionary *)responseObject
{
    NSLog(@"didSucceedWithResponse | MagicSEUtil");
    
    
    NSDictionary *header = (NSDictionary *)[responseObject objectForKey:@"header"];
    NSDictionary *body = (NSDictionary *)[responseObject objectForKey:@"body"];
    NSLog(@"HEADER %@", header);
    NSLog(@"BODY %@", body);
    
    if (callType == 'C'){
        [UserInfo setSecurityCert:[body objectForKey:@"SECURITY_CERTIFICATE"]];
    }
    else if (callType == 'I'){
        
    }
    
}

-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError | MagicSEUtil : %@", [error localizedDescription]);
    
    exit(0);
}
@end
