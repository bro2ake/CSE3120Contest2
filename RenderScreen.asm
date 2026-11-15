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
; CACHE (30 chars wide -> center at dl = 25
cache1 BYTE"  ____    _    ____ _   _ _____ ",0
cache2 BYTE" / ___|  / \  / ___| | | | ____|",0
cache3 BYTE"| |     / _ \| |   | |_| |  _|  ",0
cache4 BYTE"| |___ / ___ \ |___|  _  | |___ ",0
cache5 BYTE" \____/_/   \_\____|_| |_|_____|",0

;INTERRUPT (51 chars wide -> center at dl = 14)
inter1 BYTE" ___ _   _ _____ _____ ____  ____  _   _ ____ _____ ",0
inter2 BYTE"|_ _| \ | |_   _| ____|  _ \|  _ \| | | |  _ \_   _|",0
inter3 BYTE" | ||  \| | | | |  _| | |_) | |_) | | | | |_) || |  ",0
inter4 BYTE" | || |\  | | | | |___|  _ <|  _< | |_| |  __/ | |  ",0
inter5 BYTE"|___|_| \_| |_| |_____|_| \_\_| \_\\___/|_|    |_|  ",0
END
