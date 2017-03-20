//
//  CommonHeader.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <CommonHeader.h>

@interface CommonHeader ()

@end

@implementation CommonHeader

@synthesize serverType, mdnSelector, dpServerType, dpMDN;
@synthesize serverHost, mdn;

-(CommonHeader *) init{
    NSLog(@"CommonHeader init");
    
    self = [super init];
    
    NSMutableArray* serverTypeArray = [[NSMutableArray alloc] init];
    NSMutableArray* mdnArray = [[NSMutableArray alloc] init];
    
    // serverType 설정
    [serverTypeArray addObject:@"상용"];
    [serverTypeArray addObject:@"상용-고도화"];
    [serverTypeArray addObject:@"개발"];
    [serverTypeArray addObject:@"개발-고도화"];
    [serverTypeArray addObject:@"스테이징"];
    [serverTypeArray addObject:@"스테이징-고도화"];
    
    dpServerType = [[DownPicker alloc] initWithTextField:serverType withData:serverTypeArray];
//    dpServerType.selectedIndex = 0;
    
    // MDN 설정 - 임시
    [mdnArray addObject:@"010-3832-4035"];
    
    dpMDN = [[DownPicker alloc] initWithTextField:mdnSelector withData:mdnArray];
//    dpMDN.selectedIndex = 0;
    
    return self;
}

-(IBAction) changeServerType:(id)sender{
    NSString *serverTypeStr = [dpServerType getValueAtIndex:dpServerType.selectedIndex];
    
    serverHost = [serverHost getProperty:serverTypeStr];
}

-(IBAction)changeMDN:(id)sender{
    NSString *mdnStr = [dpMDN getValueAtIndex:dpMDN.selectedIndex];
    
    mdn = [mdnStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
}


-(IBAction) sessionInit:(id)sender{
    
}

@end
