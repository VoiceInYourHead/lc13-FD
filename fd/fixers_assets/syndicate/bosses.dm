/mob/living/carbon/human/boss/syndicate_leader
	spawn_abilities = list(
						/obj/effect/proc_holder/spell/targeted/toss,
						/obj/effect/proc_holder/spell/targeted/jab
						)
	spawn_attributes = list(
								STRENGTH_STAT = 100,
								WILLPOWER_STAT = 100,
								OBSERVATION_STAT = 100,
								REFLEXES_STAT = 100,
								LUCK_STAT = 100,
								PRECISION_STAT = 100,
								INTELLECT_STAT = 100
								)

/mob/living/carbon/human/boss/syndicate_leader/Initialize()
	. = ..()

	GLOB.syndicate_boss = src

	ADD_TRAIT(src, TRAIT_GRAB_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_NOHUNGER, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_PUSHIMMUNE, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_PIERCEIMMUNE, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_NODISMEMBER, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_NEVER_WOUNDED, JOB_TRAIT)

	faction = list("roses")

	gender = MALE
	body_type = gender
	real_name = "Black Lovelace"
	name = real_name
	underwear = "Nude"
	skin_tone = "caucasian2"
	hairstyle = "Swept Back Hair"
	hair_color = "#868686"
	facial_hairstyle = "Shaved"
	eye_color = "6f6"

	update_body()
	update_hair()
	update_body_parts()

	equip_to_slot_or_del(new /obj/item/clothing/under/prism_boss_first(src), ITEM_SLOT_ICLOTHING, TRUE)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(src), ITEM_SLOT_FEET, TRUE)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/ego_gear/city/prism_boss_first(src), ITEM_SLOT_OCLOTHING	, TRUE)
	put_in_l_hand(new /obj/item/book/granter/martial/cqc/fast(src))

/obj/item/book/granter/martial/cqc/fast
	pages_to_mastery = 0

/obj/item/book/granter/martial/cqc/fast/onlearned(mob/living/carbon/user)
	qdel(src)

///////////////////////////////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/targeted/toss
	name = "Toss"
	desc = ""

	action_icon = 'icons/hud/screen_skills.dmi'
	action_icon_state = "reraise"

	still_recharging_msg = "<span class='notice'>Рано.</span>"

	clothes_req = FALSE
	random_target_priority = TARGET_CLOSEST

	range = 1
	max_targets = 1
	random_target = 1

	var/autoaim_range = 8

	var/knockdown = 4 SECONDS
	var/throw_windup = 3 SECONDS
	var/jitter_amount = 200

/obj/effect/proc_holder/spell/targeted/toss/is_buckle_possible(mob/living/target, force = FALSE, check_loc = TRUE)
	return TRUE

/obj/effect/proc_holder/spell/targeted/toss/cast_check(skipcharge, mob/living/user = usr)
	if(user.IsParalyzed())
		return FALSE
	if(user.IsKnockdown())
		return FALSE
	if(user.IsStun())
		return FALSE
	. = ..()

