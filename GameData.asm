.386
.model flat, stdcall
option casemap:none
INCLUDE Irvine32.inc
INCLUDE GameData.inc

.data
; Run and Stage Stats
 currentStage		DWORD	1
 gameOverFlag		BYTE	0
 stageClearedFlag	BYTE	0

; Player States
 playerMaxHP		DWORD	80
 playerHP			DWORD	80
 maxEnergy			DWORD	3
 playerEnergy		DWORD	3
 playerBlock		DWORD	0
 playerStrength		DWORD	0
; Enemy Stats

; Card Piles
END
