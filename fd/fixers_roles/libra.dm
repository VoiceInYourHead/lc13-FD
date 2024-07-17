//main role code

/datum/job/libra
	title = "Eizikaide Libra"
	faction = "Station"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/libra

	job_attribute_limit = 80

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "LIBRA"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 50,
								PRUDENCE_ATTRIBUTE = 50,
								TEMPERANCE_ATTRIBUTE = 20,
								JUSTICE_ATTRIBUTE = 80
								)

/datum/job/libra/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_NIGHT_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	M.AddSpell(att_check)

/datum/outfit/job/libra
	name = "Eizikaide Libra"
	jobtype = /datum/job/aurum

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = null
	glasses = /obj/item/clothing/glasses/orange
	head = null
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list()

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//equipment

/obj/item/gun/ego_gun/city/thumb/capo/libra_stolen
	name = "modified thumb rifle"
	desc = "A rifle used by thumb Capos. The gun is inlaid with silver and were much lightened for it's user."
	force = 50
	projectile_damage_multiplier = 5		//50 damage per bullet
	attribute_requirements = list()
	var/needed_minimum = 40
	var/player_temp = 0

/obj/item/gun/ego_gun/city/thumb/capo/libra_stolen/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	player_temp = get_attribute_level(user, TEMPERANCE_ATTRIBUTE)
	if(player_temp < needed_minimum)
		if(prob(50))
			var/debuff = pick("weapon drop", "weapon jammed")
			switch(debuff)
				if("weapon drop")
					to_chat(user, span_danger("Отдача неприятно бьёт в руку. Останется синяк."))
					var/hitzone = user.held_index_to_dir(user.active_hand_index) == "r" ? BODY_ZONE_R_ARM : BODY_ZONE_L_ARM
					user.apply_damage(10, RED_DAMAGE, hitzone, spread_damage = FALSE)
					user.visible_message("<span class='warning'>[user] скалится в болезненной гримасе.</span>")
				if("weapon jammed")
					to_chat(user, span_userdanger("АЙ. ПАЛЕЦ."))
					playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
					if(do_after(user, 5 SECONDS, src))
						playsound(user, 'sound/weapons/gun/rifle/bolt_out.ogg', 100, TRUE)
	..()

/obj/item/gun/ego_gun/city/thumb/capo/libra_stolen/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	player_temp = get_attribute_level(user, TEMPERANCE_ATTRIBUTE)
	if(player_temp < needed_minimum)
		if(prob(50))
			recoil = 5
			shake_camera(user, recoil + 1, recoil)
			user.slip(5, user.loc, GALOSHES_DONT_HELP, 0, FALSE)
			var/obj/item/gun/ego_gun/city/thumb/capo/libra_stolen/held_item = user.get_active_held_item()
			to_chat(user, "<span class='danger'>Ты роняешь [held_item] на землю от ужасной отдачи!</span>")
			recoil = 0
			user.dropItemToGround(held_item)
	..()
