//
//  LisenceSearchView.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 22..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "LisenceSearchView.h"
#import "CommonHeader.h"

@interface LisenceSearchView ()
{
    @private
    CommonHeader *cHeader;
}

@end

@implementation LisenceSearchView

@synthesize mdnVal, resultView;

-(void)send:(UIView *) header{
    NSLog(@"[LisenceSearch API call]");
    
    cHeader = (CommonHeader *)header;
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject:cHeader.mdn forKey:@"MDN"];
    
    // 사용자가 설정한 URL로 변경한다.
    [HTTPClient setBaseURL: cHeader.serverHost];
    
    HTTPClient *client = [HTTPClient sharedHTTPClient:nil];
    [client setDelegate:self];
    
    NSLog(@"params : %@", params);
    
    [client serverAPICall:params andURL:@"App-LisenceSearch"];
    
    NSLog(@"[LisenceSearch API end]");
    
}


-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(id)responseObject
{
//    NSMutableDictionary *dir = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//    NSLog(@"%@", dir);
    //todo: header값을 못불러 오겠다...
    
    NSDictionary *header = (NSDictionary *)[responseObject objectForKey:@"header"];
    NSDictionary *body = (NSDictionary *)[responseObject objectForKey:@"body"];
    
    if(![body isEqual:@""] && [[body objectForKey:@"RESULT_CODE"] isEqualToString:@"0"])
    {
        //LisenceSearch 성공
        NSLog(@"[LisenceSearch 성공]");
        
        NSLog(@"HEADER %@", header);
        NSLog(@"BODY %@", body);
        
        //결과 표시
        resultView.text = (NSString *)body;
        
    } else {
        
        //LisenceSearch 실패
        //todo: Deprecated 현행화 해야 함
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LisenceSearch 실패"
                                                        message:@"파라메터 또는 세션을 확인하여주시기 바랍니다."
                                                       delegate:self
                                              cancelButtonTitle:@"확인"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Linkkage Error"
                                                    message:[error localizedDescription]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
