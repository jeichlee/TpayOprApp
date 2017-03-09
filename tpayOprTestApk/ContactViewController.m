//
//  ContactViewController.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

@synthesize selector, label1, dp;

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
}

// API 선택 변경시 event
- (IBAction)changeAPI:(id)sender {
    NSString *str = [dp getValueAtIndex:dp.selectedIndex];
    NSLog(@"%@", [@"changeAPI : " stringByAppendingString:str]);
    label1.text = str;
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
