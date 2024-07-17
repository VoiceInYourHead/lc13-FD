//main role code

/datum/job/ezra
	title = "Ezra Jennings"
	faction = "Station"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/ezra

	job_attribute_limit = 80

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "POPPY"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 20,
								PRUDENCE_ATTRIBUTE = 30,
								TEMPERANCE_ATTRIBUTE = 20,
								JUSTICE_ATTRIBUTE = 80
								)

/datum/job/ezra/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	var/obj/effect/proc_holder/spell/cone/staggered/ezra_smoke/smoke = new
	M.AddSpell(att_check)
	M.AddSpell(smoke)

/datum/outfit/job/ezra
	name = "Ezra Jennings"
	jobtype = /datum/job/ezra

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

/obj/effect/proc_holder/spell/cone/staggered/ezra_smoke
	name = "Smoke Wall"
	desc = "Выплёвывает на врагов плотную волну раскалённого дыма. Для использования необходима трубка!"
	clothes_req = FALSE
	charge_max = 50 SECONDS
	cone_levels = 5
	respect_density = TRUE
	invocation_type = "none"
	var/minimum_smoke = 30

/obj/effect/proc_holder/spell/cone/staggered/ezra_smoke/cast(list/targets,mob/user = usr)
	var/obj/item/gun/ego_gun/city/smokepipe_ezra/held_item = user.get_active_held_item()
	if(!held_item)
		to_chat(user, span_danger("Твоя трубка должна быть в активной руке для активации!"))
		return FALSE
	if(held_item.smoke < minimum_smoke)
		to_chat(user, span_danger("Ты накопил недостаточно дыма! Тебе нужно минимум [minimum_smoke]!"))
		return FALSE
	. = ..()
	held_item.smoke -= 30

/obj/effect/proc_holder/spell/cone/staggered/ezra_smoke/do_turf_cone_effect(turf/target_turf, level)
	. = ..()
	new /obj/effect/temp_visual/small_smoke(target_turf)

/obj/effect/proc_holder/spell/cone/staggered/ezra_smoke/do_mob_cone_effect(mob/living/victim, level)
	. = ..()
	if(iscarbon(victim))
		var/mob/living/carbon/C = victim
		C.set_confusion(max(5, C.get_confusion()))
		C.adjustStaminaLoss(5, TRUE, TRUE)
		C.Jitter(20)
		C.reagents.add_reagent(/datum/reagent/toxin/lexorin, 10)

/obj/effect/proc_holder/spell/cone/staggered/ezra_smoke/calculate_cone_shape(current_level)
	if(current_level == cone_levels)
		return 5
	else if(current_level == cone_levels-1)
		return 3
	else
		return 2

//equipment

/obj/item/ammo_casing/caseless/smokepipe_ezra
	name = "smokepipe cloud"
	desc = "Cloud, fr."
	projectile_type = /obj/projectile/ego_bullet/smokepipe_ezra

/obj/projectile/ego_bullet/smokepipe_ezra
	name = "smoke cloud"
	icon_state = "smoke"
	damage = 5
	damage_type = BURN
	speed = 2
	range = 6

/obj/projectile/ego_bullet/smokepipe_ezra/on_hit(atom/target, blocked)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		C.set_confusion(max(5, C.get_confusion()))
		C.adjustStaminaLoss(damage, TRUE, TRUE)
		C.Jitter(20)

/obj/item/gun/ego_gun/city/smokepipe_ezra
	name = "unique smokepipe"
	desc = "You feeling...morphine smell inside of it?"
	icon_state = "smiling_heavypipe"
	fire_sound = 'sound/effects/smoke.ogg'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	ammo_type = /obj/item/ammo_casing/caseless/smokepipe_ezra
	autofire = 0.04 SECONDS
	fire_sound_volume = 5
	spread = 20

	//Reload mechanics
	shotsleft = 60
	reloadtime = 5 SECONDS
	var/smoke = 0
	var/needed_smoke_basic = 20
	var/needed_smoke_heavy = 30
	var/smoke_max = 40

/obj/item/gun/ego_gun/city/smokepipe_ezra/examine(mob/user)
	. = ..()
	. += span_notice("Ты накопил уже [smoke] единиц дыма из [needed_smoke_basic], необходимого для выпуска плотной струи дыма.")
	. += span_notice("Впрочем, для чего-то более мощного тебе необходимо минимум [needed_smoke_heavy] единиц дыма.")

/obj/item/gun/ego_gun/city/smokepipe_ezra/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/gun/ego_gun/city/smokepipe_ezra/process(delta_time)
	if(shotsleft <= 0)
		smoke -= 20

