// ДАНДО И ЕГО ВЕЩИ

/obj/item/clothing/under/dando_official
	name = "white shirt"
	desc = "Simple white shirt with the cross."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Dando_under"
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 20, BLACK_DAMAGE = 20, PALE_DAMAGE = 20)
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD

/obj/item/clothing/suit/armor/ego_gear/city/dando_official
	name = "Sotto Capo cloak"
	desc = "Thumb official uniform."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Dando_cloak"
	flags_inv = null
	armor = list(RED_DAMAGE = 80, WHITE_DAMAGE = 100, BLACK_DAMAGE = 20, PALE_DAMAGE = 100)
	attribute_requirements = list()

/obj/item/ego_weapon/city/thumbcane/dando
	force = 80
	attribute_requirements = list()

/datum/job/dando
	title = "Dando Martinez"
	faction = "Thumb"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/dando

	job_attribute_limit = 100

	display_order = 1.6
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "THUMB"

	roundstart_attributes = list(
								STRENGTH_STAT = 30,
								WILLPOWER_STAT = 200,
								OBSERVATION_STAT = 200,
								REFLEXES_STAT = 30,
								LUCK_STAT = 0,
								PRECISION_STAT = 200,
								INTELLECT_STAT = 200
								)

/datum/job/dando/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/dando
	name = "Dando Martinez"
	jobtype = /datum/job/dando

	uniform = /obj/item/clothing/under/dando_official
	suit = /obj/item/clothing/suit/armor/ego_gear/city/dando_official
	back = null
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	mask = null
	neck = null
	ears = null
	glasses = /obj/item/clothing/glasses/orange
	id = null

	l_pocket = null
	r_pocket = null

	suit_store = null

	r_hand = /obj/item/ego_weapon/city/thumbcane/dando
	l_hand = null

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

// ШИМУРА И ЕЁ ДЕВЧАЧЬИ ТРЯПОЧКИ

/obj/item/clothing/under/shimura
	name = "black bodysuit"
	desc = "Very tight and agile black bodysuit."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Shimura_under"
	armor = list(RED_DAMAGE = 50, WHITE_DAMAGE = 30, BLACK_DAMAGE = 50, PALE_DAMAGE = 30)
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.

	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD

/obj/item/clothing/glasses/shimura
	name = "circle glasses"
	desc = "Stylish, big, circle glasses."
	icon = 'fd/icons/prism/inventory_states.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Shimura_glasses"
	inhand_icon_state = "glasses"

/obj/item/gun/ego_gun/city/shimura_rev
	name = "high-caliber magnum"
	desc = "An very expensive pistol, which is obviously need alot of strength to actually handle it."
	icon = 'fd/icons/rev10.dmi'
	icon_state = "rev10"
	inhand_icon_state = "fullstopdeagle"
	weapon_weight = WEAPON_LIGHT
	slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/caseless/fullstop
	fire_sound = 'sound/weapons/gun/rifle/shot_alt.ogg'
	projectile_damage_multiplier = 5
	shotsleft = 6
	reloadtime = 2 SECONDS
	attribute_requirements = list()
	fire_delay = 12

/datum/job/shimura
	title = "Katsu Shimura"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/shimura

	job_attribute_limit = 100

	display_order = 1.7
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "KATSU"

	roundstart_attributes = list(
								STRENGTH_STAT = 20,
								WILLPOWER_STAT = 100,
								OBSERVATION_STAT = 100,
								REFLEXES_STAT = 80,
								LUCK_STAT = 20,
								PRECISION_STAT = 80,
								INTELLECT_STAT = 150
								)

/datum/job/shimura/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/shimura
	name = "Katsu Shimura"
	jobtype = /datum/job/shimura

	uniform = /obj/item/clothing/under/shimura
	suit = null
	back = null
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = null
	mask = null
	neck = /obj/item/clothing/neck/stripedbluescarf
	ears = null
	glasses = /obj/item/clothing/glasses/shimura
	id = null

	l_pocket = /obj/item/gun/ego_gun/city/shimura_rev
	r_pocket = /obj/item/gun/ego_gun/city/shimura_rev

	suit_store = null

	r_hand = null
	l_hand = null

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//BOSS CLOTHING

