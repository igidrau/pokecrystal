	const_def 2 ; object constants

Route2Top_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2Top_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 16, 27, ROUTE_2_GATE, 1
	warp_event 17, 27, ROUTE_2_GATE, 2
	warp_event 12,  7, DIGLETTS_CAVE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