/obj/item/gun/ego_gun/city/smokepipe_ezra/reload_ego(mob/user)
	is_reloading = TRUE
	if(do_after(user, reloadtime, src))
		shotsleft = initial(shotsleft)
	is_reloading = FALSE

/obj/item/gun/ego_gun/city/smokepipe_ezra/attack_self(mob/living/carbon/human/user)
	if(shotsleft <= 0)
		if(reloadtime && !is_reloading)
			to_chat(user, span_warning("Ты начинаешь заправлять трубку..."))
			INVOKE_ASYNC(src, PROC_REF(reload_ego), user)
			return TRUE

	var/start = pick("Ты ощущаешь странное умиротворение...наркотик растекается по телу, заставляя неприятный зуд смениться лёгкостью и ясностью разума.",
					"Ты словно плаваешь в этом чувстве...покрывало окутывает всё твоё тело, сдавливая и разжимая мышцы и заставляя шестерёнки в голове снова крутиться.",
					"Ты словно опускаешь с глаз розовые очки, вновь начиная видеть окружающий мир во всех его отвратительных, но таких реальных красках. Твой разум чёток и ясен.")

	var/yapping = pick("Мир плывёт вокруг тебя, а твоё тело, будто бы, навечно замерло в моменте. Ужасно затягивающее ощущение нахождения одновременно везде и одновременно нигде...",
						"Твоё тело медленно тает от этого пьянящего удовольствия, хорошо взбалтывая мозги в черепушке.",
						"Картина приобретает новые, яркие, пёстрые краски. Твоё сердцебиение учащается, а люди и их угрюмые физиономии, будто бы, становятся ещё противнее.",
						"Ты не можешь вспомнить, какая по счёту эта затяжка за день. Впрочем, а стоит ли это в принципе считать?",
						"Твоя голова трещит по швам, и вероятно вскоре разорвётся подобно надувному шарику, но это склеит его воедино хотя бы на какое-то время...",
						"Всё твоё внимание сконцентрировано на процессе. Твои глаза бегают из стороны в сторону, пытаясь ухватиться за всё, что может быть полезно...улики, намёки, подозрительные лица и дурные знамения...",
						"Ты никогда не найдёшь ответов на многие из своих вопросов, но лучше так, нежели носить ношу правды до конца своих дней.")

	var/end = pick("Тебе хочется сбежать из этого места, куда-то высоко к облакам, где бы ты смог наконец-то хорошенько выспаться...",
					"Мир никогда не перестанет быть жесток. Жизнь, вероятнее всего, тоже не наладится. Но это не пугает тебя. Напротив, ты смирился с этой горькой правдой, предпочитая заглушать своё отчаяние апатией.",
					"Как давно ты чувствовал себя живым? Жил ли ты вообще? Проживёшь ли дальше? Это вопросы, которые ты не редко задаёшь самому себе. Трубка помогает забыть о них хотя бы на некоторое время.",
					"Когда-то ты точно сбежишь отсюда.",
					"Ради чего ты вообще продолжаешь всё это? Не лучше ли просто сдаться, как это сделали остальные?",
					"Достаточно ли ты хорош? Нужен ли ты им? А себе? Лучше просто не думать об этом...")

	user.visible_message("<span class='danger'>[user] зажигает фитиль, делая весьма большую затяжку из [src]...</span>")
	to_chat(user, span_papyrus("[start]"))
	spawn(5 SECONDS)
		to_chat(user, span_papyrus("[yapping]"))
	spawn(20 SECONDS)
		to_chat(user, span_papyrus("[end]"))
	if(do_after(user, 25 SECONDS, src))
		user.visible_message("<span class='warning'>Закончив с процессом, [user] удовлетворённо вздыхает, выпуская частицы дыма наружу.</span>")
		user.adjustSanityLoss(-50)
		if(user.roll_buff < user.roll_buff_max)
			user.roll_buff += 20
			if(user.roll_buff > user.roll_buff_max)
				user.roll_buff = user.roll_buff_max
			addtimer(CALLBACK(src, PROC_REF(Unbuff), user), 50 SECONDS)
		if(smoke < smoke_max)
			smoke += 5

/obj/item/gun/ego_gun/city/smokepipe_ezra/proc/Unbuff(mob/living/carbon/human/user)
	to_chat(user, span_notice("Как бы не был хорош тот миг, стоит возвращаться в наши серые будни..."))
	user.roll_buff -= 20

/obj/item/gun/ego_gun/city/smokepipe_ezra/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	if(smoke < needed_smoke_basic)
		to_chat(user, span_warning("У тебя недостаточно дыма для этого."))
		return FALSE
	..()
