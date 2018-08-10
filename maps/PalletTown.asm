	const_def 2 ; object constants
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER
	const PALLETTOWN_OAK

PalletTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	return

PalletTown_End:
	end

PalletTown_OakStopsYou1:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue PalletTown_End
	setevent EVENT_PIKACHU_CAPTURE
	opentext
	writetext Text_WaitPlayer
	moveobject PALLETTOWN_OAK, 8, 4
	waitbutton
	closetext
	appear PALLETTOWN_OAK
	turnobject PLAYER, DOWN
	applymovement PALLETTOWN_OAK, Movement_OakRunsToYou
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PALLETTOWN_OAK, 15
	turnobject PALLETTOWN_OAK, RIGHT
	loadwildmon PIKACHU, 5
	catchtutorial BATTLETYPE_TUTORIAL
	follow PALLETTOWN_OAK, PLAYER
	applymovement PALLETTOWN_OAK, Movement_ToTheLab1
	stopfollow
	disappear PALLETTOWN_OAK
	applymovement PLAYER, Movement_Up
	warpfacing UP, OAKS_LAB, 5, 11
	end

PalletTown_OakStopsYou2:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue PalletTown_End
	setevent EVENT_PIKACHU_CAPTURE
	opentext
	writetext Text_WaitPlayer
	moveobject PALLETTOWN_OAK, 9, 4
	waitbutton
	closetext
	appear PALLETTOWN_OAK
	turnobject PLAYER, DOWN
	applymovement PALLETTOWN_OAK, Movement_OakRunsToYou
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PALLETTOWN_OAK, 15
	turnobject PALLETTOWN_OAK, LEFT
	loadwildmon PIKACHU, 5
	catchtutorial BATTLETYPE_TUTORIAL
	follow PALLETTOWN_OAK, PLAYER
	applymovement PALLETTOWN_OAK, Movement_ToTheLab2
	stopfollow
	disappear PALLETTOWN_OAK
	applymovement PLAYER, Movement_Up
	warpfacing UP, OAKS_LAB, 5, 11
	end

Movement_OakRunsToYou:
	step UP
	step UP
	step UP
	step_end


Movement_ToTheLab1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

Movement_ToTheLab2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

Movement_Up:
	step UP
	step_end

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

Text_WaitPlayer:
	text "Wait, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"

	para "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"
	cont "grass on the way"
	cont "to the next town."
	done

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "<PLAY_G>'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "TRACE'S HOUSE"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  5, PLAYERS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	db 0 ; coord events
	;coord_event 8, 0, SCENE_PALLETTOWN_OAK_STOP, PalletTown_OakStopsYou1
	;coord_event 9, 0, SCENE_PALLETTOWN_OAK_STOP, PalletTown_OakStopsYou2


	db 4 ; bg events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	db 3 ; object events
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
