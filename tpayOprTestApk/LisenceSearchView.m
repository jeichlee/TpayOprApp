//
//  LisenceSearchView.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 22..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "LisenceSearchView.h"

@interface LisenceSearchView ()

@end

@implementation LisenceSearchView

@synthesize mdnVal, resultView;

-(void)send:(UIView *) header{
    NSLog(@"[LisenceSearch API call]");
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject:mdnVal.text forKey:@"MDN"];
    
    HTTPClient *client = [HTTPClient sharedHTTPClient];
    [client setDelegate:self];
    [client serverAPICall:params andURL:@"App-LisenceSearch"];
    
    
}


-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(id)responseObject
{
    NSMutableDictionary *dir = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
    NSLog(@"%@", dir);
    //todo: header값을 못불러 오겠다...
    
    if([[dir objectForKey:@"RESULT_CODE"] isEqualToString:@"0"])
    {
        //LisenceSearch 성공
        NSLog(@"[LisenceSearch 성공]");
        
        //결과 표시
        resultView.text = (NSString *)dir;
        
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
