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
 enemyMaxHP			DWORD	45
 enemyHP			DWORD	45
 enemyBlock			DWORD	0
 enemyIntentType	DWORD	0
 enemyIntentVal		DWORD	0

; Card Piles
 masterDeck			BYTE	40 DUP(0)
 masterDeckCount	DWORD	0
 drawPile			BYTE	40 DUP(0)
 handPile			BYTE	5 DUP(0)
 handCount			DWORD	0
 discardPile		BYTE	40 DUP(0)
 discardCount		DWORD   0
END