/obj/effect/proc_holder/spell/targeted/toss/cast(list/targets, mob/living/user)
	var/mob/living/victim = targets[1]

	if(!user.pulling)
		victim.grabbedby(user, TRUE)
	victim.grippedby(user, TRUE) //instant aggro grab

	victim.jitteriness += jitter_amount
	victim.do_jitter_animation(victim.jitteriness)

	user.do_attack_animation(victim)
	user.face_atom(victim)

	user.Stun(throw_windup, TRUE)
	victim.Stun(throw_windup, TRUE)

	dir = user.dir
	buckle_mob(user, TRUE, FALSE)

	dir = victim.dir
	buckle_mob(victim, TRUE, FALSE)

	if(prob(80))
		victim.emote("scream")
	victim.Knockdown(throw_windup + knockdown, TRUE)

	var/offset_x = 0
	var/offset_y = 0

	var/relative_dir = get_dir(victim, user)
	if(relative_dir & NORTH)
		offset_y = 32
	if(relative_dir & SOUTH)
		offset_y = -32
	if(relative_dir & EAST)
		offset_x = 32
	if(relative_dir & WEST)
		offset_x = -32

	victim.layer = ABOVE_MOB_LAYER

	if(victim.client)
		animate(victim.client, pixel_x = offset_x*2, pixel_y = offset_y*2, time = 3, easing = SINE_EASING|EASE_OUT)
		animate(pixel_x = 0, pixel_y = 0, time = 6, easing = SINE_EASING|EASE_IN)

	playsound(get_turf(user), 'sound/weapons/slam.ogg', 100, TRUE)
	playsound(get_turf(user), pick('fd/fixers_assets/syndicate/hurt1.ogg', 'fd/fixers_assets/syndicate/hurt2.ogg', 'fd/fixers_assets/syndicate/hurt3.ogg'), 100)

	animate(victim, pixel_x = offset_x, pixel_y = offset_y, time = throw_windup / 2, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
	animate(victim, pixel_y = offset_y + 12, time = throw_windup, easing = CUBIC_EASING, flags = ANIMATION_PARALLEL)

	addtimer(CALLBACK(src, PROC_REF(throw_victim), victim, user), throw_windup)

/obj/effect/proc_holder/spell/targeted/toss/proc/throw_victim(mob/victim, mob/living/user)
	unbuckle_mob(buckled_mobs[1], TRUE)
	if(!victim)
		return

	unbuckle_mob(buckled_mobs[1], TRUE)
	victim.forceMove(get_turf(user))

	victim.jitteriness = max(victim.jitteriness - jitter_amount, 0)
	victim.layer = initial(victim.layer)

	if(user.IsKnockdown())
		return

	playsound(get_turf(user), pick('fd/fixers_assets/syndicate/hurt1.ogg', 'fd/fixers_assets/syndicate/hurt2.ogg', 'fd/fixers_assets/syndicate/hurt3.ogg'), 100)
	playsound(get_turf(victim), 'sound/weapons/thudswoosh.ogg', 200, TRUE)

	var/list/possible_targets = list()

	for(var/mob/living/mob in oview(autoaim_range, user))
		if(mob == user) // В будущем лучше сделать проверку на фракцию
			continue
		if(mob == victim)
			continue
		if(mob.stat == DEAD)
			continue
		possible_targets += get_turf(mob)

	if(!possible_targets.len)
		for(var/edge_turf in orange(8, get_turf(victim)))
			if(get_dist(victim, edge_turf) == 8)
				possible_targets += edge_turf

	var/turf/target = pick(possible_targets)

	user.do_attack_animation(victim)
	animate(victim, pixel_x = 0, pixel_y = 0)

	user.face_atom(target)
	victim.safe_throw_at(target, autoaim_range, victim.throw_speed, user, FALSE, null, CALLBACK(src, PROC_REF(land), victim), 4000)

/obj/effect/proc_holder/spell/targeted/toss/proc/land(mob/living/victim)
	explosion(get_turf(victim), 0, 0, 0, 1)
	victim.deal_damage(60, RED_DAMAGE)

///////////////////////////////////////////////////////////////////////////////////////

/obj/effect/proc_holder/spell/targeted/jab
	name = "Jab"
	desc = ""

	action_icon = 'icons/hud/screen_skills.dmi'
	action_icon_state = "battleready_on"

	still_recharging_msg = "<span class='notice'>Рано.</span>"

	clothes_req = FALSE
	random_target_priority = TARGET_CLOSEST

	range = 1
	max_targets = 1
	random_target = 1

	var/jab_windup = 2 SECONDS
	var/fly_duration = 4 SECONDS
	var/fall_duration = 0.7 SECONDS

/obj/effect/proc_holder/spell/targeted/jab/is_buckle_possible(mob/living/target, force = FALSE, check_loc = TRUE)
	return TRUE

/obj/effect/proc_holder/spell/targeted/jab/cast_check(skipcharge, mob/living/user = usr)
	if(user.IsParalyzed())
		return FALSE
	if(user.IsKnockdown())
		return FALSE
	if(user.IsStun())
		return FALSE
	. = ..()

/obj/effect/proc_holder/spell/targeted/jab/cast(list/targets, mob/living/user)
	var/mob/living/victim = targets[1]

	if(!user.pulling)
		victim.grabbedby(user, TRUE)
	victim.grippedby(user, TRUE) //instant aggro grab

	user.do_attack_animation(victim)
	user.face_atom(victim)

	user.Stun(jab_windup, TRUE)
	victim.Stun(jab_windup, TRUE)

	dir = user.dir
	buckle_mob(user, TRUE, FALSE)

	dir = victim.dir
	buckle_mob(victim, TRUE, FALSE)

	var/offset_x = 0
	var/offset_y = 0

	var/relative_dir = get_dir(victim, user)
	if(relative_dir & NORTH)
		offset_y = 12
	else if(relative_dir & SOUTH)
		offset_y = -12
	if(relative_dir & EAST)
		offset_x = 12
	else if(relative_dir & WEST)
		offset_x = -12

	victim.layer = ABOVE_MOB_LAYER

	playsound(get_turf(user), pick('fd/fixers_assets/syndicate/hurt1.ogg', 'fd/fixers_assets/syndicate/hurt2.ogg', 'fd/fixers_assets/syndicate/hurt3.ogg'), 100)

	animate(victim, pixel_x = offset_x, pixel_y = offset_y, time = jab_windup / 1.5, easing = BOUNCE_EASING, flags = ANIMATION_PARALLEL)
	animate(victim, pixel_x = offset_x * 1.8, pixel_y = offset_y * 1.8, time = jab_windup, easing = CUBIC_EASING, flags = ANIMATION_PARALLEL)

	addtimer(CALLBACK(src, PROC_REF(throw_victim), victim, user, relative_dir), jab_windup)

/obj/effect/proc_holder/spell/targeted/jab/proc/throw_victim(mob/living/victim, mob/user, relative_dir)
	unbuckle_all_mobs(TRUE)
	if(!victim)
		return

	if(victim.client)
		animate(victim.client, pixel_y = 64, time = 3, easing = SINE_EASING|EASE_OUT)
		animate(pixel_y = 0, time = 6, easing = SINE_EASING|EASE_IN)

	playsound(get_turf(user), 'sound/effects/hit_kick.ogg', 100, TRUE)

	user.do_attack_animation(victim)
	victim.face_atom(user)

	victim.mouse_opacity = MOUSE_OPACITY_OPAQUE
	victim.set_density(FALSE)

	victim.Stun(fly_duration+fall_duration, TRUE)

	var/dir_mod = 0
	if(relative_dir & EAST)
		dir_mod = -1
	else if(relative_dir & WEST)
		dir_mod = 1

	animate(victim, transform = matrix(15 * dir_mod, MATRIX_ROTATE), time = fall_duration/3, flags = ANIMATION_PARALLEL)
	animate(victim, pixel_x = 32*3*dir_mod, pixel_y = 32*7, alpha = 0, time = fall_duration, flags = ANIMATION_PARALLEL)

	spawn(fall_duration)
		walk(victim, REVERSE_DIR(relative_dir), 0.5 SECONDS)

	addtimer(CALLBACK(src, PROC_REF(victim_fall), victim, user, dir_mod), fly_duration)

/obj/effect/proc_holder/spell/targeted/jab/proc/victim_fall(mob/victim, mob/user, dir_mod)
	walk(victim, 0)

	animate(victim, transform = matrix(150 * dir_mod, MATRIX_ROTATE), time = 0)
	animate(victim, transform = matrix(165 * dir_mod, MATRIX_ROTATE), time = fall_duration/3)

	animate(victim, pixel_x = -32*3*dir_mod, time = 0)
	animate(victim, pixel_x = 0, pixel_y = 0, alpha = 255, time = fall_duration, flags = ANIMATION_PARALLEL)

	addtimer(CALLBACK(src, PROC_REF(fall_impact), victim, user), fall_duration)

/mob/living/proc/get_lying_angle()
	return lying_angle

/obj/effect/proc_holder/spell/targeted/jab/proc/fall_impact(mob/living/victim, mob/user)
	victim.mouse_opacity = MOUSE_OPACITY_ICON
	victim.set_density(TRUE)

	victim.layer = initial(victim.layer)
	animate(victim, transform = matrix(victim.get_lying_angle(), MATRIX_ROTATE), time = 0)

	victim.Knockdown(2 SECONDS)

	explosion(get_turf(victim), 0, 0, 0, 1)
	victim.deal_damage(80, RED_DAMAGE)
