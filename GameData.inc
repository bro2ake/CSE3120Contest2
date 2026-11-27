; Card ID Constants 
CARD_STRIKE       EQU 1
CARD_DEFEND       EQU 2
CARD_BASH         EQU 3

; Intent Constants 
INTENT_ATTACK     EQU 1
INTENT_DEFEND     EQU 2

; Procedure Prototypes
InitNewRun        PROTO
InitStage         PROTO
StartTurn         PROTO
PlayCard          PROTO
EndTurn           PROTO
RenderScreen      PROTO

; --- Shared Global Variables (defined in gamedata.asm) ---

EXTERNDEF currentStage:DWORD
EXTERNDEF gameOverFlag:BYTE
EXTERNDEF stageClearedFlag:BYTE

EXTERNDEF playerMaxHP:DWORD
EXTERNDEF playerHP:DWORD
EXTERNDEF maxEnergy:DWORD
EXTERNDEF playerEnergy:DWORD
EXTERNDEF playerBlock:DWORD
EXTERNDEF playerStrength:DWORD

EXTERNDEF enemyMaxHP:DWORD
EXTERNDEF enemyHP:DWORD
EXTERNDEF enemyBlock:DWORD
EXTERNDEF enemyIntentType:DWORD
EXTERNDEF enemyIntentVal:DWORD
