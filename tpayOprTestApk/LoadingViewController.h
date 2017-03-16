//
//  LoadingViewController.h
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingViewController : UIViewController<NSURLConnectionDataDelegate>


@property (strong, nonatomic) IBOutlet UIProgressView *progressView;



@end
