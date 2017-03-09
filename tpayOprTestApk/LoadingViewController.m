//
//  LoadingViewController.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@property (strong, nonatomic) NSURLConnection *connectionManager;
@property (strong, nonatomic) NSMutableData *downloadedMutableData;
@property (strong, nonatomic) NSURLResponse *urlResponse;

@end

@implementation LoadingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.devfright.com/wp-content/uploads/2014/05/Phone4Wallpaper.jpg"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
    
    self.connectionManager = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    self.downloadedMutableData = [[NSMutableData alloc]init];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"%lld", response.expectedContentLength);
    self.urlResponse = response;
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.downloadedMutableData appendData:data];
    self.progressView.progress = ((100.0/self.urlResponse.expectedContentLength)*self.downloadedMutableData.length)/100;
    
    if(self.progressView.progress == 1) {
        self.progressView.hidden = YES;
    } else {
        self.progressView.hidden = NO;
    }
    
    NSLog(@"%.0f%%", ((100.0/self.urlResponse.expectedContentLength)*self.downloadedMutableData.length));
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSLog(@"finished");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
