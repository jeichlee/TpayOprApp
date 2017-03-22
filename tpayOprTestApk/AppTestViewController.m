//
//  FirstViewController.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "AppTestViewController.h"
#import "CommonHeader.h"

@interface AppTestViewController ()

@end

@implementation AppTestViewController

@synthesize dp, selector, header, container;


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
 API View에 해당하는 View Class로 send 이벤트 발생시키는 메서드
 */
- (IBAction)send:(id)sender{
    //    [[[self.container subviews] lastObject] send : header];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
