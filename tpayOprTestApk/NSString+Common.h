//
//  NSString+CommonUtil.h
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 16..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

-(NSString *) getProperty:(NSString *)pName;
-(char *) NSStringToChar:(NSString *)str;
-(NSString *) CharToNSString:(char *)ch;

@end
