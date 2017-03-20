#ifndef _MAGICSE_ERROR_H
#define _MAGICSE_ERROR_H

#define MAGICSE_OK								0

#define MAGICSE_INVALID_INPUT_NULL				-201	// 입력 값이 NULL
#define MAGICSE_INVALID_INPUT_LEN				-202	// 입력 값의 길이가 옳바르지 않음
#define MAGICSE_INVALID_INPUT_HASH				-203	// 서버 해쉬값이 다름(입력 값이 변조 되었음)
#define MAGICSE_INVALID_INPUT_MUST_NULL			-205	// 입력값은 반드시 NULL 이어야 함
#define MAGICSE_INVALID_INPUT_OVER_SIZE			-207	// 암호화 할 입력 값이 허용범위를 초과
#define MAGICSE_INVALID_ENCRYPTDATA_OVER_SIZE	-208	// 암호화된 데이타 값이 허용범위를 초과
#define MAGICSE_INVALID_HEADER_SIZE				-209	// 헤더 사이즈가 비정상적
#define MAGICSE_INVALID_INPUT_FILE_SIZE			-210	// 입력 파일 사이즈가 0
#define MAGICSE_INVALID_INPUT_FILE_OPEN			-211	// 파일 open 실패

#define MAGICSE_TYPE_NOT_EXIST					-301	// 존재하지 않은 타입
#define MAGICSE_TYPE_WRONG_CASE					-302	// 상황에 맞지 않은 타입
#define MAGICSE_TYPE_NOT_SUPPORT				-303	// 대용량 암복호화에서는 지원하지 않음
#define MAGICSE_TYPE_VERSION					-304	// 서버의 버전이 클리아언트 버전 보다 낮음
#define MAGICSE_TYPE_INVALID_TAG				-305	// Tag값이 옳바르지 않음

#define MAGICSE_ALG_NOT_EXIST					-401	// 존재 하지 않는 알고리즘
	
#define MAGICSE_XSIGN_SESSIONKEY				-501	// 세션키 생성 실패

#define MAGICSE_SYSTEM_ALLOC_MEMORY				-601	// 메모리 할당 실패

#define MAGICSE_APPLICATION_INFO				-701	// 어플리케이션 정보 가져오기 실패


#endif // _MAGICSE_ERROR_H
