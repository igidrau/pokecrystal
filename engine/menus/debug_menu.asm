DebugMenu:
	xor a
	ld [wd002], a
	ld [hMapAnims], a
	ld [wWhichIndexSet], a
	call ClearBGPalettes
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData

	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	;ld hl, wGameTimerPause
	;res GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]

.loop
	ld hl, .MenuHeader
	call LoadMenuHeader
	call DebugMenuJoypadLoop
	;call CloseWindow
	ret c    ;jr c, .quit
	call ClearTileMap
	ld a, [wMenuSelection]
	ld hl, DebugItemBackToMain
	cp [hl]
	ret z
	;ld a, [wMenuSelection]
	;ret z
	ld hl, .Jumptable
	rst JumpTable
	ld a, [wd002]
	rl a
	jr c, DebugMenu
	jr .loop

;.quit
;	ret

.MenuHeader:
	db MENU_BACKUP_TILES; flags
	menu_coords 0, 0, 16, 10
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw DebugMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "Color pokemons@"
	db "Color trainers@"
	db "Back@"

.Jumptable:
	dw DebugMenu_ColorTest
	dw DebugMenu_ColorTestTrainers
	dw DebugMenu_BackToMain

COLOR_TEST			EQU 0
COLOR_TEST_TRAINERS	EQU 1
BACK_TO_MAIN		EQU 2

DebugMenuItems:
	db 3
	db COLOR_TEST
	db COLOR_TEST_TRAINERS
DebugItemBackToMain:
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

Function49ed0bis:
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	ret

DebugMenu_ColorTestTrainers
	ld a, $1
	ld [wd002], a

DebugMenu_ColorTest:
	call ColorTest
	ret

DebugMenu_BackToMain:
;	farcall MainMenu
	ret