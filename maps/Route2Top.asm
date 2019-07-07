	const_def 2 ; object constants
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_POKE_BALL2

Route2Top_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2Carbos:
	itemball CARBOS

BugCatcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

BugCatcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

BugCatcherEdAfterBattleText:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

Route2DiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route2Top_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 15, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 16, 27, ROUTE_2_GATE, 1
	warp_event 17, 27, ROUTE_2_GATE, 2
	warp_event 12,  7, DIGLETTS_CAVE, 3
	warp_event 3, 9, VIRIDIAN_FOREST, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  9, BGEVENT_READ, Route2DiglettsCaveSign

	db 2 ; object events
	object_event  6,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event 19,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
