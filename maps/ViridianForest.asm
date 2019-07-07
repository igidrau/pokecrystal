	const_def 2 ; object constants

ViridianForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15, 47, ROUTE_2_BOTTOM, 2
	warp_event 1, 0, ROUTE_2_TOP, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
