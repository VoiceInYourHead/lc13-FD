//ROADBLOCK LEADER

/datum/job/roadblock_leader
	title = "Roadblock Office Leader"
	faction = "Station"
	supervisors = "Yourself"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/roadblock_leader

	job_attribute_limit = 0

	display_order = 4
	maptype = "limbus_labs"
	job_important = "Вы - управляющий Офиса 'Дорожной Блокады', дочерней команды Корректировщиков под управлением Ассоциации Цвай. Сохраняйте порядок в вашем квартале и обеспечьте его жителям спокойный, безопасный сон."
	job_abbreviation = "FIXTL"

	access = list(ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_FORENSICS_LOCKERS)

	roundstart_attributes = list(
								STRENGTH_STAT = 60,
								WILLPOWER_STAT = 20,
								OBSERVATION_STAT = 60,
								REFLEXES_STAT = 80
								)

/datum/job/roadblock_leader/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/obj/item/door_key/roadblock
	key_id = "ROADBLOCK OFFICE"

/datum/outfit/job/roadblock_leader
	name = "Roadblock Office Leader"
	jobtype = /datum/job/roadblock_leader

	uniform = /obj/item/clothing/under/zweiroadblock
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(/obj/item/door_key/roadblock = 1, /obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//ROADBLOCK FIXER

/datum/job/roadblock_fixer
	title = "Roadblock Office Fixer"
	faction = "Station"
	supervisors = "Your leader"
	selection_color = "#444444"
	total_positions = 4
	spawn_positions = 4

	outfit = /datum/outfit/job/roadblock_fixer

	job_attribute_limit = 0

	display_order = 4.1
	maptype = "limbus_labs"
	job_important = "Вы - управляющий Офиса 'Дорожной Блокады', дочерней команды Корректировщиков под управлением Ассоциации Цвай. Сохраняйте порядок в вашем квартале и обеспечьте его жителям спокойный, безопасный сон."
	job_abbreviation = "FIX"

	access = list(ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_FORENSICS_LOCKERS)

	roundstart_attributes = list(
								STRENGTH_STAT = 40,
								WILLPOWER_STAT = 20,
								OBSERVATION_STAT = 40,
								REFLEXES_STAT = 60
								)

/datum/job/roadblock_fixer/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/roadblock_fixer
	name = "Roadblock Office Fixer"
	jobtype = /datum/job/roadblock_fixer

	uniform = /obj/item/clothing/under/zweiroadblock
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/orange
	backpack_contents = list(/obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
