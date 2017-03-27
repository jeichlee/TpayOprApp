//
//  UserInfo.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 21..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UserInfo.h>

@interface UserInfo ()
@end


@implementation UserInfo


-(UserInfo *) init{
    if(userMdnArray == nil || userMdnArray.count <= 0){
        userMdnArray = [[NSMutableArray alloc] init];
    }
    
    if(userDeviceId == nil || [userDeviceId isEqual: @""]){
        userDeviceId = [[NSString alloc] init];
    }
    
    if(securetyCert == nil || [securetyCert isEqual: @""]){
        securetyCert = [[NSString alloc] init];
    }
    
    return self;
}

/* ********************************************
 첫 번째 전화번호 1개를 반환한다.
******************************************** */
+(NSString *) getUserMdn{
    if(userMdnArray.count <= 0){
        return nil;
    }
    
    return [userMdnArray firstObject];
}

/* ********************************************
 특정 Index 전화번호 1개를 반환한다.
 ******************************************** */
+(NSString *) getUserMdn:(int) index{
    if(userMdnArray.count <= 0){
        return nil;
    }
    
    return [userMdnArray objectAtIndex:index];
}

/* ********************************************
 전체 전화번호를 반환한다.
 ******************************************** */
+(NSMutableArray *) getUserAllMdn{
    if(userMdnArray.count <= 0){
        return nil;
    }
    
    return userMdnArray;
}

/* ********************************************
 DeviceID 를 반환한다.
 ******************************************** */
+(NSString *) getUserDeviceId{
    return userDeviceId;
}


/* ********************************************
 전화번호를 추가한다.
 ******************************************** */
+(void) setUserMdn:(NSString *)mdn{
    [userMdnArray addObject:mdn];
}


/* ********************************************
 DeviceId 를 지정한다.
 ******************************************** */
+(void) setUserDeviceId:(NSString *)deviceId{
    userDeviceId = deviceId;
}


/* ********************************************
 특정 index 혹은, 특정 mdn을 삭제한다.
 ******************************************** */
+(BOOL) removeUserMdn:(int) index targetMdn:(NSString *)mdn{
    if(userMdnArray.count <= 0){
        return NO;
    }
    
    // index 로 지우는 경우
    if(mdn == nil || [mdn isEqual:@""]){
        index = (index < 0 ? 0 : index);
        
        [userMdnArray removeObjectAtIndex:index];
    }
    // MDN 으로 지우는 경우
    else{
        [userMdnArray removeObject:mdn];
    }
    
    return YES;
}

/* ********************************************
 전체 MDN을 삭제한다.
 ******************************************** */
+(BOOL) removeUserAllMdn{
    if(userMdnArray.count <= 0){
        return NO;
    }
    
    userMdnArray = [[NSMutableArray alloc] init];
    
    return YES;
}

/* ********************************************
 securetyCertificate 정보를 세팅한다.
 ******************************************** */
+(void) setSecurityCert:(NSString *)cert{
    securetyCert = cert;
}

/* ********************************************
 securetyCertificate 정보를 가져온다.
 ******************************************** */
+(NSString *) getSecurityCert{
    return securetyCert;
}

/* ********************************************
 securetyCertificate 정보를 세팅한다.
 ******************************************** */
+(void) setJsessionId:(NSString *)session{
    jsessionId = session;
}

/* ********************************************
 securetyCertificate 정보를 가져온다.
 ******************************************** */
+(NSString *) getJsessionId{
    return jsessionId;
}

@end
