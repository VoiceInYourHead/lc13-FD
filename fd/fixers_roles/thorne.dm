//main role code

/mob/living
	var/fire_stack = 0
	var/max_fire_stack = 20

/datum/job/thorne
	title = "Gawain Thorne"
	faction = "Station"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/thorne

	job_attribute_limit = 80

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "THORN"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 55,
								PRUDENCE_ATTRIBUTE = 45,
								TEMPERANCE_ATTRIBUTE = 35,
								JUSTICE_ATTRIBUTE = 65
								)

/datum/job/thorne/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	M.AddSpell(att_check)

/datum/outfit/job/thorne
	name = "Gawain Thorne"
	jobtype = /datum/job/thorne

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

//abilities

/obj/effect/proc_holder/spell/aoe_turf/flame_circle_thorne
	name = "Fire Cascade"
	desc = "Heats the air around you."
	charge_max = 30 SECONDS
	clothes_req = FALSE
	invocation_type = "none"
	range = 2
	action_icon = 'icons/mob/actions/actions_ecult.dmi'
	action_icon_state = "fire_ring"
	var/cost = 5

	var/maxthrow = 5
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

/obj/effect/proc_holder/spell/aoe_turf/flame_circle_thorne/cast(list/targets, mob/living/user = usr)
	if(user.fire_stack < cost)
		to_chat(user, span_danger("У тебя недостаточно стаков пламени для применения данной способности! [user.fire_stack]/[cost]"))
		return FALSE
	INVOKE_ASYNC(src, PROC_REF(fire_cascade), user,range)
	user.fire_stack -= cost

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
				M.adjustRedLoss(25)
				to_chat(M, "<span class='userdanger'>Ты ощущаешь, как твои кости трещат под ногой [user]!</span>")
		else
			if(isliving(AM))
				var/mob/living/M = AM
				M.Paralyze(20)
				to_chat(M, "<span class='userdanger'>Воздушная волна, созданная [user] откидывает тебя в сторону!</span>")
			AM.safe_throw_at(throwtarget, ((clamp((maxthrow - (clamp(distfromcaster - 2, 0, distfromcaster))), 3, maxthrow))), 1,user, force = repulse_force)
	return thrownatoms

/obj/effect/proc_holder/spell/aoe_turf/flame_circle_thorne/proc/fire_cascade(atom/centre,max_range)
	playsound(get_turf(centre), 'sound/items/welder.ogg', 75, TRUE)
	var/_range = 1
	for(var/i = 0, i <= max_range,i++)
		for(var/turf/T in spiral_range_turfs(_range,centre))
			new /obj/effect/hotspot(T)
			T.hotspot_expose(700,50,1)
			for(var/mob/living/livies in T.contents - centre)
				livies.adjustFireLoss(5)
		_range++
		sleep(3)

/obj/effect/proc_holder/spell/pointed/dragon_breath_thorne
	name = "Dragon Breath"
	desc = "Аугментация, позволяющая представителям Ассоциации Лью конвертировать накапливаемое оружием пламя в выпускаемый поток. Требут 10ед. пламени!"
	invocation_type = "none"
	charge_max = 1 MINUTES
	range = 15
	clothes_req = FALSE
	action_icon_state = "fireball"
	var/cost = 10

/obj/effect/proc_holder/spell/pointed/dragon_breath_thorne/cast(list/targets, mob/living/user)
	if(user.fire_stack < cost)
		to_chat(user, span_danger("У тебя недостаточно стаков пламени для применения данной способности! [user.fire_stack]/[cost]"))
		return FALSE
	for(var/X in targets)
		var/T
		T = line_target(-25, range, X, user)
		INVOKE_ASYNC(src, PROC_REF(fire_line), user,T)
		T = line_target(10, range, X, user)
		INVOKE_ASYNC(src, PROC_REF(fire_line), user,T)
		T = line_target(0, range, X, user)
		INVOKE_ASYNC(src, PROC_REF(fire_line), user,T)
		T = line_target(-10, range, X, user)
		INVOKE_ASYNC(src, PROC_REF(fire_line), user,T)
		T = line_target(25, range, X, user)
		INVOKE_ASYNC(src, PROC_REF(fire_line), user,T)
	user.fire_stack -= cost
	return ..()

/obj/effect/proc_holder/spell/pointed/dragon_breath_thorne/proc/line_target(offset, range, atom/at , atom/user)
	if(!at)
		return
	var/angle = ATAN2(at.x - user.x, at.y - user.y) + offset
	var/turf/T = get_turf(user)
	for(var/i in 1 to range)
		var/turf/check = locate(user.x + cos(angle) * i, user.y + sin(angle) * i, user.z)
		if(!check)
			break
		T = check
	return (getline(user, T) - get_turf(user))

/obj/effect/proc_holder/spell/pointed/dragon_breath_thorne/proc/fire_line(atom/source, list/turfs)
	var/list/hit_list = list()
	for(var/turf/T in turfs)
		if(istype(T, /turf/closed))
			break

		for(var/mob/living/L in T.contents)
			if(L in hit_list || L == source)
				continue
			hit_list += L
			L.adjustFireLoss(20)
			to_chat(L, "<span class='userdanger'>Твоё тело окутыват огонь [source]!</span>")

		new /obj/effect/hotspot(T)
		T.hotspot_expose(700,50,1)
		// deals damage to mechs
		for(var/obj/vehicle/sealed/mecha/M in T.contents)
			if(M in hit_list)
				continue
			hit_list += M
			M.take_damage(45, MELEE, 1)
		sleep(1.5)
