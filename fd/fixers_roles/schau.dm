//main role code

/datum/job/schau
	title = "Emmerich Schau"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/schau

	job_attribute_limit = 100

	display_order = 1.3
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "SCHAU"

	roundstart_attributes = list(
								STRENGTH_STAT = 70,
								WILLPOWER_STAT = 45,
								OBSERVATION_STAT = 45,
								REFLEXES_STAT = 55,
								LUCK_STAT = 10,
								PRECISION_STAT = 35,
								INTELLECT_STAT = 50
								)

/datum/job/schau/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	var/obj/effect/proc_holder/spell/aoe_turf/air_circle_schau/airbomb = new
	M.AddSpell(att_check)
	M.AddSpell(airbomb)

/datum/outfit/job/schau
	name = "Emmerich Schau"
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

//abilities

/obj/effect/proc_holder/spell/aoe_turf/air_circle_schau
	name = "Air Bomb"
	desc = "Выпускает весь сжатый воздух из чемодана. Расходует 10ед. холода!"
	charge_max = 30 SECONDS
	clothes_req = FALSE
	invocation_type = "none"
	range = 2
	action_icon = 'icons/mob/actions/actions_ecult.dmi'
	action_icon_state = "voidpull"
	var/cost = 10

	var/maxthrow = 5
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

/obj/effect/proc_holder/spell/aoe_turf/air_circle_schau/cast(list/targets, mob/living/user = usr)
	var/obj/item/gun/ego_gun/city/schau_bag/held_item = user.get_active_held_item()
	if(!held_item)
		to_chat(user, span_danger("Твоя сумка должна быть в активной руке для активации!"))
		return FALSE
	if(held_item.shotsleft < cost)
		to_chat(user, span_danger("Весь холод уже вышел! Тебе нужно минимум [cost]ед.!"))
		return FALSE
	user.say("Руки прочь от багажа!!!")
	INVOKE_ASYNC(src, PROC_REF(air_circle), user,range)
	held_item.shotsleft -= cost

	var/list/thrownatoms = list()
	var/atom/throwtarget
	var/distfromcaster
	for(var/turf/T in targets)
		for(var/atom/movable/AM in T)
			thrownatoms += AM

	for(var/am in thrownatoms)
		var/atom/movable/AM = am
		if(AM == user || AM.anchored)
			continue

		throwtarget = get_edge_target_turf(user, get_dir(user, get_step_away(AM, user)))
		distfromcaster = get_dist(user, AM)
		if(distfromcaster == 0)
			if(isliving(AM))
				var/mob/living/M = AM
				M.Paralyze(20 * 2)
				M.apply_damage(50, RED_DAMAGE, null, M.run_armor_check(null, RED_DAMAGE), spread_damage = TRUE)
				to_chat(M, "<span class='userdanger'>Ты ощущаешь, как твои кости трещат под ногой [user]!</span>")
		else
			if(isliving(AM))
				var/mob/living/M = AM
				M.Paralyze(20)
				to_chat(M, "<span class='userdanger'>Воздушная волна, созданная [user] откидывает тебя в сторону!</span>")
			AM.safe_throw_at(throwtarget, ((clamp((maxthrow - (clamp(distfromcaster - 2, 0, distfromcaster))), 3, maxthrow))), 1,user, force = repulse_force)
	return thrownatoms

/obj/effect/proc_holder/spell/aoe_turf/air_circle_schau/proc/air_circle(atom/centre,max_range)
	playsound(get_turf(centre), 'sound/effects/refill.ogg', 75, TRUE)
	var/_range = 1
	for(var/i = 0, i <= max_range,i++)
		for(var/turf/T in spiral_range_turfs(_range,centre))
			new /obj/effect/temp_visual/smash_effect(T)
			for(var/mob/living/livies in T.contents - centre)
				livies.apply_damage(30, RED_DAMAGE, null, livies.run_armor_check(null, RED_DAMAGE), spread_damage = TRUE)
		_range++
		sleep(3)

//equipment

/obj/item/ammo_casing/caseless/ice_schau
	name = "cold air"
	desc = "Cold, fr."
	projectile_type = /obj/projectile/ego_bullet/ice_schau

/obj/projectile/ego_bullet/ice_schau
	name = "cold air"
	icon = 'icons/effects/effects.dmi'
	icon_state = "extinguish"
	damage = 10
	damage_type = BURN
	speed = 2
	range = 8
	impact_effect_type = /obj/effect/temp_visual/cold_air

/obj/effect/temp_visual/cold_air
	icon_state = "extinguish"
	duration = 50

/obj/projectile/ego_bullet/ice_schau/on_hit(atom/target, blocked)
	. = ..()
	if(iscarbon(target))
		var/mob/living/C = target
		C.Jitter(20)

/obj/item/gun/ego_gun/city/schau_bag
	name = "ДЕВЯТЬ courier bag"
	icon = 'fd/icons/chemodan_schau.dmi'
	icon_state = "blunt"
	inhand_icon_state = "blunt"
	worn_icon_state = "blunt"
	lefthand_file = 'fd/icons/chemodan_schau_inhand.dmi'
	righthand_file = 'fd/icons/chemodan_schau_inhand.dmi'
	desc = "An combat bag, used by north section of an ДЕВЯТЬ association."
	fire_sound = 'sound/effects/smoke.ogg'
	hitsound = 'sound/weapons/fixer/generic/fist1.ogg'
	slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	ammo_type = /obj/item/ammo_casing/caseless/ice_schau
	autofire = 0.04 SECONDS
	fire_sound_volume = 5
	spread = 20
	force = 20
	damtype = RED_DAMAGE

	attribute_requirements = list()

	//Combo mechanics
	shotsleft = 60 //also used for specials
	reloadtime = 30 SECONDS //so he would actually try to KEEP the cold
	var/chain = 0
	var/combo_time
	var/combo_wait = 3 SECONDS
	var/blunt = TRUE

