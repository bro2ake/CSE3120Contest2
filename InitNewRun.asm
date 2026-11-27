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

 AddDefends:

InitNewRun ENDP
END
