//main role code

/datum/job/aurum
	title = "Aurum O'Lit"
	faction = "Station"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/aurum

	job_attribute_limit = 80

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "GOLDEN"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 80,
								PRUDENCE_ATTRIBUTE = 40,
								TEMPERANCE_ATTRIBUTE = 20,
								JUSTICE_ATTRIBUTE = 40
								)

/datum/job/aurum/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	var/obj/effect/proc_holder/spell/targeted/defensive_stance/def_stance = new
	var/obj/effect/proc_holder/spell/targeted/warcry/morale = new
	M.AddSpell(att_check)
	M.AddSpell(def_stance)
	M.AddSpell(morale)

/datum/outfit/job/aurum
	name = "Aurum O'Lit"
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

//abilities

/obj/effect/proc_holder/spell/targeted/defensive_stance
	name = "Defensive Stance"
	desc = "Значительно повышает общую защиту ценой скорости."

	charge_max = 50 SECONDS
	clothes_req = 0
	still_recharging_msg = "<span class='notice'>Ты ещё не можешь применить стойку повторно!</span>"

	action_icon = 'icons/hud/screen_skills.dmi'
	action_icon_state = "hunkerdown"

	range = -1
	include_user = 1

/obj/effect/proc_holder/spell/targeted/defensive_stance/cast(list/targets, mob/living/user = usr)
	user.say(pick("Я - ВАШ ЩИТ! Держитесь позади!!!", \
					"Меч мой - щит мне и братьям моим...",
					"Мой эфес прочнее чем любой доспех!!!",
					"Не сомневайтесь во мне, ведь я есть Золото!!!",
					"Мой клинок создан для того, что бы не дать коснуться вам меня!!!"))
	if (ishuman(user))
		var/mob/living/carbon/human/human = user
		human.add_movespeed_modifier(/datum/movespeed_modifier/def_stance)
		addtimer(CALLBACK(human, TYPE_PROC_REF(/mob, remove_movespeed_modifier), /datum/movespeed_modifier/def_stance), 20 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
		human.physiology.red_mod *= 0.3
		human.physiology.white_mod *= 0.3
		human.physiology.black_mod *= 0.3
		human.physiology.pale_mod *= 0.3
		addtimer(CALLBACK(src, PROC_REF(remove_buffs),), 20 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
		return TRUE

/obj/effect/proc_holder/spell/targeted/defensive_stance/proc/remove_buffs(list/targets, mob/living/user = usr)
	var/mob/living/carbon/human/human = user
	human.physiology.red_mod /= 0.3
	human.physiology.white_mod /= 0.3
	human.physiology.black_mod /= 0.3
	human.physiology.pale_mod /= 0.3

/datum/movespeed_modifier/def_stance
	variable = TRUE
	multiplicative_slowdown = 4

/obj/effect/proc_holder/spell/targeted/warcry
	name = "Warcry"
	desc = "Произносит речь, что несмотря на весь пафос реально работает."

	max_targets = 5
	random_target = 1
	charge_max = 100 SECONDS
	clothes_req = 0
	still_recharging_msg = "<span class='notice'>Ты ещё не отошёл от прошлого крика!</span>"

	action_icon = 'icons/hud/screen_skills.dmi'
	action_icon_state = "meditation"

	range = 5
	include_user = 1

/obj/effect/proc_holder/spell/targeted/warcry/cast(list/targets, mob/living/user = usr)
	user.say(pick("Позвольте вашим костям хрустнуть под этим напором! Ради нашей победы! Продолжайте бороться - ПОКА НЕ ПАДЁТ ПОСЛЕДНИЙ ИЗ НАС!!!", \
					"Я - Наш форт, а за мной фаланга таких же как я - моих братьев. Знайте же что Стены не падут!!!",
					"Не смейте пасть раньше чем я, но запомните что опора НИКОГДА НЕ ПАДЕТ!!!",
					"Пусть ваши длани и понурены, но сердца наполнены светом, значит нет места сожалениям!!!",
					"Для героев нет ничего страшного. Меч - защита для нас, а раны воспламеняют сердца!!!",
					"Для нас нет иного выхода как одолеть себя, а затем и заклятого врага!!!",
					"Люди умирают каждый день, чернь или верные товарищи - зависит от нас, так не дайте же врагу ликовать!!!",
					"Конец? Вы сказали 'конец'? Ничто не закончено, пока мы не решим что это так!!!",
					"Через пару часов мы уже будем трапезничать в нашем Офисе! А пока сосредоточьтесь на цели!!!",
					"Держите оборону! Оставайтесь со мной!!!",
					"Пока я здесь не отчаивайтесь! Страдания которые обрушились на нас - ПРОСТО НИЧТОЖНЫ!!!"))
	if (ishuman(user))
		var/mob/living/carbon/human/ab_operator = user
		ab_operator.adjustSanityLoss(-50)
		for(var/mob/living/carbon/human/affected in targets)
			if(affected != ab_operator)
				if(faction_check(affected.faction, ab_operator.faction))
					if(affected.sanity_lost)
						affected.sanityhealth = affected.maxSanity
					affected.adjustSanityLoss(-50)
					affected.say(pick("В бой!", "Мы прямо за тобой, Золотой!", "Всё или ничего!", "Покажем, что мы можем!", "Ещё не время отчаиваться...", "У нас ещё может что-то получиться...", "Мы только начали!", "Покажем им!", "Это наш последний шанс...", "Надеюсь, мы получим за это двойной оклад!"))
					to_chat(affected,"<span class='nicegreen'>Ты ощущаешь странный прилив сил...твоё сердце воспылало вновь!</span>")
		return TRUE

/obj/effect/temp_visual/deathslice
	icon = 'fd/icons/aurum_slash.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "deathslice"
	duration = 10 SECONDS

/obj/effect/temp_visual/deathslice/Initialize()
	. = ..()
	if(duration > 8 SECONDS)
		animate(src, transform = matrix()*1.8, alpha = 0, time = 2 SECONDS)

/obj/effect/temp_visual/commandGaurd/fast
	duration = 20

/obj/effect/temp_visual/dir_setting/big_slash
	icon = 'fd/icons/big_aurum_slash.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "slash"
	pixel_x = -32
	duration = 20

/obj/effect/temp_visual/dir_setting/big_slash/setDir(dir)
	. = ..()
	switch(dir)
		if(NORTH)
			pixel_y = -46
		if(SOUTH)
			pixel_y = -16
		if(EAST)
			pixel_x = -46
			pixel_y = -32
		if(WEST)
			pixel_x = -16
			pixel_y = -32

/obj/effect/temp_visual/dir_setting/big_slash/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(fade_out)), 10)