/obj/item/clothing/under/prism_boss_first
	name = "black suit"
	desc = "Very cool looking business suit."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Boss_under"
	armor = list(RED_DAMAGE = 10, WHITE_DAMAGE = 10, BLACK_DAMAGE = 10, PALE_DAMAGE = 10)
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.

	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD

/mob/living/carbon/human
	var/should_regenerate = FALSE

/mob/living/carbon/human/Life()
	if(should_regenerate)
		should_regenerate = FALSE
		start_regeneration()
		addtimer(CALLBACK(src, PROC_REF(reset_regen)), 1 SECONDS)
	..()

/mob/living/carbon/human/proc/reset_regen()
	should_regenerate = TRUE

/mob/living/carbon/human/proc/give_powers()
	should_regenerate = TRUE
	maxSanity = 200
	sanityhealth = 200
	add_movespeed_modifier(/datum/movespeed_modifier/dstout)
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob, remove_movespeed_modifier), /datum/movespeed_modifier/dstout/doubled), 1 HOURS, TIMER_UNIQUE | TIMER_OVERRIDE)
	death_threshold -= 500
	hardcrit_threshold -= 500
	crit_threshold -= 500

/mob/living/carbon/human/proc/start_regeneration()
	adjustBruteLoss(-30)
	adjustFireLoss(-30)
	adjustOxyLoss(-30)
	adjustToxLoss(-30)

/obj/item/clothing/suit/armor/ego_gear/city/prism_boss_first
	name = "'Black Rose' equipment"
	desc = "'Black Rose' Syndicate suit and mask."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Boss_suit"
	flags_inv = HIDEEARS|HIDEHAIR
	armor = list(RED_DAMAGE = 40, WHITE_DAMAGE = 80, BLACK_DAMAGE = 40, PALE_DAMAGE = 50)
	attribute_requirements = list()
	var/state = 1

	hat = /obj/item/clothing/head/ego_hat/prism_boss_first

/obj/item/clothing/head/ego_hat/prism_boss_first
	name = "'Black Rose' equipment"
	desc = "'Black Rose' Syndicate suit and mask."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Boss_suit"
	perma = TRUE
	var/state = 1

/obj/item/clothing/head/ego_hat/prism_boss_first/AltClick(mob/living/carbon/human/user)
	if(state == 1)
		state = 2
		icon_state = "Boss_suit_alt"
		worn_icon_state = "Boss_suit_alt"
		user.visible_message("<span class='warning'>[user] одним мощным ударом втыкает себе в шею какой-то шприц!</span>")
		update_icon()
		user.update_icon()
		return
	if(state == 2)
		state = 1
		icon_state = "Boss_suit"
		worn_icon_state = "Boss_suit"
		update_icon()
		user.update_icon()
		return

/obj/item/clothing/suit/armor/ego_gear/city/prism_boss_first/AltClick(mob/living/carbon/human/user)
	if(state == 1)
		state = 2
		user.give_powers()
		icon_state = "Boss_suit_alt"
		worn_icon_state = "Boss_suit_alt"
		update_icon()
		user.update_icon()
		return
	if(state == 2)
		state = 1
		icon_state = "Boss_suit"
		worn_icon_state = "Boss_suit"
		update_icon()
		user.update_icon()
		return

//О'Браян

/obj/item/clothing/suit/armor/ego_gear/city/obrian
	name = "laboratory suit"
	desc = "Tight blue membrane."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Obrian_suit"
	flags_inv = null
	armor = list(RED_DAMAGE = 10, WHITE_DAMAGE = 10, BLACK_DAMAGE = 10, PALE_DAMAGE = 10)
	attribute_requirements = list()

/datum/job/obrian
	title = "OBrian"
	faction = "roses"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/obrian

	job_attribute_limit = 100

	display_order = 1.6
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "DCORP"

	roundstart_attributes = list(
								STRENGTH_STAT = 20,
								WILLPOWER_STAT = 20,
								OBSERVATION_STAT = 60,
								REFLEXES_STAT = 20,
								LUCK_STAT = 0,
								PRECISION_STAT = 90,
								INTELLECT_STAT = 90
								)

