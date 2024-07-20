//LCCB TEAM LEADER

/datum/job/lccb_teamleader
	title = "LCCB Team Leader"
	faction = "Station"
	supervisors = "LCDA 9 Lead Investigator"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1
	department_head = list("LCDA 9 Lead Investigator")

	outfit = /datum/outfit/job/lccb_teamleader

	access = list(ACCESS_ARMORY, ACCESS_SECURITY, ACCESS_COMMAND)
	minimal_access = list(ACCESS_ARMORY, ACCESS_SECURITY, ACCESS_COMMAND)

	job_attribute_limit = 0

	display_order = 2
	maptype = "limbus_labs"
	job_important = "Вы - лидер прикреплённой к Девятому отделу АИКЛ отряда 'Предварительной Зачистки Компании Лимбус'. Обеспечьте безопасность своим людям и людям Агентства, оказывайте ведущему следователю посильную помощь в вопросах организации как боевой специалист."
	job_abbreviation = "FTL"

	roundstart_attributes = list(
								STRENGTH_STAT = 40,
								WILLPOWER_STAT = 20,
								OBSERVATION_STAT = 40,
								REFLEXES_STAT = 80
								)

/datum/job/lccb_teamleader/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/lccb_teamleader
	name = "LCCB Team Leader"
	jobtype = /datum/job/lccb_teamleader

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/limbus_labs/hsc
	glasses = /obj/item/clothing/glasses/sunglasses/big
	head = /obj/item/clothing/head/beret/sec/lccb_commander
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list(/obj/item/door_key/lcda=1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//LCCB OPERATIVE

/datum/job/lccb_team
	title = "LCCB Team Operative"
	faction = "Station"
	supervisors = "LCDA 9 Lead Investigator or LCCB Team Leader"
	selection_color = "#444444"
	total_positions = 4
	spawn_positions = 4
	department_head = list("LCDA 9 Lead Investigator", "LCCB Team Leader")

	outfit = /datum/outfit/job/lccb_team

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

	job_attribute_limit = 0

	display_order = 2.1
	maptype = "limbus_labs"
	job_important = "Вы - оперативник прикреплённой к Девятому отделу АИКЛ отряда 'Предварительной Зачистки Компании Лимбус'. Обеспечьте безопасность людям Агентства, оказывайте посильную помощь в расследовании и сборе данных на месте."
	job_abbreviation = "OP"

	roundstart_attributes = list(
								STRENGTH_STAT = 60,
								WILLPOWER_STAT = 20,
								OBSERVATION_STAT = 20,
								REFLEXES_STAT = 60
								)

/datum/job/lccb_team/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/lccb_team
	name = "LCCB Team Operative"
	jobtype = /datum/job/lccb_team

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/beret/sec
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list(/obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
