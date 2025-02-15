//main role code

/datum/job/bedar
	title = "Emily Bedar"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/bedar_combatready

	job_attribute_limit = 100

	display_order = 1.5
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "BEDAR"

	roundstart_attributes = list(
								STRENGTH_STAT = 30,
								WILLPOWER_STAT = 50,
								OBSERVATION_STAT = 50,
								REFLEXES_STAT = 50,
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
	jobtype = /datum/job/bedar

	uniform = /obj/item/clothing/under/prism_office/emily
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/emily_coat
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

/obj/item/medkit_emily
	name = "combat medical bag"
	desc = "An special handy bag of goods."
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "medkit"
	var/fast_heals = 10
	var/full_heals = 3
	var/list/mode = list("Быстрая перевязка", "Комплексная помощь")
	var/skill_needed = 70
	var/effectvisual

/obj/item/medkit_emily/examine(mob/user)
	. = ..()
	. += span_green("Медикаментов в запасе хватит ещё на [fast_heals] пит-стопов и [full_heals] полноценных операции.")

/obj/item/medkit_emily/proc/reset_threshold(mob/living/target)
	target.hardcrit_threshold+=150
	target.crit_threshold+=150
	target.death_threshold+=150

/obj/item/medkit_emily/attack(mob/living/target, mob/living/user)

	var/operating = input(user, "Выберите, что вы хотите сделать!", "Помогаем...") as null|anything in mode

	if(operating == "Быстрая перевязка")
		if(fast_heals <= 0)
			to_chat(user, span_danger("Здесь недостаточно материалов для оказания помощи!"))
			return
		new /obj/effect/temp_visual/healing(get_turf(target))
		if(do_after(user, 3 SECONDS, target))
			var/stat_level = get_attribute_level(user, PRECISION_STAT)
			if(stat_level < skill_needed)
				target.adjustBruteLoss(-20)
				target.adjustFireLoss(-20)
			else
				target.adjustBruteLoss(-50)
				target.adjustFireLoss(-50)
				if(ishuman(target))
					var/mob/living/carbon/human/T = target
					T.adjustSanityLoss(-50)
			target.hardcrit_threshold-=150
			target.crit_threshold-=150
			target.death_threshold-=150
			fast_heals -= 1
			addtimer(CALLBACK(src, PROC_REF(reset_threshold), target), 20 SECONDS)

	if(operating == "Комплексная помощь")
		if(full_heals <= 0)
			to_chat(user, span_danger("Здесь недостаточно материалов для оказания помощи!"))
			return
		var/stat_level = get_attribute_level(user, PRECISION_STAT)
		effectvisual = image('icons/effects/effects.dmi', "healing")
		user.add_overlay(effectvisual)
		if(do_after(user, 20 SECONDS, target))
			target.revive(full_heal = TRUE, admin_revive = TRUE)
			target.grab_ghost(force = TRUE)
			if(ishuman(target))
				var/mob/living/carbon/human/T = target
				T.Paralyze(300)
				T.adjustStaminaLoss(100)
			if(stat_level < skill_needed)
				target.adjustBruteLoss(60)
				target.adjustOxyLoss(20)
			else
				target.adjustBruteLoss(30)
			full_heals -= 1
			user.cut_overlay(effectvisual)
		user.cut_overlay(effectvisual)

/obj/item/storage/backpack/duffelbag/emily
	name = "duffel bag"
	desc = "A large duffel bag for holding extra things."
	icon_state = "bag_emily"
	inhand_icon_state = "bag_emily"

/obj/item/storage/backpack/duffelbag/emily/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 41
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 40
