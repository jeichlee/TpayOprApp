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
#import "ContactSelect1View.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

@synthesize selector, dp, container;
@synthesize api1, api2;

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
    
    if(str == nil){
        return;
    }
    NSLog(@"%@", [@"changeAPI : " stringByAppendingString:str]);
    
    /*
        선택 API에 따라 화면을 변경
     */
    if([str isEqualToString:@"Offsprings"] == YES){
        [self.container addSubview:api1];
    }else{
        [self.container addSubview:api2];
    }
}

// 전송 버튼 클릭 시 event
- (IBAction)send:(id)sender{
    NSString *str = [dp getValueAtIndex:dp.selectedIndex];
    
    if(str == nil){
        return;
    }
    NSLog(@"%@", [@"send : " stringByAppendingString:str]);
    
    /*
     선택 API에 따라 화면을 변경
     */
    if([str isEqualToString:@"Offsprings"] == YES){
        [ContactSelect1View send];
    }
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
