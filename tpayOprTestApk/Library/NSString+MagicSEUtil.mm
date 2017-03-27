//
//  NSString+MagicSEUtil.m
//  tpayOprTestApk
//
//  Created by Elite on 2017. 3. 9..
//  Copyright © 2017년 jeichlee. All rights reserved.
//

#import "NSString+MagicSEUtil.h"
#include "MagicSE2.h"

@implementation NSString (MagicSEUtil)



unsigned char pRootCert[] = {
    0x30,0x82,0x03,0x5B,0x30,0x82,0x02,0x43,0xA0,0x03,0x02,0x01,0x02,0x02,0x01,0x01,
    0x30,0x0D,0x06,0x09,0x2A,0x86,0x48,0x86,0xF7,0x0D,0x01,0x01,0x0B,0x05,0x00,0x30,
    0x5D,0x31,0x0B,0x30,0x09,0x06,0x03,0x55,0x04,0x06,0x13,0x02,0x4B,0x52,0x31,0x16,
    0x30,0x14,0x06,0x03,0x55,0x04,0x0A,0x0C,0x0D,0x44,0x72,0x65,0x61,0x6D,0x53,0x65,
    0x63,0x75,0x72,0x69,0x74,0x79,0x31,0x12,0x30,0x10,0x06,0x03,0x55,0x04,0x0B,0x0C,
    0x09,0x4D,0x61,0x67,0x69,0x63,0x53,0x45,0x76,0x32,0x31,0x22,0x30,0x20,0x06,0x03,
    0x55,0x04,0x03,0x0C,0x19,0x44,0x72,0x65,0x61,0x6D,0x53,0x65,0x63,0x75,0x72,0x69,
    0x74,0x79,0x20,0x72,0x6F,0x6F,0x74,0x43,0x41,0x20,0x32,0x30,0x34,0x38,0x30,0x1E,
    0x17,0x0D,0x31,0x31,0x30,0x38,0x32,0x39,0x30,0x32,0x33,0x31,0x31,0x30,0x5A,0x17,
    0x0D,0x33,0x36,0x30,0x38,0x32,0x39,0x30,0x32,0x33,0x31,0x31,0x30,0x5A,0x30,0x5D,
    0x31,0x0B,0x30,0x09,0x06,0x03,0x55,0x04,0x06,0x13,0x02,0x4B,0x52,0x31,0x16,0x30,
    0x14,0x06,0x03,0x55,0x04,0x0A,0x0C,0x0D,0x44,0x72,0x65,0x61,0x6D,0x53,0x65,0x63,
    0x75,0x72,0x69,0x74,0x79,0x31,0x12,0x30,0x10,0x06,0x03,0x55,0x04,0x0B,0x0C,0x09,
    0x4D,0x61,0x67,0x69,0x63,0x53,0x45,0x76,0x32,0x31,0x22,0x30,0x20,0x06,0x03,0x55,
    0x04,0x03,0x0C,0x19,0x44,0x72,0x65,0x61,0x6D,0x53,0x65,0x63,0x75,0x72,0x69,0x74,
    0x79,0x20,0x72,0x6F,0x6F,0x74,0x43,0x41,0x20,0x32,0x30,0x34,0x38,0x30,0x82,0x01,
    0x22,0x30,0x0D,0x06,0x09,0x2A,0x86,0x48,0x86,0xF7,0x0D,0x01,0x01,0x01,0x05,0x00,
    0x03,0x82,0x01,0x0F,0x00,0x30,0x82,0x01,0x0A,0x02,0x82,0x01,0x01,0x00,0xD3,0xB7,
    0x6D,0x74,0x8F,0x09,0x63,0x3D,0xD7,0x8B,0x51,0x29,0xE1,0x16,0x8D,0x86,0x21,0x1F,
    0x13,0x95,0x7B,0x3E,0x9B,0xC1,0xE8,0xC4,0x7D,0xD1,0x64,0xE1,0x88,0x66,0x3C,0xA6,
    0x14,0xA9,0xCA,0xF4,0xE6,0x88,0xB9,0xC2,0x98,0x84,0x4D,0xD4,0xA9,0x4E,0xBD,0x07,
    0x82,0x2D,0xE4,0x3F,0x0D,0x02,0x07,0x7E,0x43,0xBB,0x7F,0x59,0xBC,0x2C,0xC0,0x6F,
    0x6F,0xF6,0x9E,0xBF,0xD9,0x57,0x22,0x38,0x6E,0x94,0x1A,0x55,0xE4,0x95,0x68,0xB6,
    0x0A,0xDF,0x60,0xA7,0xEF,0x1C,0x79,0x90,0xE0,0xDB,0x8B,0x2B,0x1E,0xC6,0x4E,0x01,
    0xC9,0xEF,0xBF,0x08,0xB4,0x74,0xDE,0xBE,0x73,0xCD,0x09,0xB3,0x2B,0x4E,0xB7,0x5C,
    0x95,0xBF,0xC1,0x58,0xFD,0x73,0xAF,0x61,0x44,0x8C,0x5B,0x42,0xBA,0x21,0x84,0x00,
    0xBC,0x77,0x42,0xF3,0xFA,0xDF,0xA1,0xD1,0xAA,0x38,0x3C,0x0F,0xC8,0x89,0xF4,0xAE,
    0x84,0xE2,0xF8,0x0C,0xC1,0x7C,0x2F,0x7C,0x43,0xFD,0x1C,0xF2,0x53,0x9D,0x6A,0xBB,
    0x0B,0xC1,0xDA,0x37,0xF0,0x36,0xBB,0x73,0x1D,0x7A,0x73,0x61,0x6C,0x95,0x4D,0xA7,
    0xF3,0xA3,0xE7,0x2E,0xEB,0x35,0x88,0x96,0xDE,0xA3,0x34,0x62,0xD4,0x8D,0x6D,0x6C,
    0x1D,0x38,0x6C,0x54,0xB0,0x5F,0xF6,0x99,0xB9,0x63,0x2E,0x15,0x3D,0xB5,0x9B,0x98,
    0xF3,0xC0,0x37,0x7D,0xFF,0x61,0x19,0x20,0xF1,0x04,0xA3,0x0A,0xA9,0x24,0xBF,0xDE,
    0x46,0xA5,0xFD,0x54,0x49,0xF7,0x1A,0x13,0xBD,0xEB,0xF9,0x97,0xD6,0x2F,0xE5,0x01,
    0x3B,0x4D,0x27,0x84,0x40,0x1F,0xB1,0xE6,0xF6,0x75,0x6A,0xCC,0x2F,0x29,0x02,0x03,
    0x01,0x00,0x01,0xA3,0x26,0x30,0x24,0x30,0x12,0x06,0x03,0x55,0x1D,0x13,0x01,0x01,
    0xFF,0x04,0x08,0x30,0x06,0x01,0x01,0xFF,0x02,0x01,0x00,0x30,0x0E,0x06,0x03,0x55,
    0x1D,0x0F,0x01,0x01,0xFF,0x04,0x04,0x03,0x02,0x02,0x04,0x30,0x0D,0x06,0x09,0x2A,
    0x86,0x48,0x86,0xF7,0x0D,0x01,0x01,0x0B,0x05,0x00,0x03,0x82,0x01,0x01,0x00,0x33,
    0xFC,0xD1,0x52,0x03,0xBB,0x09,0xA0,0xF9,0x5C,0xCD,0x97,0x03,0x21,0xD7,0xB5,0x1C,
    0x52,0xFC,0x50,0x71,0x9B,0x01,0xD4,0xDC,0x96,0xF0,0x86,0x21,0x60,0x0F,0x61,0x46,
    0x00,0x85,0x0C,0x7E,0x18,0xAF,0x51,0x3E,0x7C,0xC6,0x06,0x24,0x8F,0x60,0x0A,0x6B,
    0xC9,0x87,0x48,0x34,0x6F,0xD6,0xAF,0x1E,0xA2,0xAB,0x5D,0x7C,0xD8,0xFD,0x73,0x87,
    0x68,0xB8,0x05,0xB9,0x4F,0x19,0xF5,0x12,0x04,0xF8,0xD4,0xBA,0xAB,0xD3,0xAA,0x84,
    0xEF,0xB1,0xA5,0x17,0xE5,0xF9,0xE4,0xAF,0x7B,0x0C,0x63,0x98,0xF1,0x40,0xA5,0x9D,
    0x8A,0x24,0x73,0xA9,0x87,0xEE,0xCD,0x9C,0x12,0x22,0x59,0xC5,0xE8,0x16,0xD9,0x6C,
    0xA3,0x57,0x00,0x50,0x10,0x3F,0x7F,0x7A,0xB0,0xA2,0xE7,0x09,0xCE,0xC5,0x9A,0xD1,
    0x3F,0xF5,0x06,0x0F,0x84,0xA4,0xE5,0xC2,0xF2,0x6E,0xA4,0x2D,0x9D,0x2E,0x5A,0xE0,
    0x00,0xED,0xC2,0x4B,0x43,0x27,0xC1,0x11,0x85,0x12,0xD2,0x6E,0xAE,0xC2,0xFB,0x13,
    0x8C,0x01,0x07,0xC0,0x4A,0xCE,0x90,0x39,0x87,0x1D,0x27,0xAB,0xC3,0x53,0x69,0x4C,
    0x43,0x2C,0xE2,0x2B,0x37,0x63,0x46,0x1F,0xF1,0xE0,0x20,0x05,0x21,0xCF,0xC1,0x1F,
    0x1F,0x56,0xD4,0x60,0x73,0x09,0x77,0x5A,0x54,0xE1,0x4F,0x54,0x21,0xD4,0xD3,0x23,
    0x3D,0xEC,0x75,0x29,0x91,0xCF,0xFA,0xA0,0xD9,0x59,0x31,0x69,0xA9,0x3E,0xD6,0x99,
    0xD2,0xF4,0x7F,0x37,0x87,0x34,0x62,0x99,0x9F,0x7C,0x47,0x36,0x64,0xBE,0xB9,0x02,
    0x6C,0x10,0xD6,0xEA,0x92,0x36,0xCC,0xD6,0xE2,0x24,0xC7,0x04,0x6A,0xC5,0x59
};




