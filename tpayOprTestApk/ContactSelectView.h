//
//  ContactSelect1Controller.h
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 9..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactSelectView : UIView

@property (strong, nonatomic) IBOutlet UITableView *tView;

// Controller에서 호출하는 메서드 반드시 구현
-(void)send;

@end



