LoadBattleMenu:
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

SafariBattleMenu:
; untranslated
	ld hl, SafariMenuHeader
	call LoadMenuHeader
	jr Function24f19

ContestBattleMenu:
	ld hl, ContestMenuHeader
	call LoadMenuHeader

Function24f19:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw BattleMenuData
	db 1 ; default option

BattleMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba BattleMenuStrings
	dbw BANK(BattleMenuData), 0

BattleMenuStrings:
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"

SafariMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw SafariMenuData
	db 1 ; default option

SafariMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba SafariMenuStrings
	dba SafariMenuRemainingBalls

SafariMenuStrings:
	db "サファりボール×　　@" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"

SafariMenuRemainingBalls:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

ContestMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw ContestMenuData
	db 1 ; default option

ContestMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba ContestMenuStrings
	dba ContestMenuRemainingBalls

ContestMenuStrings:
	db "FIGHT@"
	db "<PKMN>", "@"
	db "PARKBALL×  @"
	db "RUN@"

ContestMenuRemainingBalls:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