/obj/effect/temp_visual/dir_setting/big_slash/proc/fade_out()
	animate(src, alpha = 0, time = duration-10)

/obj/item/ego_weapon/city/zweihander/aurum
	name = "zweihander"
	desc = "A zweihander used by the zwei association."
	special = "Use in hand to buff your defense, and those of everyone around you."
	icon_state = "zwei"
	force = 55
	attack_speed = 2
	damtype = RED_DAMAGE

	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts")
	attack_verb_simple = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut")
	ready = TRUE
	defense_buff_others = 0.5
	attribute_requirements = list()
	var/attack_width = 1
	var/attack_length = 2
	var/taunts = 0
	var/taunts_max = 15
	var/attack_mode = "standart"

/obj/item/ego_weapon/city/zweihander/aurum/attack_self(mob/living/carbon/human/user)
	switch(attack_mode)
		if("standart")
			attack_mode = "slash"
			to_chat(user, span_notice("Ты переключился на '[attack_mode]'!"))
			return TRUE
		if("slash")
			attack_mode = "big slash"
			to_chat(user, span_notice("Ты переключился на '[attack_mode]'!"))
			return TRUE
		if("big slash")
			attack_mode = "standart"
			to_chat(user, span_notice("Ты переключился на '[attack_mode]'!"))
			return TRUE

