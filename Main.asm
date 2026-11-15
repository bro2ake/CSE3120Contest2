;Main.asm - Entry point, console setup, 3-stage outer game loop, victory/loss handling.
.386
.model flat, stdcall
option casemap:none

INCLUDE Irvine32.inc
INCLUDE Constants.inc
INCLUDE Structs.inc
INCLUDE GameData.inc

InitNewRun		PROTO		;Sets PlayerHP, copies StarterDeck into MasterDeck
InitStage		PROTO		;Loads enemies for currentStage, resets piles and shuffles
RunCombatStage	PROTO		;Runs turn loop; returns EAX = 1 for wins and EAX = 0 for losses
RunCardReward	PROTO		;Shows 3 random card rewards to pick from

RenderTitle		PROTO		;Draws titles screen
RenderVictory	PROTO		;Draws celebration screen
RenderGameOver	PROTO		;Draws defeat screen

.data
 consoleTitle	BYTE "Cache Interrupt: x86 Deckbuilder",0
 hStdOut		DWORD ?
 cursorInfo		CONSOLE_CURSOR_INFO <1,FALSE>; Size = 1, bVisibile = FALSE

 currentStage	DWORD 0
 totalStages	DWORD 3
.code
main PROC
 call Randomize			;seed Irvine32 RNG

 ;configure Win32 console
 INVOKE GetStdHandle, STD_OUTPUT_HANDLE
 mov hStdOut, eax

 INVOKE SetConsoleTitleA, ADDR consoleTitle
 INVOKE SetConsoleCursorInfo, hStdOut, ADDR cursorInfo

 GameRestart:
  ;Title Screen and Run Initialization
  ;call RenderTitle			- TO BE IMPLEMENTED
  ;call InitNewRun			- TO BE IMPLEMENTED
  mov currentStage,0

 StageLoop:		;Outer 3-Stage Progression loop for stages 1,2,3
  mov eax, currentStage
  cmp eax, totalStages
  jge AllStagesCleared		;completed all three stages, jump to victory screen.

  ;Load enemy stats, copy MasterDeck, shuffle
  ;INVOKE InitStage, currentStage		- TO BE IMPLEMENTED

  ;call RunCombatStage					- TO BE IMPLEMENTED
  cmp eax,0				;if eax is 0, the playerHP is 0
  je PlayerDefeated					

  ;Check if there is another stage before offering a reward.
  inc currentStage
  mov eax, currentStage
  cmp eax,totalStages
  jge AllStagesCleared

  ;Draft one new card into the MasterDeck
  ;call RunCardReward					- TO BE IMPLEMENTED
  jmp StageLoop

  AllStagesCleared:
   ;call RenderVictory					- TO BE IMPLEMENTED
   ;jmp PromptReplay					- TO BE IMPLEMENTED

  PlayerDefeated:
   ;call RenderGameOver					- TO BE IMPLEMENTED
   ;jmp PromptReplay
 INVOKE ExitProcess,0
main ENDP
END main
