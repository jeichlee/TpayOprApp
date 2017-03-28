//
//  CommonMessageView.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 28..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonMessageView.h"
#import "CommonHeader.h"

@interface CommonMessageView ()
{
    @private
    CommonHeader *cHeader;
}
@end

@implementation CommonMessageView

@synthesize resultView, updatedDate, updatedTime;

-(void)send:(UIView *) header{
    NSLog(@"[CommonMessage API call]");
    
    cHeader = (CommonHeader *)header;
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyyMMdd"];
    NSString *date = [df stringFromDate:updatedDate.date];
    [df setDateFormat:@"hhmmss"];
    date = [date stringByAppendingString:[df stringFromDate:updatedTime.date]];
    
    [params setObject:cHeader.mdn forKey:@"MDN"];
    [params setObject:date forKey:@"UPDATED_DATE"];
    
    // 사용자가 설정한 URL로 변경한다.
    [HTTPClient setBaseURL: cHeader.serverHost];
    
    HTTPClient *client = [HTTPClient sharedHTTPClient:nil];
    [client setDelegate:self];
    
    NSLog(@"params : %@", params);
    
    [client serverAPICall:params andURL:@"App-CommonMessage"];
    
    NSLog(@"[CommonMessage API end]");
    
}


-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(id)responseObject
{
    //    NSMutableDictionary *dir = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
    //    NSLog(@"%@", dir);
    //todo: header값을 못불러 오겠다...
    
    NSDictionary *header = (NSDictionary *)[responseObject objectForKey:@"header"];
    NSDictionary *body = (NSDictionary *)[responseObject objectForKey:@"body"];
    
    NSLog(@"HEADER %@", header);
    NSLog(@"BODY %@", body);
    
    if(![body isEqual:@""] && [[body objectForKey:@"RESULT_CODE"] isEqualToString:@"0"])
    {
        //CommonMessage 성공
        NSLog(@"[CommonMessage 성공]");
        
        //결과 표시
        NSString *RESULT_CODE = (NSString *)[body objectForKey:@"RESULT_CODE"];
        NSArray *MESSAGE_LIST = (NSArray *)[body objectForKey:@"MESSAGE_LIST"];
        
        NSString *encodedString = @"";
        
        for (int i = 0 ; i < MESSAGE_LIST.count ; i++){
            encodedString = [encodedString stringByAppendingString:@"\nMESSAGE = "];
            NSString *encodeStr = [(NSDictionary *)[MESSAGE_LIST objectAtIndex:i] objectForKey:@"MESSAGE"];
            encodedString = [encodedString stringByAppendingString:encodeStr];
            
            NSString *messageCode = [(NSDictionary *)[MESSAGE_LIST objectAtIndex:i] objectForKey:@"MESSAGE_CODE"];
            encodedString = [encodedString stringByAppendingString:@"\nMESSAGE_CODE = "];
            encodedString = [encodedString stringByAppendingString:messageCode];
        }
        
        NSString *result = @"RESULT_CODE = ";
        result = [result stringByAppendingString: RESULT_CODE];
        result = [result stringByAppendingString: @"\nMESSAGE_LIST = "];
        result = [result stringByAppendingString: encodedString];
        
        
        resultView.text = result;
        
    } else {
        
        //CommonMessage 실패
        //todo: Deprecated 현행화 해야 함
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CommonMessage 실패"
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
