ChrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MaleNames
	db 1 ; ????
	db 0 ; default option

.MaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "New name@"
MalePlayerNameArray:
	db "Chase@"
	db "Red@"
	db "Blue@"
	db "Ash@"
	db 2 ; displacement
	db " Name @" ; title

KrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .FemaleNames
	db 1 ; ????
	db 0 ; default option

.FemaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "New name@"
FemalePlayerNameArray:
	db "KRIS@"
	db "Yellow@"
	db "Green@"
	db "Selena@"
	db 2 ; displacement
	db " Name @" ; title
