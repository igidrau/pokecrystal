DebugMenu:
	xor a
	ld [wDisableTextAcceleration], a
	call Function49ed0
	;ld b, SCGB_DIPLOMA
	;call GetSGBLayout
	;call SetPalettes
	ld hl, wGameTimerPause
	res GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	ld [wWhichIndexSet], a
	ld hl, .MenuHeader
	call LoadMenuHeader
	call DebugMenuJoypadLoop
	;call CloseWindow
	;ret c    ;jr c, .quit
	call ClearTileMap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr DebugMenu

;.quit
;	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 16, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw DebugMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "Color test@"
	db "Back@"

.Jumptable:
	dw DebugMenu_ColorTest
	dw DebugMenu_BackToMain

COLOR_TEST			EQU 0
BACK_TO_MAIN		EQU 1

DebugMenuItems:
	db 2
	db COLOR_TEST
	db BACK_TO_MAIN
	db -1


DebugMenuJoypadLoop:
	call SetUpMenu
.loop
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret


DebugMenu_ColorTest:
	farcall ColorTest
	ret

DebugMenu_BackToMain:
	farcall MainMenu
	ret