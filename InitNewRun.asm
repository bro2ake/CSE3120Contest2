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

; reseed catalog pool so repeated runs are clean.
 xor esi, esi
 ResetPool:
  cmp esi, CATALOG_SIZE
  jge PickFive
  mov eax, esi
  mov catalogPool[esi], al
  inc esi
  jmp ResetPool

 PickFive:
  xor esi, esi		; slot 0, 1, 2, 3, 4

 SampleLoop:
  cmp esi, DRAFT_POOL_SIZE
  jge DoneRoll

  mov eax, CATALOG_SIZE
  sub eax, esi
  call RandomRange
  add eax, esi

  mov bl, catalogPool[esi]
  mov dl, catalogPool[eax]
  mov catalogPool[esi],dl
  mov catalogPool[eax],bl

  ;convert catalong index
  add dl, 4
  mov draftChoices[esi],dl
  mov draftSelected[esi],0

  inc esi
  jmp SampleLoop

 DoneRoll:
  ret
RollDraftPool ENDP

DraftStartingCards PROC USES eax ebx ecx edx esi edi
 ;Renders the 5 rolled cards at Y = 5 through 9 and lets the player pick 2 via keys '1' through '5' or left clicking on a row.
 mov picksRemaining, DRAFT_PICKS_MAX

 ;draws the title for the card selections.
 RedrawDraft:
  call Clrscr
  mov dl, 4
  mov dh, 2
  call Gotoxy
  mov edx, OFFSET strDraftTitle
  call WriteString

  xor ebx, ebx	;for the row slots.
 DrawDraftRows:
  cmp ebx, DRAFT_POOL_SIZE
  jge DraftInputLoop

  mov dl, 6
  mov dh, bl
  add dh, 5		; for rows 5 through 9
  call Gotoxy

  cmp draftSelected[ebx],1
  je PickedRowColor
  mov eax, white + (black*16)
  jmp SetRowColor
 PickedRowColors:
  mov eax, lightGreen + (black * 16)
 SetRowColor:
  call SetTextColor
  ; Print "[1] " through "[5] " prefix 
  mov al, '['
  call WriteChar
  mov eax, ebx
  inc eax
  call WriteDec
  mov al, ']'
  call WriteChar
  mov al, ' '
  call WriteChar

 ; Look up description in catalogStrTable using (CardID - 4)
  movzx eax, draftChoices[ebx]
  sub eax, 4
  mov edx, catalogStrTable[eax * 4]
  call WriteString

  cmp draftSelected[ebx], 1
  jne NextDraftRow
  mov edx, OFFSET strPickedTag
  call WriteString
 NextDraftRow:
  
 DraftInputLoop:

END
