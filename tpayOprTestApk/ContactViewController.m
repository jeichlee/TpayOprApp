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
#import "CommonHeader.h"
#import "NSString+MagicSEUtil.h"

// API 헤더 import
#import "ContactSelectView.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

@synthesize selector, dp, container, header;
@synthesize contactView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ContactViewController Load");
    
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // API 목록 관리
    [bandArray addObject:@"전체"];
    [bandArray addObject:@"T Pay 개발팀"];
    [bandArray addObject:@"CSP"];
    [bandArray addObject:@"TRBS"];
    [bandArray addObject:@"Infra"];
    
    dp = [[DownPicker alloc] initWithTextField:selector withData:bandArray];
    
    // Header 초기화
    header = [header init];
    
    // NFilter 암호화
    NSData *aesData = [[NSData alloc] init];
    NSString *password = @"1234";
    
    NSData *encData = [aesData NF_AES256EncryptWithKey:@"0123456789012345678901" iv:password AESMode:NFilterAESModeCBC];
    
    NSLog(@"%@", encData);
    
    
    // MagicSE 암호화
    NSString *magicStr = @"";
    
    magicStr = [NSString stringWithFormat:@"%@", [magicStr MagicSE_Enc:@"ABC"]] ;
    
    NSLog(@"%@", magicStr);
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
    [[[self.container subviews] lastObject] removeFromSuperview];
    [self.container addSubview:contactView];
}

// 전송 버튼 클릭 시 event
/*
 API View에 해당하는 View Class로 send 이벤트 발생시키는 메서드로 API 추가시에 수정 할 필요없음.
 */
- (IBAction)send:(id)sender{
    [[[self.container subviews] lastObject] send];
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