/obj/item/ego_weapon/city/zweihander/aurum/examine(mob/user)
	. = ..()
	. += span_notice("Каждая активация меча накапливает шкалу таунта.")
	. += span_notice("Переключайтесь между режимами с помощью Alt-Click, чтобы тратить их.")
	. += span_notice("На данный момент, шкала таунта равна [taunts].")
	. += span_notice("А выставленный режим - [attack_mode].")

/obj/item/ego_weapon/city/zweihander/aurum/AltClick(mob/living/carbon/human/user)
	if(!CanUseEgo(user))
		return

	if(!ready)
		return
	ready = FALSE
	user.Immobilize(1 SECONDS)
	user.say(pick("ДЕРЖАТЬ ЛИНИЮ!!!", \
					"Я буду защищать вас - ценой всего!!!",
					"Пока я рядом, лезвие меча не даст вас в обиду!!!",
					"Фаланга - не дрогнуть!!!"))

	if(taunts < taunts_max)
		taunts += 1
		new /obj/effect/temp_visual/commandGaurd/fast(user.loc)

	buffed_people = list()

	for(var/mob/living/carbon/human/L in orange(5, get_turf(user)))
		L.physiology.red_mod *= defense_buff_others
		L.physiology.white_mod *= defense_buff_others
		L.physiology.black_mod *= defense_buff_others
		L.physiology.pale_mod *= defense_buff_others
		buffed_people += L

	playsound(src, 'sound/misc/whistle.ogg', 50, TRUE)
	addtimer(CALLBACK(src, PROC_REF(Return), user), 3 SECONDS)

/obj/item/ego_weapon/city/zweihander/aurum/Return(mob/living/carbon/human/user)
	for(var/mob/living/carbon/human/L in buffed_people)
		L.physiology.red_mod /= defense_buff_others
		L.physiology.white_mod /= defense_buff_others
		L.physiology.black_mod /= defense_buff_others
		L.physiology.pale_mod /= defense_buff_others
		to_chat(L, span_notice("Защита всё!"))

	addtimer(CALLBACK(src, PROC_REF(Cooldown), user), 15 SECONDS)

/obj/item/ego_weapon/city/zweihander/aurum/attack(mob/living/target, mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return FALSE
	if(!CanUseEgo(user))
		return

	switch(attack_mode)
		if("slash") // Thanks helper
			if(taunts >= 3)
				new /obj/effect/temp_visual/dir_setting/big_slash(get_step(user,user.dir), user.dir)
				Smash(user, target)
				taunts -= 3
		if("big slash")
			if(taunts >= 5)
				if(do_after(user, 12, src))
					playsound(src, 'sound/weapons/bladeslice.ogg', 75, FALSE, 4)
					for(var/turf/open/T in RANGE_TURFS(1, user))
						new /obj/effect/temp_visual/smash_effect(T)
						for(var/mob/living/victim in RANGE_TURFS(1, user))
							new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir)
						var/list/been_hit = QDELETED(target) ? list() : list(target)
						user.HurtInTurf(T, been_hit, 60, RED_DAMAGE, hurt_mechs = TRUE, hurt_structure = FALSE, break_not_destroy = TRUE)
					taunts -= 5