-(NSString *) MAGIC_ENC:(NSString *)str
{
    //    *pPlainText1 = *(unsigned char *) [str cStringUsingEncoding:NSASCIIStringEncoding];
    
    char 			szPlainData1[] = "This is test1", szPlainData2[] = "This is test2";
    unsigned char	*pPlainText1 = 0x00, *pPlainText2 = 0x00;
    char			szVersion[12] = {0, }, *pszServerCert = 0x00, *pszSessionKey = 0x00, *pszEncSessionKey = 0x00,
    *pszEncData1 = 0x00, *pszEncData2 = 0x00;
    int				nRv = 0, nPlainTextLen1 = 0, nPlainTextLen2 = 0;
    
    // 서버로부터 서버 인증서를 수신한다.
    // recv : pszServerCert
    pszServerCert = (char*)"000001288ZEACAQADAAAAAQAAMDAwMDAwODcxMIIDYzCCAkugAwIBAgIBAjANBgkqhkiG9w0BAQsFADBdMQswCQYDVQQGEwJLUjEWMBQGA1UECgwNRHJlYW1TZWN1cml0eTESMBAGA1UECwwJTWFnaWNTRXYyMSIwIAYDVQQDDBlEcmVhbVNlY3VyaXR5IHJvb3RDQSAyMDQ4MB4XDTEyMDMyMDA3MTAyM1oXDTIyMDMyMDA3MTAyM1oweTELMAkGA1UEBhMCa3IxFjAUBgNVBAoMDWRyZWFtc2VjdXJpdHkxGzAZBgNVBAsMEm1vYmlsZV9tYWdpY3NldjIuMDE1MDMGA1UEAwws6rWQ6rO867aA66qo67CU7J287Jik7ZS87Iqk6riw67CY6rWs7LaVXzIwNDgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCyTsbYLTeLA/Gko6sTgxLjlfPr9YdeZTD5twNAqBQ40DVtsX1rG+uPHcILN9SmwM6dbLLvimeZvKTNH5z3SXOiFCM+bTm0WvaWpbaQozLPU4xlalhKisE61AL70AR5wtaZtVaBWj1s+/cYE0Z7LjSlhoBvkFowfov/BhhPJTEpc/qnRt2Wrb+4BrfDJayPRZQUJbJlUpPX3+ASHV7o0r3kfY9Dh2wPwyHP7x66EGWElt/sZdt38AGh1zh7bG9LG7ZmvIz9LDjhSoEtSFu9AncKwSRxNC+y9qal99ILcupUQW3KnS9CejI3B5TMzGtGON1L+O+v8+WefJV+l+ezApNhAgMBAAGjEjAQMA4GA1UdDwEB/wQEAwIFIDANBgkqhkiG9w0BAQsFAAOCAQEAvSsXwrJyZWwxBRXsZxGtTcG1xv2iwdmDQ0QHcSJEPNS2l/taykHEYkz7eyOeuT7YO4n/8Bovm11kUirSxS0PnTtU7KSTX7B9ik6of0BO8A0HiYWaUhLspnstp/qYTZ18NZ6lZFVzBs0s/lMLKZ+Nc6nEbjj+p/MMRmVXdt583/KiLjFspFX3M9W22vm7OaKXoRzjPXE7SHidR04fNo6wK9wwwcRZ4HALDCUZOSFBDsudvoDgDZOOFeO4XsP9WXIcArl2KBg8kFnbEIbHCkulKxL2ZMk1tJl3T9RiRZ+0e8qoasLostDrlG/s0ME+5gtcExfwafQgEqf7bYD5r9rwcAACAAAwMDAwMDAwNDABAAAAAAAAAAAAAAAAAAAAAAAAAPzfKXiFXFuO+teWsAEJ/rY+THfTgLdfOW0KgkiG2ood0XCadT4wTFk=";
    
    
    // 세션키를 만든다.
    nRv = MagicSE_HandShakeSessionKey( pszServerCert, &pszSessionKey, pRootCert, sizeof(pRootCert) );
    //printf( "MagicSE_HandShakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    nRv = MagicSE_GetEncSessionKey( pszSessionKey, &pszEncSessionKey );
    
    //printf( "MagicSE_GetEncSessionKey : %d, %s\n", nRv, pszEncSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
    //str = [NSString stringWithUTF8String: pszEncSessionKey];
    
    // 서버 인증서로 암호화된 세션키를 서버로 전송한다.
    // send : pszEncSessionKey
    
    
    // 세션키로 데이터를 암호화 한다.
//    nRv = MagicSE_MakeSessionKey( pszServerCert, &pszSessionKey );
//    printf( "MagicSE_MakeSessionKey : %d, %s\n", nRv, pszSessionKey );
//    if( nRv != MAGICSE_OK )	goto	Finally;
//    nRv = MagicSE_EncData( pszSessionKey, (unsigned char*)szPlainData1, strlen(szPlainData1), &pszEncData1 );
//    printf( "MagicSE_EncData1 : %d, %s\n", nRv, pszEncData1 );
//    if( nRv != MAGICSE_OK )	goto	Finally;
//    
//    
//    
//    // 세션키로 암호화된 데이터를 서버로 전송한다.
//    // send : pszEncData1
//    
//    // 서버로부터 암호화 데이터를 수신한다.
//    // recv : pszEncData1
//    
//    
//    // 세션키로 암호화 데이터를 복호화 한다.
//    nRv = MagicSE_DecData( pszSessionKey, pszEncData1, &pPlainText1, &nPlainTextLen1 );
//    printf( "MagicSE_DecData1 : %d, %s\n", nRv, (char*)pPlainText1 );
//    if( nRv != MAGICSE_OK )	goto	Finally;
//    
//    // 세션키로 데이터를 암호화 한다.
//    nRv = MagicSE_MakeSessionKey( pszServerCert, &pszSessionKey );
//    printf( "MagicSE_MakeSessionKey : %d, %s\n", nRv, pszSessionKey );
//    if( nRv != MAGICSE_OK )	goto	Finally;
//    nRv = MagicSE_EncData( pszSessionKey, (unsigned char*)szPlainData2, strlen(szPlainData2), &pszEncData2 );
//    printf( "MagicSE_EncData2 : %d, %s\n", nRv, pszEncData2 );
//    if( nRv != MAGICSE_OK )	goto	Finally;
//    
//    
//    // 세션키로 암호화된 데이터를 서버로 전송한다.
//    // send : pszEncData2
//    
//    // 서버로부터 암호화 데이터를 수신한다.
//    // recv : pszEncData2
//    
//    
//    // 세션키로 암호화 데이터를 복호화 한다.
//    nRv = MagicSE_DecData( pszSessionKey, pszEncData2, &pPlainText2, &nPlainTextLen2 );
//    printf( "MagicSE_DecData2 : %d, %s\n", nRv, (char*)pPlainText2 );
//    if( nRv != MAGICSE_OK )	goto	Finally;
    
Finally:
    MagicSE_FreeData( (void**)&pPlainText1 );
    MagicSE_FreeData( (void**)&pPlainText2 );
    MagicSE_FreeData( (void**)&pszSessionKey );
    MagicSE_FreeData( (void**)&pszEncSessionKey );
    MagicSE_FreeData( (void**)&pszEncData1 );
    MagicSE_FreeData( (void**)&pszEncData2 );

    return str;
}

