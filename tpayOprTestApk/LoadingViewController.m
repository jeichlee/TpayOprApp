//
//  LoadingViewController.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "LoadingViewController.h"
#import "AppTestViewController.h"
#import "AFNetworking.h"
#import "HTTPClient.h"
#import "NSString+MagicSEUtil.h"
#import "MagicSEUtil.h"

@interface LoadingViewController ()

@property (strong, nonatomic) NSURLConnection *connectionManager;
@property (strong, nonatomic) NSMutableData *downloadedMutableData;
@property (strong, nonatomic) NSURLResponse *urlResponse;

@end

@implementation LoadingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self testProgress:0.00];
    
    MagicSEUtilTest *util = [[MagicSEUtilTest alloc] init];
    [util INN_SecurityCertificate];
    
//    HTTPClient *client = [HTTPClient sharedHTTPClient:nil];
//    [client setDelegate:self];
//    [client serverAPICall:nil andURL:@"App-MDNSearchForOpr"];
    
}

-(void) updateProgress:(NSNumber *)percent
{
    NSLog(@"[updateProgress] %f", [self.progressView progress]);
    [self.progressView setProgress:percent.floatValue];
    NSLog(@"[updateProgress] %f", [self.progressView progress]);
    
}


-(void) testProgress:(float)num
{
    NSLog(@"[testProgress]");
    [self performSelectorOnMainThread:@selector(updateProgress:) withObject:[NSNumber numberWithFloat:num] waitUntilDone:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)HTTPClient:(HTTPClient *)sharedHTTPClient didSucceedWithResponse:(NSMutableDictionary *)responseObject
{
    NSLog(@"didSucceedWithResponse | LoadingViewController");
    [self testProgress:0.50];
//    NSLog(@"###%@", responseObject);
//    NSLog(@"###%@", [responseObject objectForKey:@"Header"]);
    
    NSDictionary *header = (NSDictionary *)[responseObject objectForKey:@"header"];
    NSDictionary *body = (NSDictionary *)[responseObject objectForKey:@"body"];
    NSLog(@"HEADER %@", header);
    NSLog(@"BODY %@", body);
    
    if([[body objectForKey:@"RESULT_CODE"] isEqualToString:@"0"])
    {
        //MDNSearch성공 - MDN 기준으로 MDNSearchForOpr 처리시작
        NSLog(@"[MDNSearchForOpr 성공] MDN=%@", [body objectForKey:@"MDN"]);
        [self testProgress:1.00];
        

        
        MagicSEUtilTest *util = [[MagicSEUtilTest alloc] init];
        [util INN_SecurityCertificate];
        
        
        //Page 이동
        [NSThread sleepForTimeInterval:1];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        [self presentViewController:[storyboard instantiateViewControllerWithIdentifier:@"MainTabBar"] animated:YES completion:nil];
    } else {
        
        //MDNSearchForOpr 실패
        //todo: Deprecated 현행화 해야 함
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"로그인 실패"
                                                  message:@"인가되지 않은 사용자입니다. 앱을 종료 합니다"
                                                  delegate:self
                                                  cancelButtonTitle:@"확인"
                                                  otherButtonTitles:nil];
        [alert show];
        exit(0); //팝업 후 프로그램 종료
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
