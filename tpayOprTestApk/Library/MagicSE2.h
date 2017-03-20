#ifndef _MAGICSE2_H
#define _MAGICSE2_H

#include "MagicSE2_Error.h"

#ifdef __cplusplus
extern "C" {
#endif

#if defined(WIN32) || defined(WINCE) || defined(SHP)
#	if defined(MAGICSE2_EXPORTS)
#		define MAGICSE2_API __declspec(dllexport)
#	elif defined(MAGICSE2_IMPORTS)
#		define MAGICSE2_API __declspec(dllimport)
#   else
#		define MAGICSE2_API
#	endif
#else
#	define MAGICSE2_API
#endif

#define IN
#define OUT
#define INOUT

MAGICSE2_API void MagicSE_GetVersion( char OUT pszVersion[12] );
MAGICSE2_API int MagicSE_GetErrMessage( char* OUT pszErrMessage, unsigned int IN uMessageLen );

MAGICSE2_API int MagicSE_HandShakeSessionKey( char* IN pszServerCert, char OUT **ppszSessionKey, unsigned char* IN pTrustCert = 0x00, unsigned int IN uTrustCertLen = 0 );
MAGICSE2_API int MagicSE_GetEncSessionKey( char* IN pszSessionKey, char** OUT ppszEncSessionKey, void* pAndroidEnv = 0x00, void* pAndroidObj = 0x00, void* pAndroidActivity = 0x00 );
MAGICSE2_API int MagicSE_MakeSessionKey( char* IN pszServerCert, char** INOUT pszSessionKey, unsigned char* IN pTrustCert = 0x00, unsigned int IN uTrustCertLen = 0 );

MAGICSE2_API int MagicSE_EncData( char* IN pszSessionKey, unsigned char* IN pPlainText, int IN nPlainTextLen, char** OUT ppszEncodedData, void* pAndroidEnv = 0x00, void* pAndroidObj = 0x00, void* pAndroidActivity = 0x00 );
MAGICSE2_API int MagicSE_DecData( char IN *pszSessionKey, char IN *pszEncodedText, unsigned char OUT **ppPlainText, int OUT *pnPlainTextLen );

MAGICSE2_API int MagicSE_File_EncData( char* IN pszSessionKey, char* IN pszInFile, char* OUT pszOutFile );

MAGICSE2_API void MagicSE_FreeData( void IN **ppData );

#ifdef __cplusplus
}
#endif


#endif // _MAGICSE2_H
