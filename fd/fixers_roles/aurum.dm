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

	overlay_icon = 'icons/hud/screen_skills.dmi'
	overlay_icon_state = "hunkerdown"

	message = span_danger("Ты принимаешь защитную стойку!")
	range = -1
	include_user = 1

/obj/effect/proc_holder/spell/targeted/defensive_stance/cast(list/targets, mob/living/user = usr)
	user.say("Я - ВАШ ЩИТ! Держитесь позади!")
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

	overlay_icon = 'icons/hud/screen_skills.dmi'
	overlay_icon_state = "meditation"

	message = span_danger("Ты выкрикивашь какую-то белиберду!")
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
					"Пока я здесь не отчаивайтесь! Страдания которые обрушились на нас - ПРОСТО НИЧТОЖНЫ!"))
	if (ishuman(user))
		var/mob/living/carbon/human/ab_operator = user
		ab_operator.adjustSanityLoss(-50)
		for(var/mob/living/carbon/human/affected in targets)
			if(affected != ab_operator && affected.faction == ab_operator.faction)
				affected.adjustSanityLoss(-50)
				affected.say(pick("В бой!", "Мы прямо за тобой, Золотой!", "Всё или ничего!", "Покажем, что мы можем!", "Ещё не время отчаиваться...", "У нас ещё может что-то получиться...", "Мы только начали!", "Покажем им!", "Это наш последний шанс...", "Надеюсь, мы получим за это двойной оклад!"))
				to_chat(affected,"<span class='nicegreen'>Ты ощущаешь странный прилив сил...твоё сердце воспылало вновь!</span>")
		return TRUE

/*	var/dash_damage = 20

	for(var/obj/item/needed_weapon in user.held_items)
		if(istype(needed_weapon, /obj/item/ego_weapon/city/zweihander))
			var/mob/living/M = target
			var/obj/effect/temp_visual/target_field/blue/uhoh = new /obj/effect/temp_visual/target_field/blue(M.loc)
			uhoh.orbit(M, 0)
			to_chat(target, span_danger(" [user] готовится к рывку в твою сторону!"))
			if(do_after(user, 2 SECONDS, src))
				if(!istype(M) || QDELETED(M) || !M.loc || QDELETED(user) || !can_see(user, M))
					qdel(uhoh)
					return
				for(var/i in 2 to get_dist(user, M))
					step_towards(user,M)
				if((get_dist(user, M) < 2))
					new /obj/effect/temp_visual/smash_effect(get_turf(M))
					M.apply_damage(rand(30,40), RED_DAMAGE, null, M.run_armor_check(null, RED_DAMAGE), spread_damage = TRUE)
				playsound(src, 'sound/weapons/bladeslice.ogg', 300, FALSE, 9)
				to_chat(user, span_warning("Вы делаете рывок в сторону [M]!"))
			qdel(uhoh)
			return TRUE
		else
			to_chat(user, span_warning("Тебе нужно твоё оружие!"))
			return FALSE*/
