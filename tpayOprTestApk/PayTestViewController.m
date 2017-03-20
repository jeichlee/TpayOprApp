//
//  SecondViewController.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "PayTestViewController.h"
#import "CommonHeader.h"

@interface PayTestViewController ()

@end

@implementation PayTestViewController

@synthesize dp, selector, header, container;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"PayTestViewController Load");
    
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // API 목록 관리
    [bandArray addObject:@"Offsprings"];
    [bandArray addObject:@"Radiohead"];
    [bandArray addObject:@"Muse"];
    [bandArray addObject:@"R.E.M."];
    [bandArray addObject:@"The Killers"];
    [bandArray addObject:@"Social Distortion"];
    
    dp = [[DownPicker alloc] initWithTextField:selector withData:bandArray];
    
    // Header 초기화
    header = [header init];
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
     - API 추가시 아래 if 구문에 해당 API View로 전환되도록 내용 추가
     */
//    [[[self.container subviews] lastObject] removeFromSuperview];
//    if([str isEqualToString:@"Offsprings"] == YES){
//        [self.container addSubview:api1];
//    }else{
//        [self.container addSubview:api2];
//    }
}

// 전송 버튼 클릭 시 event
/*
 API View에 해당하는 View Class로 send 이벤트 발생시키는 메서드로 API 추가시에 수정 할 필요없음.
 */
- (IBAction)send:(id)sender{
//    [[[self.container subviews] lastObject] send];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