/obj/item/ego_weapon/city/zweihander/aurum/proc/Smash(mob/user, atom/target)
	var/dir_to_target = get_cardinal_dir(get_turf(user), get_turf(target))
	var/turf/source_turf = get_turf(user)
	var/turf/area_of_effect = list()
	var/turf/middle_line
	switch(dir_to_target)
		if(EAST)
			middle_line = getline(get_step(source_turf, EAST), get_ranged_target_turf(source_turf, EAST, attack_length))
			for(var/turf/T in middle_line)
				if(T.density)
					break
				for(var/turf/Y in getline(T, get_ranged_target_turf(T, NORTH, attack_width)))
					if (Y.density)
						break
					if (Y in area_of_effect)
						continue
					area_of_effect += Y
				for(var/turf/U in getline(T, get_ranged_target_turf(T, SOUTH, attack_width)))
					if (U.density)
						break
					if (U in area_of_effect)
						continue
					area_of_effect += U
		if(WEST)
			middle_line = getline(get_step(source_turf, WEST), get_ranged_target_turf(source_turf, WEST, attack_length))
			for(var/turf/T in middle_line)
				if(T.density)
					break
				for(var/turf/Y in getline(T, get_ranged_target_turf(T, NORTH, attack_width)))
					if (Y.density)
						break
					if (Y in area_of_effect)
						continue
					area_of_effect += Y
				for(var/turf/U in getline(T, get_ranged_target_turf(T, SOUTH, attack_width)))
					if (U.density)
						break
					if (U in area_of_effect)
						continue
					area_of_effect += U
		if(SOUTH)
			middle_line = getline(get_step(source_turf, SOUTH), get_ranged_target_turf(source_turf, SOUTH, attack_length))
			for(var/turf/T in middle_line)
				if(T.density)
					break
				for(var/turf/Y in getline(T, get_ranged_target_turf(T, EAST, attack_width)))
					if (Y.density)
						break
					if (Y in area_of_effect)
						continue
					area_of_effect += Y
				for(var/turf/U in getline(T, get_ranged_target_turf(T, WEST, attack_width)))
					if (U.density)
						break
					if (U in area_of_effect)
						continue
					area_of_effect += U
		if(NORTH)
			middle_line = getline(get_step(source_turf, NORTH), get_ranged_target_turf(source_turf, NORTH, attack_length))
			for(var/turf/T in middle_line)
				if(T.density)
					break
				for(var/turf/Y in getline(T, get_ranged_target_turf(T, EAST, attack_width)))
					if (Y.density)
						break
					if (Y in area_of_effect)
						continue
					area_of_effect += Y
				for(var/turf/U in getline(T, get_ranged_target_turf(T, WEST, attack_width)))
					if (U.density)
						break
					if (U in area_of_effect)
						continue
					area_of_effect += U
	for(var/i = 0; i < 2; i++)
		var/list/been_hit = list()
		for(var/turf/T in area_of_effect)
//			new /obj/effect/temp_visual/smash_effect(T)
			for(var/mob/living/victim in area_of_effect)
				new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir)
			been_hit = user.HurtInTurf(T, been_hit, 20, RED_DAMAGE)
		playsound(get_turf(src), 'sound/weapons/bladeslice.ogg', 50, 0, 2)
		sleep(0.25 SECONDS)
	return

/*	var/special_cooldown
	var/special_cooldown_time = 20 SECONDS
	var/dash_range = 8
	var/dash_ignore_walls = FALSE*/

/*/obj/item/ego_weapon/city/zweihander/aurum/afterattack(atom/A, mob/living/user, proximity_flag, params)
	if(!CanUseEgo(user))
		return
	if(special_cooldown > world.time)
		to_chat(user, span_warning("Тебе нужно отдышаться!"))
		return
	if(!isliving(A))
		return
	var/obj/effect/temp_visual/target_field/uhoh = new /obj/effect/temp_visual/target_field(A.loc)
	uhoh.orbit(A, 0)
	playsound(A, 'ModularTegustation/Tegusounds/claw/eviscerate1.ogg', 100, 1)
	to_chat(A, span_warning("[user] пронзает тебя взглядом. Бежать больше некуда."))
	if(!do_after(user, 1 SECONDS, src))
		to_chat(user, span_notice("Меня что - пощадили?"))
		qdel(uhoh)
		return
	special_cooldown = world.time + special_cooldown_time
	qdel(uhoh)
	DeathSlash(user, A)

/obj/item/ego_weapon/city/zweihander/aurum/proc/DeathSlash(mob/living/user, mob/living/target) // It wasn't nice meeting you, farewell.
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
			return*/
