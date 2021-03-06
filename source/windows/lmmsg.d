/***********************************************************************\
*                                lmmsg.d                                *
*                                                                       *
*                       Windows API header module                       *
*                                                                       *
*                 Translated from MinGW Windows headers                 *
*                                                                       *
*                       Placed into public domain                       *
\***********************************************************************/
module windows.lmmsg;
pragma(lib, "netapi32");

private import windows.lmcons, windows.windef, windows.w32api;

static assert (_WIN32_WINNT >= 0x501,
	"windows.lmmsg is available only if version WindowsXP, Windows2003 "
	"or WindowsVista is set");

const MSGNAME_NOT_FORWARDED  = 0;
const MSGNAME_FORWARDED_TO   = 4;
const MSGNAME_FORWARDED_FROM = 16;

struct MSG_INFO_0 {
	LPWSTR msgi0_name;
}
alias MSG_INFO_0* PMSG_INFO_0, LPMSG_INFO_0;

struct MSG_INFO_1 {
	LPWSTR msgi1_name;
	DWORD msgi1_forward_flag;
	LPWSTR msgi1_forward;
}
alias MSG_INFO_1* PMSG_INFO_1, LPMSG_INFO_1;

extern (Windows) {
	NET_API_STATUS NetMessageBufferSend(LPCWSTR, LPCWSTR, LPCWSTR, PBYTE,
	  DWORD);
	NET_API_STATUS NetMessageNameAdd(LPCWSTR, LPCWSTR);
	NET_API_STATUS NetMessageNameDel(LPCWSTR, LPCWSTR);
	NET_API_STATUS NetMessageNameEnum(LPCWSTR, DWORD, PBYTE*, DWORD, PDWORD,
	  PDWORD, PDWORD);
	NET_API_STATUS NetMessageNameGetInfo(LPCWSTR, LPCWSTR, DWORD, PBYTE*);
}
