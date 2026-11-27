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
END
