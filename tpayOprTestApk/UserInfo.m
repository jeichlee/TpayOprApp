//
//  UserInfo.m
//  tpayOprTestApk
//
//  Created by Kyungsoo.Cho on 2017. 3. 21..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import <UserInfo.h>
#import "HTTPClient.h"

@interface UserInfo ()
@end


@implementation UserInfo




+(NSString *) getUserMdn
{
    return mdn;
}

+(NSMutableArray *) getUserAllMdn
{
    return userMdnArray;
}

+(NSString *) getUserDeviceId
{
    return userDeviceId;
}

+(NSString *) getServerCerificate
{
    return serverCertificate;
}

+(NSString *) getJsessionId
{
    return jsessionId;
}

+(NSString *) getMseSessionKey
{
    return mseSessionKey;
}

+(NSString *)       getNfilterPublicKey
{
    return nfilterPublicKey;
}

+(NSString *) getServerSessionId
{
    return serverSessionId;
}



+(void) setUserMdn:(NSString *)_mdn
{
    NSLog(@"setUserMdn=%@",_mdn);
    mdn = _mdn;
}

+(void) setServerCertificate:(NSString *)_cert
{
    NSLog(@"setServerCertificate=%@",_cert);
    serverCertificate = _cert;
}

+(void) setJsessionId:(NSString *)_session
{
    NSLog(@"setJsessionId=%@",_session);
    jsessionId = _session;
}

+(void) setUserDeviceId:(NSString *)_deviceId
{
    NSLog(@"setUserDeviceId=%@",_deviceId);
    userDeviceId = _deviceId;
}

+(void) setMseSessionKey:(NSString *)_mseSessionKey
{
    NSLog(@"setMseSessionKey=%@",_mseSessionKey);
    mseSessionKey = _mseSessionKey;
}

+(void) setNfilterPublicKey:(NSString *)_nfilterPublicKey
{
    NSLog(@"setNfilterPublicKey=%@",_nfilterPublicKey);
    nfilterPublicKey = _nfilterPublicKey;
}

+(void) freeExpiredInfo
{
    
}

+(void) setServerSessionId:(NSString *)_serverSessionId
{
    serverSessionId = _serverSessionId;
}

@end
