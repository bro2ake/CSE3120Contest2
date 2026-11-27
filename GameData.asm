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

 ;20 descriptions of the cards defined in GameData.inc
 strCat04        BYTE "OVERCLOCK      (1E) - Draw 2 cards", 0
 strCat05        BYTE "FIREWALL       (2E) - Gain 12 Block, Draw 1", 0
 strCat06        BYTE "ZERO-DAY       (1E) - Deal 10 DMG + 2 Vulnerable", 0
 strCat07        BYTE "CACHE HIT      (0E) - Deal 4 DMG, Draw 1", 0
 strCat08        BYTE "CORE DUMP      (2E) - Deal 18 DMG", 0
 strCat09        BYTE "MEMORY LEAK    (1E) - Enemy loses 2 Strength", 0
 strCat10        BYTE "THREAD POOL    (1E) - Deal 5 DMG twice", 0
 strCat11        BYTE "DEADLOCK       (2E) - Gain 10 Block + 2 Weak", 0
 strCat12        BYTE "STACK SMASH    (1E) - Deal 6 DMG + 6 Block", 0
 strCat13        BYTE "BIT SHIFT      (0E) - Gain 4 Block, Draw 1", 0


END
