//
//  CommonHeader.h
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"
#import "NSString+Common.h"

@interface CommonHeader : UIView

@property(strong, nonatomic) DownPicker *dpServerType;
@property(strong, nonatomic) DownPicker *dpMDN;
@property(strong, nonatomic) IBOutlet UITextField *serverType;
@property(strong, nonatomic) IBOutlet UITextField *mdnSelector;

@property(strong, nonatomic) NSString *serverHost;
@property(strong, nonatomic) NSString *mdn;

-(CommonHeader *) init;
-(IBAction) changeServerType:(id)sender;
-(IBAction) changeMDN:(id)sender;
-(IBAction) sessionInit:(id)sender;


@end

