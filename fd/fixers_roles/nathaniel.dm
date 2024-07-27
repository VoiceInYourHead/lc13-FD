//main role code

/datum/job/nathaniel
	title = "Nathaniel"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/nathaniel

	job_attribute_limit = 100

	display_order = 1
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "NAT"

	roundstart_attributes = list(
								STRENGTH_STAT = 0,
								WILLPOWER_STAT = 0,
								OBSERVATION_STAT = 0,
								REFLEXES_STAT = 0,
								LUCK_STAT = 0,
								PRECISION_STAT = 0,
								INTELLECT_STAT = 0
								)

/datum/job/nathaniel/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	M.AddSpell(att_check)

/datum/outfit/job/nathaniel
	name = "Nathaniel"
	jobtype = /datum/job/nathaniel

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

/datum/job/nathaniel/after_spawn(mob/living/carbon/human/H, mob/M, latejoin = FALSE)
	..()

	H.maxHealth = 150
	H.health = 150
	H.death_threshold = -60
	H.hardcrit_threshold = -30
	H.crit_threshold = -10
	H.sanityhealth = 180
	H.maxSanity = 180
	H.add_movespeed_modifier(/datum/movespeed_modifier/assault)
