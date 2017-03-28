//
//  ContactSelect1Controller.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 9..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "ContactSelectView.h"
@interface ContactSelectView ()
{
    @private
    CommonHeader *cHeader;
}
@end

@implementation ContactSelectView

@synthesize tView;

-(void)send:(UIView *) header{
    tView = [[ContactTableView alloc] init];
    cHeader = (CommonHeader *)header;
    
    
    NSLog(@"header serverHost : %@", cHeader.serverHost);
}


@end
