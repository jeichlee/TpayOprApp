//
//  NSString_Utilities.m
//  tpayOprTestApk
//
//  Created by jeichlee on 2017. 3. 7..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

-(BOOL) isUrl:(NSString *)str
{
    if([@"" isEqualToString:str])
    {
        return NO;
    }
    else
    {
        return YES;
        
    }
}


@end
