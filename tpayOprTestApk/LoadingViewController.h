//
//  LoadingViewController.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingViewController : UIViewController

@property IBOutlet UIProgressView *progressBar;

-(IBAction)controlProgress:(id)sender;

@end
