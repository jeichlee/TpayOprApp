//
//  CommonMessageView.h
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 28..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HTTPClient.h"

@interface CommonMessageView : UIView<HTTPClientDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *updatedDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *updatedTime;
@property (weak, nonatomic) IBOutlet UITextView *resultView;

// Controller에서 호출하는 메서드 반드시 구현
-(void)send:(UIView *) header;

@end
