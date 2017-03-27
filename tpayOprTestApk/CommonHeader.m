//
//  CommonHeader.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <CommonHeader.h>
#import "UserInfo.h"

@interface CommonHeader ()

@end

@implementation CommonHeader

@synthesize serverType, mdnSelector, dpServerType, dpMDN;
@synthesize serverHost, mdn;

-(CommonHeader *) init{
    NSLog(@"CommonHeader init");
    
    self = [super init];
    
    NSMutableArray* serverTypeArray = [[NSMutableArray alloc] initWithArray:[[[NSString alloc] init] getKeys]];
    NSMutableArray* mdnArray = [[NSMutableArray alloc] init];
    
    // serverType 설정
    
    dpServerType = [[DownPicker alloc] initWithTextField:serverType withData:serverTypeArray];
    [dpServerType setSelectedIndex:0];
    [self changeServerType:nil];
    
    // MDN 설정 - 임시
    [mdnArray addObject:[UserInfo getUserMdn]];
    
    dpMDN = [[DownPicker alloc] initWithTextField:mdnSelector withData:mdnArray];
    [dpMDN setSelectedIndex:0];
    [self changeMDN:nil];
    
    return self;
}

-(IBAction) changeServerType:(id)sender{
    NSString *serverTypeStr = [dpServerType getValueAtIndex:dpServerType.selectedIndex];
    
    NSLog(@"%@", serverTypeStr);
    serverHost = [serverTypeStr getProperty];
}

-(IBAction)changeMDN:(id)sender{
    NSString *mdnStr = [dpMDN getValueAtIndex:dpMDN.selectedIndex];
    
    mdn = [mdnStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
}


-(IBAction) sessionInit:(id)sender{
    
}

@end
