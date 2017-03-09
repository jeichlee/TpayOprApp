//
//  ContactViewController.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "ContactViewController.h"
#import "NSData+AESCrypt.h"
#import "NFilterCommon.h"
#import "ContactSelect1Controller.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

@synthesize selector, dp, container;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ContactViewController Load");
    
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"Offsprings"];
    [bandArray addObject:@"Radiohead"];
    [bandArray addObject:@"Muse"];
    [bandArray addObject:@"R.E.M."];
    [bandArray addObject:@"The Killers"];
    [bandArray addObject:@"Social Distortion"];
    
    dp = [[DownPicker alloc] initWithTextField:selector withData:bandArray];
    
    // NFilter 암호화
    NSData *aesData = [[NSData alloc] init];
    NSString *password = @"1234";
    
    NSData *encData = [aesData NF_AES256EncryptWithKey:@"0123456789012345678901" iv:password AESMode:NFilterAESModeCBC];
    
    NSLog(@"%@", encData);
}

// API 선택 변경시 event
- (IBAction)changeAPI:(id)sender {
    NSString *str = [dp getValueAtIndex:dp.selectedIndex];
    NSLog(@"%@", [@"changeAPI : " stringByAppendingString:str]);
    
    ContactSelect1Controller *select1 = [[ContactSelect1Controller alloc] init];
    [select1 viewDidLoad];
    UIView *api1 = [[UIView alloc] initWithFrame:self.container.frame];
    [api1 addSubview:select1.view];
    
    [self.container addSubview:select1.view];
    
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
