//main role code

/datum/job/nathaniel
	title = "Nathaniel"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/nathaniel

	job_attribute_limit = 100

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "NAT"

	roundstart_attributes = list(
								STRENGTH_STAT = 0,
								WILLPOWER_STAT = 0,
								OBSERVATION_STAT = 0,
								REFLEXES_STAT = 0,
								LUCK_STAT = 0,
								PRECISION_STAT = 0,
								INTELLECT_STAT = 0
								)

/datum/job/nathaniel/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	M.AddSpell(att_check)

/datum/outfit/job/nathaniel
	name = "Nathaniel"
	jobtype = /datum/job/nathaniel

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = null
	glasses = /obj/item/clothing/glasses/orange
	head = null
	neck = /obj/item/clothing/neck/horns
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list()

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

/datum/job/nathaniel/after_spawn(mob/living/carbon/human/H, mob/M, latejoin = FALSE)
	..()

	H.maxHealth = 150
	H.health = 150
	H.death_threshold = -60
	H.hardcrit_threshold = -30
	H.crit_threshold = -10
	H.sanityhealth = 180
	H.maxSanity = 180
	H.add_movespeed_modifier(/datum/movespeed_modifier/assault)

/obj/item/clothing/neck/horns
	name = "Reindeer Horns"
	desc = "For the last time. YOU CAN'T TOUCH THEM."
	icon = 'fd/icons/nat_horns.dmi'
	worn_icon = 'fd/icons/nat_horns.dmi'
	icon_state = "nat_horns"
	inhand_icon_state = ""	//no inhands
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ego_weapon/lance/fixers/nathaniel
	name = "cane"
	desc = "A basic cane. What can go wrong?"
	attack_verb_continuous = list("slashes", "pokes")
	attack_verb_simple = list("slash", "poke")
	var/unfolded_name = "telescopic spear"
	var/unfolded_desc = "Place here your shit"
	var/folded = TRUE
	sharpness = SHARP_EDGED
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_NORMAL
	actions_types = list(/datum/action/item_action/foldingcane)

	// battle stats
	attack_speed = 1.3
	force = 15
	couch_cooldown_time = 5 SECONDS //Cooldown between charges
	force_cap = 60 //highest damage a lance deals on charge; should be set manually.
	force_per_tile = 3
	charge_speed_cap = 4 //charge speed multiplier cap
	speed_per_tile = 0.2
	bump_threshold = 0.5
	pierce_threshold = 1 //minimum charge speed for multiple hits
	pierce_speed_cost = 0.8
	pierce_force_cost = 12

	// Adding Stuff \\
	// Fold/Unfold  \\

/obj/item/ego_weapon/lance/fixers/nathaniel/proc/fold()
	if(!src)
		return
	var/fold_message = null
	if(folded)
		folded = FALSE
		name = unfolded_name
		desc = unfolded_desc
		icon_state = initial(icon_state)
	//	item_state = initial(item_state)
		slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
		w_class = WEIGHT_CLASS_NORMAL

		attack_speed = 0.8
		reach = 3

		fold_message = "unfold"
	else
		folded = TRUE
		name = initial(name)
		desc = initial(desc)
		icon_state = initial(icon_state)
	//	item_state = initial(item_state)
		slot_flags = null
		w_class = WEIGHT_CLASS_HUGE

		attack_speed = 1.3
		reach = 1

		fold_message = "fold"

	usr.visible_message(FONT_LARGE(span_warning("[usr] [fold_message], transforming it into [name]")), span_notice("You [fold_message], transforming it into [name]"))
	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/ego_weapon/lance/fixers/nathaniel/verb/foldingcane()
	set name = "Fold/Unfold a Cane"
	set category = "Object"
	set src in oview(1)

	fold(usr)

/datum/action/item_action/foldingcane
	name = "Fold/Unfold a Cane"

/datum/action/item_action/foldingcane/Trigger()
	if(istype(target, /obj/item/ego_weapon/lance/fixers/nathaniel))
		var/obj/item/ego_weapon/lance/fixers/nathaniel/P = target
		P.fold()
		return
	..()

/obj/item/ego_weapon/lance/fixers/nathaniel/attack_self(mob/user)
	if(folded)
		return
	. = ..()

	// Lance Mechanic \\

/obj/item/ego_weapon/lance/fixers/nathaniel/UserMoved(mob/user)
	. = ..()
	// Animation
	if(!raised && !folded)
		var/in_turf = user.loc
		var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(in_turf, user.dir, user)
		D.alpha = 150
		animate(D, alpha = 0, time = 4)
		var/obj/effect/temp_visual/smoke/smoke = new /obj/effect/temp_visual/smoke(in_turf)
		smoke.color = "#000000ff"
		smoke.pixel_x = -10
		smoke.pixel_y = -5
		animate(smoke, alpha = 0, time = 8)

/obj/item/ego_weapon/lance/fixers/nathaniel/UserBump(mob/living/carbon/human/user, atom/A)
	. = ..()
	if(raised)
		return
	SoundBarrier()

/obj/item/ego_weapon/lance/fixers/nathaniel/proc/SoundBarrier()
	var/turf/T = get_turf(usr)
	new /datum/automata_cell/lanceshockwave(T)


	// ASSETS \\


/obj/effect/temp_visual/decoy
	desc = "It's a decoy!"
	duration = 15

/obj/effect/temp_visual/decoy/Initialize(mapload, set_dir, atom/mimiced_atom, modified_duration = 15)
	duration = modified_duration
	. = ..()
	alpha = initial(alpha)
	if(mimiced_atom)
		name = mimiced_atom.name
		appearance = mimiced_atom.appearance
		setDir(set_dir)
		mouse_opacity = 0


/obj/effect/temp_visual/smoke
	name = "smoke"
	icon = 'fd/fixers_roles/icons/smoke.dmi'
	icon_state = "smoke"
	anchored = TRUE
	duration = 20
	mouse_opacity = 0
	layer = FLY_LAYER
