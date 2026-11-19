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

;INTERRUPT (52 chars wide -> center at dl = 32)
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
 mov dl,44
 call Gotoxy
 mov edx, OFFSET cache1
 call WriteString ;write cache1

 mov dh, 5
 mov dl,44
 call Gotoxy
 mov edx, OFFSET cache2
 call WriteString ;write cache2

 mov dh, 6
 mov dl,44
 call Gotoxy
 mov edx, OFFSET cache3
 call WriteString ;write cache3

 mov dh, 7
 mov dl,44
 call Gotoxy
 mov edx, OFFSET cache4
 call WriteString ;write cache4

 mov dh, 9
 mov dl,34
 call Gotoxy
 mov edx, OFFSET inter1
 call WriteString ;write inter1

 mov dh, 10
 mov dl,34
 call Gotoxy
 mov edx, OFFSET inter2
 call WriteString ;write inter2

 mov dh, 11
 mov dl,34
 call Gotoxy
 mov edx, OFFSET inter3
 call WriteString ;write inter3

 mov dh, 12
 mov dl,34
 call Gotoxy
 mov edx, OFFSET inter4
 call WriteString ;write inter4
 

 ret
 RenderTitle ENDP
END