/obj/item/gun/ego_gun/city/schau_bag/examine(mob/living/user)
	. = ..()
	. += span_warning("Прямо сейчас, у тебя [shotsleft] из [initial(shotsleft)] холода!")
	. += span_nicegreen("Это оружие имеет рубящие быстрые и дробящие тяжёлые атаки. Нажмите по сумке в руке, или же используйте клавишу активации чтобы переключаться между ними. Используйте их в следующих комбинациях:")
	. += span_info("РРРРР - быстрое комбо из пяти атак, накладывающее на врага временный эффект кровотечения. Восстанавливает холод на 5.")
	. += span_info("РД 	  - отбрасывает врага на несколько клеток, значительно замедляя его движение. Тратит 5 холода.")
	. += span_info("РРД	  - последняя атака в этом комбо наносит 2х больше урона. Восстанавливает 10 холода.")
	. += span_info("РРРД  - наносит средний урон, за последней атакой следует тактический уход в сторону. Восстанавливает холод на 5.")

/obj/item/gun/ego_gun/AltClick(mob/user)
	if(reloadtime && !is_reloading)
		INVOKE_ASYNC(src, PROC_REF(reload_ego), user)
	..()

/obj/item/gun/ego_gun/city/schau_bag/attack_self(mob/living/carbon/user)
	if(blunt)
		blunt = FALSE
		icon_state = "sharp"
		sharpness = SHARP_EDGED
		to_chat(user, span_danger("Ты переключился на рубящий режим."))
	else
		blunt = TRUE
		icon_state = "blunt"
		sharpness = SHARP_NONE
		to_chat(user, span_danger("Ты переключился на дробящий режим!"))

/obj/item/gun/ego_gun/city/schau_bag/attack(mob/living/target, mob/living/user)
	if(!CanUseEgo(user))
		return

	if(world.time > combo_time)
		chain = 0
	combo_time = world.time + combo_wait

	var/during_windup
	if(during_windup)
		return

	chain+=1

	switch(chain)
		if(1)
			if(blunt)
				to_chat(user, span_danger("Ты размахиваешься чемоданом..."))
				during_windup = TRUE
				if(do_after(user, 5, target))
					during_windup = FALSE
					force *= 1.5
					hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
					if(isliving(target))
						target.Paralyze(20)
				else
					during_windup = FALSE
					return

		if(2)
			if(blunt)
				to_chat(user, span_danger("Ты закручиваешься как юла..."))
				hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
				if(shotsleft >= 5)
					shotsleft -= 5
				knockback(target, user)
				target.add_movespeed_modifier(/datum/movespeed_modifier/bag_punch)
				addtimer(CALLBACK(target, TYPE_PROC_REF(/mob, remove_movespeed_modifier), /datum/movespeed_modifier/bag_punch), 20 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
				hitsound = 'sound/weapons/fixer/generic/finisher2.ogg'

		if(3)
			if(blunt) //LLH - Higher damage windup attack
				to_chat(user, span_danger("Ты закидываешь чемодан над своей головой."))
				during_windup = TRUE
				if(do_after(user, 5, target))
					during_windup = FALSE
					force *= 2
					hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
					if(shotsleft < initial(shotsleft))
						shotsleft += 10
				else
					during_windup = FALSE
					return

		if(4)
			if(blunt) //LLLH - Fast hit and jump back
				to_chat(user, span_danger("Ты готовишься бить и скакать..."))
				force *= 1.5
				hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
				hopback(user)
				if(shotsleft < initial(shotsleft))
					shotsleft += 5

		if(5)
			if(!blunt)
				addtimer(CALLBACK(src, PROC_REF(damage_target), target), 3 SECONDS)
				addtimer(CALLBACK(src, PROC_REF(damage_target), target), 6 SECONDS)
				addtimer(CALLBACK(src, PROC_REF(damage_target), target), 9 SECONDS)
				hitsound = 'sound/weapons/fixer/generic/baton3.ogg'
				if(shotsleft < initial(shotsleft))
					shotsleft += 5
			chain=0

	. = ..()

	//Reset Everything
	if(blunt)
		chain=0
		to_chat(user, span_danger("Цепь ударов сброшена."))
	force = initial(force)
	hitsound = initial(hitsound)

/obj/item/gun/ego_gun/city/schau_bag/proc/damage_target(mob/living/target)
	target.apply_damage(10, RED_DAMAGE, null, target.run_armor_check(null, RED_DAMAGE), spread_damage = TRUE)

/obj/item/gun/ego_gun/city/schau_bag/proc/knockback(mob/living/target, mob/living/user)
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 3), whack_speed, user)

/obj/item/gun/ego_gun/city/schau_bag/proc/hopback(mob/living/carbon/user)
	var/dodgelanding
	if(user.dir == 1)
		dodgelanding = locate(user.x, user.y - 2, user.z)
	if(user.dir == 2)
		dodgelanding = locate(user.x, user.y + 2, user.z)
	if(user.dir == 4)
		dodgelanding = locate(user.x - 2, user.y, user.z)
	if(user.dir == 8)
		dodgelanding = locate(user.x + 2, user.y, user.z)
	user.throw_at(dodgelanding, 3, 2, spin = FALSE)

/datum/movespeed_modifier/bag_punch
	variable = TRUE
	multiplicative_slowdown = 6
