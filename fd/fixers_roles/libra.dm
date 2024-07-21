//main role code

/datum/job/libra
	title = "Eizikaide Libra"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/libra

	job_attribute_limit = 100

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "LIBRA"

	roundstart_attributes = list(
								STRENGTH_STAT = 50,
								WILLPOWER_STAT = 50,
								OBSERVATION_STAT = 50,
								REFLEXES_STAT = 50,
								LUCK_STAT = 0,
								PRECISION_STAT = 50,
								INTELLECT_STAT = 50
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
	force = 30
	projectile_damage_multiplier = 5		//50 damage per bullet
	attribute_requirements = list()
