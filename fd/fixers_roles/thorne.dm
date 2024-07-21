//main role code

/mob/living
	var/flame_stacks = 0
	var/max_flame_stacks = 20

/datum/job/thorne
	title = "Gawain Thorne"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/thorne

	job_attribute_limit = 100

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "THORN"

	roundstart_attributes = list(
								STRENGTH_STAT = 70,
								WILLPOWER_STAT = 50,
								OBSERVATION_STAT = 45,
								REFLEXES_STAT = 55,
								LUCK_STAT = 0,
								PRECISION_STAT = 50,
								INTELLECT_STAT = 40
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
	desc = "Создаёт вокруг смертоносный огненный смерч, раскидывая врагов. Требует 5ед. пламени!"
	charge_max = 30 SECONDS
	clothes_req = FALSE
	invocation_type = "none"
	range = 2
	action_icon = 'icons/mob/actions/actions_ecult.dmi'
	action_icon_state = "fire_ring"
	var/cost = 6

	var/maxthrow = 5
	var/repulse_force = MOVE_FORCE_EXTREMELY_STRONG

/obj/effect/proc_holder/spell/aoe_turf/flame_circle_thorne/cast(list/targets, mob/living/user = usr)
	if(user.flame_stacks < cost)
		to_chat(user, span_danger("У тебя недостаточно стаков пламени для применения данной способности! [user.flame_stacks]/[cost]"))
		return FALSE
	user.say("Возрадуйся, ибо ты победил. Познай мой огонь!!!")
	INVOKE_ASYNC(src, PROC_REF(fire_cascade), user,range)
	user.flame_stacks -= cost

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
	if(user.flame_stacks < cost)
		to_chat(user, span_danger("У тебя недостаточно стаков пламени для применения данной способности! [user.flame_stacks]/[cost]"))
		return FALSE
	user.say("Жар моего сердца это последнее, что тебе суждено узреть!!!")
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
	user.flame_stacks -= cost
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

//equipment

/obj/item/ego_weapon/city/fist_thorne
	name = "liu combat gloves"
	icon_state = "liufist"
	desc = "A gauntlet used by Liu Sections 4,5 and 6. Requires martial arts training to make use of."
	force = 20
	attack_speed = 0.7
	damtype = RED_DAMAGE
	attribute_requirements = list()
	var/chain = 0
	var/activated
	hitsound = 'sound/weapons/fixer/generic/fist1.ogg'

	var/combo_time
	var/combo_wait = 3 SECONDS

/obj/item/ego_weapon/city/fist_thorne/examine(mob/living/user)
	. = ..()
	. += span_warning("Прямо сейчас, у тебя [user.flame_stacks] из [user.max_flame_stacks] стаков пламени!")
	. += span_nicegreen("Это оружие имеет лёгкие и тяжёлые атаки. Нажмите по перчатке в руке, или же используйте клавишу активации чтобы переключаться между ними. Используйте их в следующих комбинациях:")
	. += span_info("ЛЛЛЛЛ - быстрое комбо из пяти атак, отбрасывающее врага последним ударом. Даёт два стака пламени.")
	. += span_info("Т 	  - размашистая тяжёлая атака с задержкой, наносящая на 1.5х урона больше и наносящая значительный урон выносливости. Не даёт пламени.")
	. += span_info("ЛТ 	  - поджигает единичную цель. Тратит два стака пламени.")
	. += span_info("ЛЛТ	  - последняя атака в этом комбо наносит 2х больше урона. Даёт два стака пламени.")
	. += span_info("ЛЛЛТ  - наносит средний урон, за последней атакой следует тактический уход в сторону. Даёт два стака пламени.")
	. += span_info("ЛЛЛЛТ - быстрое комбо с финалом в виде размашистого тяжёлого удара с задержкой, наносящего в 2х больше урона. Даёт четыре стака пламени.")

/obj/item/ego_weapon/city/fist_thorne/attack_self(mob/living/carbon/user)
	if(activated)
		activated = FALSE
		to_chat(user, span_danger("Ты решил вернуться к лёгким атакам."))
	else
		activated = TRUE
		to_chat(user, span_danger("Ты приготовил тяжёлый удар!"))

/obj/item/ego_weapon/city/fist_thorne/attack(mob/living/target, mob/living/user)
	if(!CanUseEgo(user))
		return

	if(world.time > combo_time)
		chain = 0
	combo_time = world.time + combo_wait

	var/during_windup //can't attack during windup
	if(during_windup)
		return

	//Setting chain and attack speed to 0
	chain+=1
	attack_speed = initial(attack_speed)

	//Teh Chain of attacks. See the examine for what each chain does.

	switch(chain)
		if(1)
			if(activated) //H - Solar Plexus attack
				to_chat(user, span_danger("Ты собираешься бить в солнечное сплетение..."))
				during_windup = TRUE
				if(do_after(user, 5, target))
					during_windup = FALSE
					force *= 1.5
					hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
					if(ishuman(target))
						target.Paralyze(20)
				else
					during_windup = FALSE
					return

		if(2)
			if(activated) //LH - Fire AOE
				to_chat(user, span_danger("Ты направляешь свой огонь в кулак..."))
				hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
				if(user.flame_stacks >= 2)
					target.adjust_fire_stacks(5)
					target.IgniteMob()
					user.flame_stacks -= 2
				target.apply_damage(force*0.5, damtype, null, target.run_armor_check(null, damtype), spread_damage = TRUE)

		if(3)
			if(activated) //LLH - Higher damage windup attack
				to_chat(user, span_danger("Ты готовишь сильную атаку."))
				during_windup = TRUE
				if(do_after(user, 5, target))
					during_windup = FALSE
					force *= 2
					hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
					if(user.flame_stacks < user.max_flame_stacks)
						user.flame_stacks += 2
				else
					during_windup = FALSE
					return

		if(4)
			if(activated) //LLLH - Fast hit and jump back
				to_chat(user, span_danger("Ты готовишься бить и скакать..."))
				force *= 1.5
				hitsound = 'sound/weapons/fixer/generic/gen2.ogg'
				hopback(user)
				if(user.flame_stacks < user.max_flame_stacks)
					user.flame_stacks += 2

		if(5)
			if(!activated)
				knockback(target, user)
				hitsound = 'sound/weapons/fixer/generic/finisher2.ogg'
				if(user.flame_stacks < user.max_flame_stacks)
					user.flame_stacks += 2
			else
				force*=2
				to_chat(user, span_danger("ТЫ БЬЁШЬ ЕГО СО ВСЕЙ СИЛОЙ ЧТО У ТЕБЯ ЕСТЬ!"))
				hitsound = 'sound/weapons/fixer/generic/finisher2.ogg'
				if(user.flame_stacks < user.max_flame_stacks)
					user.flame_stacks += 4
					if(user.flame_stacks > user.max_flame_stacks)
						user.flame_stacks = user.max_flame_stacks
			chain=0

	//Special attacks are slower.
	if(attack_speed == initial(attack_speed) && activated)
		attack_speed = 2
	. = ..()

	//Reset Everything
	if(activated)
		chain=0
		to_chat(user, span_danger("Цепь ударов сброшена."))
		activated = FALSE
	force = initial(force)
	hitsound = initial(hitsound)

/obj/item/ego_weapon/city/fist_thorne/proc/knockback(mob/living/target, mob/living/user)
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 3), whack_speed, user)

/obj/item/ego_weapon/city/fist_thorne/proc/hopback(mob/living/carbon/user)
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
