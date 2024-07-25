//main role code

/mob/living
	var/radiance = 0
	var/in_search = FALSE

/obj/item/story_related
	var/already_located

/obj/item/story_related/process()
	for(var/mob/living/detective in orange(2, src))
		if(detective.in_search && !found && !already_located)
			var/stat_level = get_attribute_level(detective, OBSERVATION_STAT)
			if(stat_level > 40)
				found = TRUE
				already_located = TRUE

	..()

/datum/job/will
	title = "William Solros"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/will

	job_attribute_limit = 100

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "WILL"

	roundstart_attributes = list(
								STRENGTH_STAT = 30,
								WILLPOWER_STAT = 60,
								OBSERVATION_STAT = 50,
								REFLEXES_STAT = 40,
								LUCK_STAT = 25,
								PRECISION_STAT = 30,
								INTELLECT_STAT = 40
								)

/datum/job/will/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	var/obj/effect/proc_holder/spell/pointed/BoD/boundry = new
	var/obj/effect/proc_holder/spell/targeted/detective_sense/reader = new
	M.AddSpell(att_check)
	M.AddSpell(boundry)
	M.AddSpell(reader)

/datum/outfit/job/will
	name = "William Solros"
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

/obj/effect/proc_holder/spell/pointed/BoD
	name = "Boundry of Death"
	desc = "ЧОТЫРЕ!"
	invocation_type = "none"
	charge_max = 5 MINUTES
	range = 8
	clothes_req = FALSE

	var/dash_range = 8
	var/dash_ignore_walls = FALSE

/obj/effect/proc_holder/spell/pointed/BoD/cast(list/targets, mob/living/user)
	var/mob/living/target = targets[1]
	var/obj/effect/temp_visual/target_field/uhoh = new /obj/effect/temp_visual/target_field(target.loc)
	uhoh.orbit(target, 0)
	playsound(target, 'ModularTegustation/Tegusounds/claw/eviscerate1.ogg', 100, 1)
	to_chat(target, span_warning("[user] пронзает тебя взглядом. Бежать больше некуда."))
	if(!do_after(user, 1 SECONDS, target))
		to_chat(user, span_notice("Меня что - пощадили?"))
		qdel(uhoh)
		return
	qdel(uhoh)
	DeathSlash(user, target)
	return ..()

/obj/effect/proc_holder/spell/pointed/BoD/proc/DeathSlash(mob/living/user, mob/living/target) // It wasn't nice meeting you, farewell.
	var/turf/tp_loc = get_step(target, pick(GLOB.alldirs))
	user.forceMove(tp_loc)
	user.face_atom(target)
	new /obj/effect/temp_visual/beam_in(tp_loc)
	playsound(tp_loc, 'ModularTegustation/Tegusounds/claw/move.ogg', 100, 1)
	target.Stun(20 SECONDS, ignore_canstun = TRUE)
	to_chat(user, span_notice("Ты взмахиваешь оружием, прорезаясь сквозь [target] в мгновение ока."))
	to_chat(target, span_warning("На секунду, кажется, ты ощутил как рвётся твоя плоть."))
	playsound(user, 'sound/weapons/bladeslice.ogg', 50, 1)
	new /obj/effect/temp_visual/deathslice(target.loc)
	target.face_atom(user)
	sleep(50)
	new /obj/effect/temp_visual/dir_setting/bloodsplatter(target.loc, target.dir)
	var/obj/effect/decal/cleanable/blood/B = new /obj/effect/decal/cleanable/blood(get_turf(target))
	target.emote("cough")
	target.say("Ч-что...")
	B.bloodiness = 100
	sleep(20)
	target.emote("cough")
	target.apply_damage(70, RED_DAMAGE, null, target.run_armor_check(null, RED_DAMAGE))

	if(target.health <= 0)
		var/obj/item/bodypart/head/head = target.get_bodypart(BODY_ZONE_HEAD)
		var/obj/item/bodypart/removingpart = head
		var/did_the_thing = (removingpart?.dismember())
		if(!did_the_thing)
			return

/obj/effect/proc_holder/spell/targeted/detective_sense
	name = "Detective Sense"
	desc = "Иногда, стоит просто задумчиво походить и ответ приходит к тебе сам."

	charge_max = 5 MINUTES
	clothes_req = 0

	range = -1
	include_user = 1

/obj/effect/proc_holder/spell/targeted/detective_sense/cast(list/targets, mob/living/user = usr)
	user.say("Посмотрим...тут точно должно быть что-то полезное.")
	visible_message(span_notice("[user] подносит руку к подбородку, сосредоточенно разглядывая окружение..."))
	user.in_search = TRUE
	addtimer(CALLBACK(src, PROC_REF(reset_senses),), 30 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
	return TRUE

/obj/effect/proc_holder/spell/targeted/detective_sense/proc/reset_senses(list/targets, mob/living/user = usr)
	user.in_search = FALSE
