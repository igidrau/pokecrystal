	const_def 2 ; object constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3
	const OAKSLAB_RIVAL

OaksLab_MapScripts:
	db 5 ; scene scripts
	scene_script .OaksNotThere
	scene_script .EnterOaksLab
	scene_script .CantLeave
	scene_script .RivalFight
	scene_script .DummyScene

	db 0 ; callbacks

.OaksNotThere
	end

.EnterOaksLab:
	priorityjump .EnterOaksLabScript
	end

.CantLeave
.RivalFight
.DummyScene:
	end

.EnterOaksLabScript:
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	opentext

	setscene 3
	end

Oak:
	faceplayer
	opentext
.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

Rival:
	end

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OaksAssistant1Text:
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text " "
	done

_OaksLabGaryText1::
	text "<RIVAL>: Yo"
	line "<PLAYER>! Gramps"
	cont "isn't around!"

	para "I ran here 'cos"
	line "he said he had a"
	cont "#MON for me."
	done

_OaksLabGaryText3::
	text "<RIVAL>: Heh, my"
	line "#MON looks a"
	cont "lot stronger."
	done

_OaksLabBall::
	text "That's a #"
	line "BALL. There's a"
	cont "#MON inside!"
	done

_OaksLabPikachuText::
	text "OAK: Go ahead,"
	line "it's yours!"
	done

_OaksLabOakText2::
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"

	para "Afterward, go on"
	line "to the next town."
	done

_OaksLabOakText3::
	text "OAK: You should"
	line "talk to it and"
	cont "see how it feels."
	done

_OaksLabDeliverParcelText1::
	text "OAK: Oh, <PLAYER>!"

	para "How is my old"
	line "#MON?"

	para "Well, it seems to"
	line "like you a lot."

	para "You must be"
	line "talented as a"
	cont "#MON trainer!"

	para "What? You have"
	line "something for me?"

	para "<PLAYER> delivered"
	line "OAK's PARCEL.@@"

_OaksLabDeliverParcelText2::
	text ""
	para "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thanks, <PLAYER>!"

	para "By the way, I must"
	line "ask you to do"
	cont "something for me."
	done

_OaksLabAroundWorldText::
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAYER>!"
	done

_OaksLabGivePokeballsText1::
	text "OAK: You can't get"
	line "detailed data on"
	cont "#MON by just"
	cont "seeing them."

	para "You must catch"
	line "them! Use these"
	cont "to capture wild"
	cont "#MON."

	para "<PLAYER> got 5"
	line "# BALLs!@@"

_OaksLabGivePokeballsText2::
	text ""
	para "When a wild"
	line "#MON appears,"
	cont "it's fair game."

	para "Just like I showed"
	line "you, throw a #"
	cont "BALL at it and try"
	cont "to catch it!"

	para "This won't always"
	line "work, though."

	para "You'll have to aim"
	line "carefully."
	done

_OaksLabPleaseVisitText::
	text "OAK: Come see me"
	line "sometimes."

	para "I want to know how"
	line "your #DEX is"
	cont "coming along."
	done


_OaksLabPokedexText::
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

_OaksLabChooseMonText::
	para "Look, <PLAYER>! Do"
	line "you see that ball"
	cont "on the table?"

	para "It's called a #"
	line "BALL. It holds a"
	cont "#MON inside."

	para "You may have it!"
	line "Go on, take it!"
	done

_OaksLabOakGivesText::
	text "OAK: <PLAYER>, this"
	line "is the #MON I"
	cont "caught earlier."

	para "You can have it."
	line "I caught it in"
	cont "the wild and it's"
	cont "not tame yet."
	prompt

_OaksLabReceivedText::
	text "<PLAYER> received"
	line "a @"
;	TX_RAM wcd6d
	text "!@@"

_OaksLabLeavingText::
	text "OAK: Hey! Don't go"
	line "away yet!"
	done

_OaksLabRivalChallengeText::
	text "<RIVAL>: Wait"
	line "<PLAYER>!"
	cont "Let's check out"
	cont "our #MON!"

	para "Come on, I'll take"
	line "you on!"
	done

_OaksLabWonBattleText::
	text "WHAT?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"
	prompt

_OaksLabLostBattleText::
	text "<RIVAL>: Yeah! Am"
	line "I great or what?"
	prompt

_OaksLabRivalToughenUpText::
	text "<RIVAL>: Okay!"
	line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"
	done

_OaksLabPikachuDislikesPokeballsText1::
	text "OAK: What?"
	done

_OaksLabPikachuDislikesPokeballsText2::
	text "OAK: Would you"
	line "look at that!"

	para "It's odd, but it"
	line "appears that your"
	cont "PIKACHU dislikes"
	cont "# BALLs."

	para "You should just"
	line "keep it with you."

	para "That should make"
	line "it happy!"

	para "You can talk to it"
	line "and see how it"
	cont "feels about you."
	done

_OaksLabOakAsk::
	text "OAK: Ah, <RIVAL>,"
	line "good timing!"

	para "I needed to ask"
	line "both of you to do"
	cont "something for me."
	done

_OaksLabOakDeskText::
	text "On the desk there"
	line "is my invention,"
	cont "#DEX!"

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"

	para "It's a hi-tech"
	line "encyclopedia!"
	done

_OaksLabOakDexText1::
	text "OAK: <PLAYER> and"
	line "<RIVAL>! Take"
	cont "these with you!"

	para "<PLAYER> got"
	line "#DEX from OAK!@@"

_OaksLabOakDexText2::
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."

	para "That was my dream!"

	para "But, I'm too old!"
	line "I can't do it!"

	para "So, I want you two"
	line "to fulfill my"
	cont "dream for me!"

	para "Get moving, you"
	line "two!"

	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done

_OaksLabGaryMap::
	text "<RIVAL>: Alright"
	line "Gramps! Leave it"
	cont "all to me!"

	para "<PLAYER>, I hate to"
	line "say it, but I"
	cont "don't need you!"

	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"

	para "I'll tell her not"
	line "to lend you one,"
	cont "<PLAYER>! Hahaha!"
	done


OaksLab_WalkUpToOakMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 0 ; coord events

	db 16 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 4 ; object events
	object_event  4,  2, SPRITE_OAK,       SPRITEMOVEDATA_STANDING_DOWN,   0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN,    0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER,          1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
	object_event  5,  2, SPRITE_RIVAL,     SPRITEMOVEDATA_STANDING_DOWN,   0, 0,  1,  1, 0, OBJECTTYPE_SCRIPT, 0, Rival, -1
