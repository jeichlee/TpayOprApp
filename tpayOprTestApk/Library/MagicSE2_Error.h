#ifndef _MAGICSE_ERROR_H
#define _MAGICSE_ERROR_H

#define MAGICSE_OK								0

#define MAGICSE_INVALID_INPUT_NULL				-201	// �Է� ���� NULL
#define MAGICSE_INVALID_INPUT_LEN				-202	// �Է� ���� ���̰� �ǹٸ��� ����
#define MAGICSE_INVALID_INPUT_HASH				-203	// ���� �ؽ����� �ٸ�(�Է� ���� ���� �Ǿ���)
#define MAGICSE_INVALID_INPUT_MUST_NULL			-205	// �Է°��� �ݵ�� NULL �̾�� ��
#define MAGICSE_INVALID_INPUT_OVER_SIZE			-207	// ��ȣȭ �� �Է� ���� �������� �ʰ�
#define MAGICSE_INVALID_ENCRYPTDATA_OVER_SIZE	-208	// ��ȣȭ�� ����Ÿ ���� �������� �ʰ�
#define MAGICSE_INVALID_HEADER_SIZE				-209	// ��� ����� ��������
#define MAGICSE_INVALID_INPUT_FILE_SIZE			-210	// �Է� ���� ����� 0
#define MAGICSE_INVALID_INPUT_FILE_OPEN			-211	// ���� open ����

#define MAGICSE_TYPE_NOT_EXIST					-301	// �������� ���� Ÿ��
#define MAGICSE_TYPE_WRONG_CASE					-302	// ��Ȳ�� ���� ���� Ÿ��
#define MAGICSE_TYPE_NOT_SUPPORT				-303	// ��뷮 �Ϻ�ȣȭ������ �������� ����
#define MAGICSE_TYPE_VERSION					-304	// ������ ������ Ŭ���ƾ�Ʈ ���� ���� ����
#define MAGICSE_TYPE_INVALID_TAG				-305	// Tag���� �ǹٸ��� ����

#define MAGICSE_ALG_NOT_EXIST					-401	// ���� ���� �ʴ� �˰���
	
#define MAGICSE_XSIGN_SESSIONKEY				-501	// ����Ű ���� ����

#define MAGICSE_SYSTEM_ALLOC_MEMORY				-601	// �޸� �Ҵ� ����

#define MAGICSE_APPLICATION_INFO				-701	// ���ø����̼� ���� �������� ����


#endif // _MAGICSE_ERROR_H
