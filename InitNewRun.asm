.386
.model flat, stdcall
option casemap:none
INCLUDE Irvine32.inc
INCLUDE GameData.inc

.code
InitNewRun PROC USES eax ecx esi
 call Randomize ;seed RNG

 ; reset all run stats incase of replay
 mov currentStage, 1
 mov playerMaxHP, 80
 mov playerHP, 80
 mov maxEnergy, 3
 mov playerEnergy, 3
 mov playerBlock, 0
 mov playerStrength, 0
 mov gameOverFlag, 0
 mov stageClearedFlag, 0

 ; Build 10-card starter deck (5 strikes, 4 defends, 1 bash)
 xor esi, esi
 mov ecx,5
 AddStrikes:
  mov masterDeck[esi], CARD_STRIKE
  inc esi
  loop AddStrikes

  moc ecx,4
 AddDefends:
  mov masterDeck[esi], CARD_DEFEND
  inc esi
  mov masterDeckCount, esi

  call RollDraftPool		;choose 5 unique cards for picking
  call DraftStartingCards	;select 2 of the cards and add them to player hand.

InitNewRun ENDP
; shuffle catalog pool to pick 5 distinct cards.
RollDraftPool PROC USES eax, ebx, ecx, edx, esi
 xor esi, esi
 ResetPool:
  
 PickFive:

 SampleLoop:

 DoneRoll:
 
END
