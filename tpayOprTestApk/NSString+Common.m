//
//  NSString+Common.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

-(NSString *) getProperty{
//    NSLog(@"pName : %@", self);
    
    if(self == nil || [self isEqualToString:@""]){
        return @"";
    }
    
    NSString *pVal = [[NSString alloc] init];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"common.plist"];

//    NSLog(@"finalPath : %@", finalPath);
    
    NSMutableDictionary *namesPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
    
    pVal = [namesPlist objectForKey:self];
    
//    NSLog(@"pVal : %@", pVal);
    
    
    return pVal;
}

-(NSArray *) getKeys{
    NSArray *pVal = [[NSArray alloc] init];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"common.plist"];
    
    NSMutableDictionary *namesPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
    
    pVal = [namesPlist allKeys];
    
    return pVal;
}

-(char *) NSStringToChar:(NSString *)str
{
    return strdup([str UTF8String]);
}

-(NSString *) CharToNSString:(char *)ch
{
    return [NSString stringWithFormat:@"%s", ch];
}

@end
