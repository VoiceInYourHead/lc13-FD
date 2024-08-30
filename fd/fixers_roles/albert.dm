//main role code

/obj/item/knowledge
	name = "something"
	desc = "something"
	icon = 'fd/icons/knowledge.dmi'
	icon_state = "knowledge1"
	var/knowledge = 0

/obj/item/knowledge/Initialize()
	. = ..()
	var/sprite = rand(1,11)
	icon_state = "knowledge[sprite]"

/obj/item/knowledge/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/ego_weapon/city/dieci_key))
		var/obj/item/ego_weapon/city/dieci_key/prism = I
		if(knowledge <= 0)
			to_chat(user, span_notice("Здесь нечего читать!"))
			return FALSE
		if(!prism.combat_mode)
			to_chat(user, span_notice("Ты не можешь читать, пока дерёшься!"))
			return FALSE
		if(do_after(user, 5 SECONDS, src))
			prism.knowledge_stored += knowledge

/datum/job/albert
	title = "Albert Krat"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/albert

	job_attribute_limit = 100

	display_order = 1.4
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "KRAT"

	roundstart_attributes = list(
								STRENGTH_STAT = 40,
								WILLPOWER_STAT = 35,
								OBSERVATION_STAT = 65,
								REFLEXES_STAT = 30,
								LUCK_STAT = 10,
								PRECISION_STAT = 50,
								INTELLECT_STAT = 70
								)

/datum/job/albert/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	M.AddSpell(att_check)

/datum/outfit/job/albert
	name = "Albert Krat"
	jobtype = /datum/job/albert

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

// weapons

/obj/item/ego_weapon/city/dieci_key
	name = "golden prism"
	desc = "A small key-like prism, used by Dieci Fixers."
	icon = null //жду спрайтов
	icon_state = null //жду спрайтов
	force = 2
	attack_speed = 0.5
	damtype = RED_DAMAGE

	hitsound = 'sound/weapons/genhit3.ogg'
	attack_verb_continuous = list("smashes", "crushes", "shatters")
	attack_verb_simple = list("smash", "crush", "shatter")
	attribute_requirements = list()

	var/icon_state_activated = null //жду спрайтов
	var/knowledge_stored = 0
	var/combat_mode = FALSE

/obj/item/ego_weapon/city/dieci_key/examine(mob/user)
	. = ..()
	. += span_notice("На данный момент, призма содержит в себе [knowledge_stored] Знаний.")


/obj/item/ego_weapon/city/dieci_key/attack_self(mob/user)
	if(!combat_mode && knowledge_stored > 0)
		var/force_amount = input(usr, "Как много знаний ты хочешь вложить в этот удар?", "Заряжаем...") as null|num
		if(force_amount > knowledge_stored)
			to_chat(user, span_notice("У тебя недостаточно знаний!"))
			return
		if(force_amount <= 0)
			to_chat(user, span_notice("Ты не можешь зарядить ключ отрицательными знаниями! Таких нет!"))
			return
		knowledge_stored -= force_amount
		transform_key(force_amount)

/obj/item/ego_weapon/city/dieci_key/proc/transform_key(power = 0)
	combat_mode = TRUE
	force += power
	icon_state = icon_state_activated
	addtimer(CALLBACK(src, PROC_REF(return_to_normal),), 30 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

/obj/item/ego_weapon/city/dieci_key/proc/return_to_normal()
	icon_state = initial(icon_state)
	force = initial(force)
	combat_mode = FALSE
