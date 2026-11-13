;Main.asm - Entry point, console setup, 3-stage outer game loop, victory/loss handling.
.386
.model flat, stdcall
option casemap:none

INCLUDE Irvine32.inc
INCLUDE Constants.inc
INCLUDE Structs.inc
INCLUDE GameData.inc

.data
 consoleTitle	BYTE "Cache Interrupt: x86 Deckbuilder",0
 hStdOut		DWORD ?
 cursorInfo		CONSOLE_CURSOR_INFO <1,FALSE>; Size = 1, bVisibile = FALSE

 currentStage	DWORD 0
 totalStages	DWORD 3
.code
main PROC

 INVOKE ExitProcess,0
main ENDP
END main
