//
//  SecondViewController.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"

@interface PayTestViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *selector;
@property (strong, nonatomic) DownPicker *dp;
@property (strong, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) IBOutlet UIView *header;



-(IBAction) send:(id)sender;
-(IBAction) changeAPI:(id)sender;

@end
