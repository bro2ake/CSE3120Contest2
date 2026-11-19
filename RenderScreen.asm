.386
.model flat, stdcall
option casemap:none
; RenderScreen.asm - Win32 Console UI and Menu Rendering
INCLUDE Irvine32.inc
INCLUDE Constants.inc
INCLUDE Structs.inc
INCLUDE GameData.inc

.data
;title line
;Add ASCII Art for the title of the game, and then some simple rules.
; CACHE (32 chars wide -> center at dl = 44)
cache1 BYTE"  ____    _    ____ _   _ _____ ",0
cache2 BYTE" / ___|  / \  / ___| | | | ____|",0
cache3 BYTE"| |     / _ \| |   | |_| |  _|  ",0
cache4 BYTE"| |___ / ___ \ |___|  _  | |___ ",0
cache5 BYTE" \____/_/   \_\____|_| |_|_____|",0

;INTERRUPT (52 chars wide -> center at dl = 30)
inter1 BYTE" ___ _   _ _____ _____ ____  ____  _   _ ____ _____ ",0
inter2 BYTE"|_ _| \ | |_   _| ____|  _ \|  _ \| | | |  _ \_   _|",0
inter3 BYTE" | ||  \| | | | |  _| | |_) | |_) | | | | |_) || |  ",0
inter4 BYTE" | || |\  | | | | |___|  _ <|  _< | |_| |  __/ | |  ",0
inter5 BYTE"|___|_| \_| |_| |_____|_| \_\_| \_\\___/|_|    |_|  ",0
; Divider line ( 56 chars wide -> center at dl = 32)
divider BYTE"-======================================================-",0

.code
RenderTitle PROC USES edx
 mov eax, lightGray + (black * 16) ;set background black with light gray text
 call SetTextColor
 call Clrscr

 mov eax, lightCyan + (black*16)
 call SetTextColor

 mov dh, 2 
 mov dl, 32
 call Gotoxy
 mov edx, OFFSET divider
 call WriteString ;write divider

 mov dh, 4
 mov dh, 4
 mov dl,44
 call Gotoxy
 mov edx, OFFSET cache1
 call WriteString ;write cache1

 ret
 RenderTitle ENDP
END
