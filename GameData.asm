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

 ; Pool holding cards 0-19 for initial and post-stage card rewards.
 catalogPool		BYTE 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
 draftChoices		BYTE DRAFT_POOL_SIZE DUP(0)	; holds 5 randomly chosen card IDs offered for the run.
 draftSelected		BYTE DRAFT_POOL_SIZE DUP(0)
 picksRemaining		DWORD DRAFT_PICKS_MAX

 strDraftTitle		BYTE "=== PRE-RUN DRAFT: SELECT 2 OF THE 5 RANDOM SYSTEM MODULES ===",0
 strPickedTag		BYTE "  [ADDED]",0


END
