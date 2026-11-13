;Main.asm - Entry point, console setup, 3-stage outer game loop, victory/loss handling.
.386
.model flat, stdcall
option casemap:none

INCLUDE Irvine32.inc
INCLUDE Constants.inc
INCLUDE Structs.inc
INCLUDE GameData.inc

.data

.code
main PROC

 INVOKE ExitProcess,0
 main ENDP
 END main