-(NSString *) MAGIC_DEC:(NSString *)str
{
    //    *pPlainText1 = *(unsigned char *) [str cStringUsingEncoding:NSASCIIStringEncoding];
    
    char 			szPlainData1[] = "This is test1", szPlainData2[] = "This is test2";
    unsigned char	*pPlainText1 = 0x00, *pPlainText2 = 0x00;
    char			szVersion[12] = {0, }, *pszServerCert = 0x00, *pszSessionKey = 0x00, *pszEncSessionKey = 0x00,
    *pszEncData1 = 0x00, *pszEncData2 = 0x00;
    int				nRv = 0, nPlainTextLen1 = 0, nPlainTextLen2 = 0;
    
    // 서버로부터 서버 인증서를 수신한다.
    // recv : pszServerCert
    pszServerCert = (char*)"000001288ZEACAQADAAAAAQAAMDAwMDAwODcxMIIDYzCCAkugAwIBAgIBAjANBgkqhkiG9w0BAQsFADBdMQswCQYDVQQGEwJLUjEWMBQGA1UECgwNRHJlYW1TZWN1cml0eTESMBAGA1UECwwJTWFnaWNTRXYyMSIwIAYDVQQDDBlEcmVhbVNlY3VyaXR5IHJvb3RDQSAyMDQ4MB4XDTEyMDMyMDA3MTAyM1oXDTIyMDMyMDA3MTAyM1oweTELMAkGA1UEBhMCa3IxFjAUBgNVBAoMDWRyZWFtc2VjdXJpdHkxGzAZBgNVBAsMEm1vYmlsZV9tYWdpY3NldjIuMDE1MDMGA1UEAwws6rWQ6rO867aA66qo67CU7J287Jik7ZS87Iqk6riw67CY6rWs7LaVXzIwNDgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCyTsbYLTeLA/Gko6sTgxLjlfPr9YdeZTD5twNAqBQ40DVtsX1rG+uPHcILN9SmwM6dbLLvimeZvKTNH5z3SXOiFCM+bTm0WvaWpbaQozLPU4xlalhKisE61AL70AR5wtaZtVaBWj1s+/cYE0Z7LjSlhoBvkFowfov/BhhPJTEpc/qnRt2Wrb+4BrfDJayPRZQUJbJlUpPX3+ASHV7o0r3kfY9Dh2wPwyHP7x66EGWElt/sZdt38AGh1zh7bG9LG7ZmvIz9LDjhSoEtSFu9AncKwSRxNC+y9qal99ILcupUQW3KnS9CejI3B5TMzGtGON1L+O+v8+WefJV+l+ezApNhAgMBAAGjEjAQMA4GA1UdDwEB/wQEAwIFIDANBgkqhkiG9w0BAQsFAAOCAQEAvSsXwrJyZWwxBRXsZxGtTcG1xv2iwdmDQ0QHcSJEPNS2l/taykHEYkz7eyOeuT7YO4n/8Bovm11kUirSxS0PnTtU7KSTX7B9ik6of0BO8A0HiYWaUhLspnstp/qYTZ18NZ6lZFVzBs0s/lMLKZ+Nc6nEbjj+p/MMRmVXdt583/KiLjFspFX3M9W22vm7OaKXoRzjPXE7SHidR04fNo6wK9wwwcRZ4HALDCUZOSFBDsudvoDgDZOOFeO4XsP9WXIcArl2KBg8kFnbEIbHCkulKxL2ZMk1tJl3T9RiRZ+0e8qoasLostDrlG/s0ME+5gtcExfwafQgEqf7bYD5r9rwcAACAAAwMDAwMDAwNDABAAAAAAAAAAAAAAAAAAAAAAAAAPzfKXiFXFuO+teWsAEJ/rY+THfTgLdfOW0KgkiG2ood0XCadT4wTFk=";
    
    
    // 세션키를 만든다.
    nRv = MagicSE_HandShakeSessionKey( pszServerCert, &pszSessionKey, pRootCert, sizeof(pRootCert) );
    //printf( "MagicSE_HandShakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    nRv = MagicSE_GetEncSessionKey( pszSessionKey, &pszEncSessionKey );
    
    //printf( "MagicSE_GetEncSessionKey : %d, %s\n", nRv, pszEncSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
    str = [NSString stringWithUTF8String: pszEncSessionKey];
    
    // 서버 인증서로 암호화된 세션키를 서버로 전송한다.
    // send : pszEncSessionKey
    
    
    // 세션키로 데이터를 암호화 한다.
    //    nRv = MagicSE_MakeSessionKey( pszServerCert, &pszSessionKey );
    //    printf( "MagicSE_MakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    //    if( nRv != MAGICSE_OK )	goto	Finally;
    //    nRv = MagicSE_EncData( pszSessionKey, (unsigned char*)szPlainData1, strlen(szPlainData1), &pszEncData1 );
    //    printf( "MagicSE_EncData1 : %d, %s\n", nRv, pszEncData1 );
    //    if( nRv != MAGICSE_OK )	goto	Finally;
    //
    //
    //
    //    // 세션키로 암호화된 데이터를 서버로 전송한다.
    //    // send : pszEncData1
    //
    //    // 서버로부터 암호화 데이터를 수신한다.
    //    // recv : pszEncData1
    //
    //
    //    // 세션키로 암호화 데이터를 복호화 한다.
    //    nRv = MagicSE_DecData( pszSessionKey, pszEncData1, &pPlainText1, &nPlainTextLen1 );
    //    printf( "MagicSE_DecData1 : %d, %s\n", nRv, (char*)pPlainText1 );
    //    if( nRv != MAGICSE_OK )	goto	Finally;
    //
    //    // 세션키로 데이터를 암호화 한다.
    //    nRv = MagicSE_MakeSessionKey( pszServerCert, &pszSessionKey );
    //    printf( "MagicSE_MakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    //    if( nRv != MAGICSE_OK )	goto	Finally;
    //    nRv = MagicSE_EncData( pszSessionKey, (unsigned char*)szPlainData2, strlen(szPlainData2), &pszEncData2 );
    //    printf( "MagicSE_EncData2 : %d, %s\n", nRv, pszEncData2 );
    //    if( nRv != MAGICSE_OK )	goto	Finally;
    //
    //
    //    // 세션키로 암호화된 데이터를 서버로 전송한다.
    //    // send : pszEncData2
    //
    //    // 서버로부터 암호화 데이터를 수신한다.
    //    // recv : pszEncData2
    //
    //
    //    // 세션키로 암호화 데이터를 복호화 한다.
    //    nRv = MagicSE_DecData( pszSessionKey, pszEncData2, &pPlainText2, &nPlainTextLen2 );
    //    printf( "MagicSE_DecData2 : %d, %s\n", nRv, (char*)pPlainText2 );
    //    if( nRv != MAGICSE_OK )	goto	Finally;
    
Finally:
    MagicSE_FreeData( (void**)&pPlainText1 );
    MagicSE_FreeData( (void**)&pPlainText2 );
    MagicSE_FreeData( (void**)&pszSessionKey );
    MagicSE_FreeData( (void**)&pszEncSessionKey );
    MagicSE_FreeData( (void**)&pszEncData1 );
    MagicSE_FreeData( (void**)&pszEncData2 );
    
    return str;
}



