.386
.model flat, stdcall
option casemap:none
; RenderScreen.asm - Win32 Console UI and Menu Rendering
INCLUDE Irvine32.inc
INCLUDE Constants.inc
INCLUDE Structs.inc
INCLUDE GameData.inc
INCLUDE Protos.inc

.data
;title line
;Add ASCII Art for the title of the game, and then some simple rules.
; CACHE
cache1 BYTE"  ____    _    ____ _   _ _____ ",0
cache2 BYTE" / ___|  / \  / ___| | | | ____|",0
cache3 BYTE"| |     / _ \| |   | |_| |  _|  ",0
cache4 BYTE"| |___ / ___ \ |___|  _  | |___ ",0
cache5 BYTE" \____/_/   \_\____|_| |_|_____|",0
END
