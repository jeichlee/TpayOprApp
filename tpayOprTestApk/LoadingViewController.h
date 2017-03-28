//
//  LoadingViewController.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//  앱 구동 초기 화면 View Controller

#import <UIKit/UIKit.h>
#import "HTTPClient.h"

@interface LoadingViewController : UIViewController<HTTPClientDelegate>


@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UIButton *btnNext;




@end
