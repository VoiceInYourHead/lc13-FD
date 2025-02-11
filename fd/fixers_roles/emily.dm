//main role code

/datum/job/bedar
	title = "Emily Bedar"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/bedar

	job_attribute_limit = 100

	display_order = 1.3
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "BEDAR"

	roundstart_attributes = list(
								STRENGTH_STAT = 30,
								WILLPOWER_STAT = 40,
								OBSERVATION_STAT = 40,
								REFLEXES_STAT = 40,
								LUCK_STAT = 0,
								PRECISION_STAT = 80,
								INTELLECT_STAT = 60
								)

/datum/job/bedar/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	M.AddSpell(att_check)

/datum/outfit/job/bedar
	name = "Emily Bedar"
	jobtype = /datum/job/schau

	uniform = null
	ears = null
	shoes = null
	suit = null
	glasses = null
	head = null
	gloves = null
	backpack_contents = list()

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

// equipment

/mob/living
	var/damage_immune = FALSE

/mob/living/bullet_act(obj/projectile/P, atom/newloc)
	if(damage_immune)
		emily_dodge(newloc,dir)
		return
	. = ..()

/mob/living/attack_animal(mob/living/simple_animal/M, atom/newloc)
	if(damage_immune)
		emily_dodge(newloc,dir)
		return
	. = ..()

/mob/living/attack_hand(mob/living/carbon/human/user, atom/newloc)
	if(damage_immune)
		emily_dodge(newloc,dir)
		return
	. = ..()

/mob/living/attack_paw(mob/living/carbon/human/M, atom/newloc)
	if(damage_immune)
		emily_dodge(newloc,dir)
		return
	. = ..()

/mob/living/attackby(obj/item/I, mob/living/user, params, atom/newloc)
	if(damage_immune)
		emily_dodge(newloc,dir)
		return
	. = ..()

/mob/living/proc/emily_dodge(moving_to,move_direction)
	//Assuming we move towards the target we want to swerve toward them to get closer
	var/cdir = turn(move_direction,45)
	var/ccdir = turn(move_direction,-45)
	. = Move(get_step(loc,pick(cdir,ccdir)))
	if(!.)//Can't dodge there so we just carry on
		. =  Move(moving_to,move_direction)

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/emily
	var/on_cooldown = FALSE

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/emily/AltClick(mob/living/user = usr)
	if(on_cooldown)
		to_chat(user, span_danger("[src] всё ещё на перезарядке!"))
		return
	to_chat(user, span_danger("Накидка поможет вам временно уйти от урона!"))
	user.damage_immune = TRUE
	on_cooldown = TRUE
	add_filter("immune", 2, list("type" = "outline", "color" = "#acd8da", "size" = 1))
	addtimer(CALLBACK(src, PROC_REF(cloak_protection_removal),), 10 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
	addtimer(CALLBACK(src, PROC_REF(usage_delay),), 30 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/emily/proc/cloak_protection_removal(mob/living/user = usr)
	to_chat(user, span_danger("Вы снова уязвимы!"))
	user.damage_immune = FALSE
	remove_filter("immune")

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/emily/proc/usage_delay()
	on_cooldown = FALSE

/obj/item/ego_weapon/city/emily_tetsubo
	name = "combat tetsubo"
	desc = "An combat-hardened tetsubo with pretty sharp spikes."
	icon = 'fd/icons/prism/Weapons.dmi'
	icon_state = "Tetsubo"
	lefthand_file = 'fd/icons/prism/Weapons_Inhand_Left.dmi'
	righthand_file = 'fd/icons/prism/Weapons_Inhand_Right.dmi'
	force = 30
	attack_speed = 1
	damtype = RED_DAMAGE

	attack_verb_continuous = list("bashes", "crushes")
	attack_verb_simple = list("bash", "crush")

/obj/item/ego_weapon/city/emily_tetsubo/attack(mob/living/target, mob/living/user)
	if(!..())
		return
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 2), whack_speed, user)