void CASE_1( )
{
    char 			szPlainData1[] = "This is test1", szPlainData2[] = "This is test2";
    unsigned char	*pPlainText1 = 0x00, *pPlainText2 = 0x00;
    char			szVersion[12] = {0, }, *pszServerCert = 0x00, *pszSessionKey = 0x00, *pszEncSessionKey = 0x00,
    *pszEncData1 = 0x00, *pszEncData2 = 0x00;
    int				nRv = 0, nPlainTextLen1 = 0, nPlainTextLen2 = 0;

    
    // MagicSE 버전을 가져온다.
    MagicSE_GetVersion( szVersion );
    printf( "Version : %s\n", szVersion );
    
    
    // 서버로부터 서버 인증서를 수신한다.
    // recv : pszServerCert
    pszServerCert = (char*)"000001288ZEACAQADAAAAAQAAMDAwMDAwODcxMIIDYzCCAkugAwIBAgIBAjANBgkqhkiG9w0BAQsFADBdMQswCQYDVQQGEwJLUjEWMBQGA1UECgwNRHJlYW1TZWN1cml0eTESMBAGA1UECwwJTWFnaWNTRXYyMSIwIAYDVQQDDBlEcmVhbVNlY3VyaXR5IHJvb3RDQSAyMDQ4MB4XDTEyMDMyMDA3MTAyM1oXDTIyMDMyMDA3MTAyM1oweTELMAkGA1UEBhMCa3IxFjAUBgNVBAoMDWRyZWFtc2VjdXJpdHkxGzAZBgNVBAsMEm1vYmlsZV9tYWdpY3NldjIuMDE1MDMGA1UEAwws6rWQ6rO867aA66qo67CU7J287Jik7ZS87Iqk6riw67CY6rWs7LaVXzIwNDgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCyTsbYLTeLA/Gko6sTgxLjlfPr9YdeZTD5twNAqBQ40DVtsX1rG+uPHcILN9SmwM6dbLLvimeZvKTNH5z3SXOiFCM+bTm0WvaWpbaQozLPU4xlalhKisE61AL70AR5wtaZtVaBWj1s+/cYE0Z7LjSlhoBvkFowfov/BhhPJTEpc/qnRt2Wrb+4BrfDJayPRZQUJbJlUpPX3+ASHV7o0r3kfY9Dh2wPwyHP7x66EGWElt/sZdt38AGh1zh7bG9LG7ZmvIz9LDjhSoEtSFu9AncKwSRxNC+y9qal99ILcupUQW3KnS9CejI3B5TMzGtGON1L+O+v8+WefJV+l+ezApNhAgMBAAGjEjAQMA4GA1UdDwEB/wQEAwIFIDANBgkqhkiG9w0BAQsFAAOCAQEAvSsXwrJyZWwxBRXsZxGtTcG1xv2iwdmDQ0QHcSJEPNS2l/taykHEYkz7eyOeuT7YO4n/8Bovm11kUirSxS0PnTtU7KSTX7B9ik6of0BO8A0HiYWaUhLspnstp/qYTZ18NZ6lZFVzBs0s/lMLKZ+Nc6nEbjj+p/MMRmVXdt583/KiLjFspFX3M9W22vm7OaKXoRzjPXE7SHidR04fNo6wK9wwwcRZ4HALDCUZOSFBDsudvoDgDZOOFeO4XsP9WXIcArl2KBg8kFnbEIbHCkulKxL2ZMk1tJl3T9RiRZ+0e8qoasLostDrlG/s0ME+5gtcExfwafQgEqf7bYD5r9rwcAACAAAwMDAwMDAwNDABAAAAAAAAAAAAAAAAAAAAAAAAAPzfKXiFXFuO+teWsAEJ/rY+THfTgLdfOW0KgkiG2ood0XCadT4wTFk=";
    
    
    // 세션키를 만든다.
    nRv = MagicSE_HandShakeSessionKey( pszServerCert, &pszSessionKey, pRootCert, sizeof(pRootCert) );
    printf( "MagicSE_HandShakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    nRv = MagicSE_GetEncSessionKey( pszSessionKey, &pszEncSessionKey );
    printf( "MagicSE_GetEncSessionKey : %d, %s\n", nRv, pszEncSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
    
    // 서버 인증서로 암호화된 세션키를 서버로 전송한다.
    // send : pszEncSessionKey
    
    
    // 세션키로 데이터를 암호화 한다.
    nRv = MagicSE_MakeSessionKey( pszServerCert, &pszSessionKey );
    printf( "MagicSE_MakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    nRv = MagicSE_EncData( pszSessionKey, (unsigned char*)szPlainData1, strlen(szPlainData1), &pszEncData1 );
    printf( "MagicSE_EncData1 : %d, %s\n", nRv, pszEncData1 );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
    
    // 세션키로 암호화된 데이터를 서버로 전송한다.
    // send : pszEncData1
    
    // 서버로부터 암호화 데이터를 수신한다.
    // recv : pszEncData1
    
    
    // 세션키로 암호화 데이터를 복호화 한다.
    nRv = MagicSE_DecData( pszSessionKey, pszEncData1, &pPlainText1, &nPlainTextLen1 );
    printf( "MagicSE_DecData1 : %d, %s\n", nRv, (char*)pPlainText1 );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
    // 세션키로 데이터를 암호화 한다.
    nRv = MagicSE_MakeSessionKey( pszServerCert, &pszSessionKey );
    printf( "MagicSE_MakeSessionKey : %d, %s\n", nRv, pszSessionKey );
    if( nRv != MAGICSE_OK )	goto	Finally;
    nRv = MagicSE_EncData( pszSessionKey, (unsigned char*)szPlainData2, strlen(szPlainData2), &pszEncData2 );
    printf( "MagicSE_EncData2 : %d, %s\n", nRv, pszEncData2 );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
    
    // 세션키로 암호화된 데이터를 서버로 전송한다.
    // send : pszEncData2
    
    // 서버로부터 암호화 데이터를 수신한다.
    // recv : pszEncData2
    
    
    // 세션키로 암호화 데이터를 복호화 한다.
    nRv = MagicSE_DecData( pszSessionKey, pszEncData2, &pPlainText2, &nPlainTextLen2 );
    printf( "MagicSE_DecData2 : %d, %s\n", nRv, (char*)pPlainText2 );
    if( nRv != MAGICSE_OK )	goto	Finally;
    
Finally:
    MagicSE_FreeData( (void**)&pPlainText1 );
    MagicSE_FreeData( (void**)&pPlainText2 );
    MagicSE_FreeData( (void**)&pszSessionKey );
    MagicSE_FreeData( (void**)&pszEncSessionKey );
    MagicSE_FreeData( (void**)&pszEncData1 );
    MagicSE_FreeData( (void**)&pszEncData2 );
}




@end