/datum/job/obrian/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/obrian
	name = "OBrian"
	jobtype = /datum/job/obrian

	uniform = /obj/item/clothing/under/suit/black
	suit = /obj/item/clothing/suit/armor/ego_gear/city/obrian
	back = null
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = null
	mask = null
	neck = null
	ears = null
	glasses = null
	id = null

	l_pocket = null
	r_pocket = null

	suit_store = null

	r_hand = null
	l_hand = null

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

// Экипировка Офиса Призмы

/datum/outfit/job/albert_combatready
	name = "Albert Krat (Combat)"
	jobtype = /datum/job/albert

	uniform = /obj/item/clothing/under/prism_office/albert
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/albert
	glasses = /obj/item/clothing/glasses/monocle
	head = null
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list(/obj/item/ego_weapon/city/dieci_key = 1, /obj/item/knowledge/report = 2, /obj/item/knowledge/cooking_book = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

/datum/outfit/job/aurum_combatready
	name = "Aurum OLith (Combat)"
	jobtype = /datum/job/aurum

	uniform = /obj/item/clothing/under/prism_office/aurum
	ears = /obj/item/clothing/ears/ear_ring
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/armor/ego_gear/city/prism_cloak
	glasses = null
	head = null
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list()

	back = /obj/item/ego_weapon/city/zweihander/aurum

	backpack = null
	satchel = null
	duffelbag = null

/datum/outfit/job/aurum_combatready/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]/skirt"
		if(!text2path(holder))
			holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)

/datum/outfit/job/bedar_combatready
	name = "Emily Bedar (Combat)"
	jobtype = /datum/job/bedar

	uniform = /obj/item/clothing/under/prism_office
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/emily
	glasses = /obj/item/clothing/glasses/hud/health
	head = null
	gloves = /obj/item/clothing/gloves/color/latex
	backpack_contents = list(/obj/item/healthanalyzer/advanced = 1, /obj/item/ksyringe = 6, /obj/item/krevive = 1, /obj/item/storage/firstaid/brute = 2, /obj/item/storage/firstaid/fire = 1, /obj/item/storage/firstaid/toxin = 1, /obj/item/storage/firstaid/o2 = 1, /obj/item/storage/pill_bottle/mannitol = 1, /obj/item/storage/pill_bottle/iron = 1)

	r_hand = /obj/item/ego_weapon/city/emily_tetsubo
	l_hand = /obj/item/medkit_emily

	l_pocket = /obj/item/storage/pcorp_pocket
	r_pocket = /obj/item/storage/pcorp_pocket

	back = /obj/item/storage/backpack/duffelbag/emily

	backpack = null
	satchel = null
	duffelbag = null

/datum/outfit/job/bedar_combatready/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]/skirt"
		if(!text2path(holder))
			holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)

/datum/outfit/job/ezra_combatready
	name = "Ezra Jennings (Combat)"
	jobtype = /datum/job/ezra

	uniform = /obj/item/clothing/under/prism_office/ezra
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/ezra
	glasses = null
	head = null
	mask = /obj/item/gun/ego_gun/city/smokepipe_ezra
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list()

	back = /obj/item/gun/ego_gun/city/ezra_cannon

	backpack = null
	satchel = null
	duffelbag = null

/datum/outfit/job/ezra_combatready/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]/skirt"
		if(!text2path(holder))
			holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)

/datum/outfit/job/schau_combatready
	name = "Alexius Schau (Combat)"
	jobtype = /datum/job/schau

	uniform = /obj/item/clothing/under/prism_office
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/schau
	glasses = /obj/item/clothing/glasses/orange
	head = null
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list(/obj/item/dstout_schau = 4)

	l_pocket = /obj/item/storage/pcorp_pocket

	back = /obj/item/gun/ego_gun/city/schau_bag

	backpack = null
	satchel = null
	duffelbag = null

/datum/outfit/job/schau_combatready/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]/skirt"
		if(!text2path(holder))
			holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)

/datum/outfit/job/will_combatready
	name = "William Solros (Combat)"
	jobtype = /datum/job/will

	uniform = /obj/item/clothing/under/prism_office
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/will
	glasses = /obj/item/clothing/glasses/regular/hipster
	head = null
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list()

	r_hand = /obj/item/ego_weapon/city/eclipse
	l_hand = /obj/item/ego_weapon/city/radiance

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
