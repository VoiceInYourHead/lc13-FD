/obj/item/storage/wallet/random_ahn/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/stack/spacecash/c500(src)

//LCDA DOCTOR

/datum/job/lcda_doctor
	title = "LCDA 9 Stationary Doctor"
	faction = "Station"
	supervisors = "LCDA 9 Lead Investigator"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1
	department_head = list("LCDA 9 Lead Investigator")

	outfit = /datum/outfit/job/lcda_doctor

	access = list(ACCESS_MEDICAL)
	minimal_access = list(ACCESS_MEDICAL)

	job_attribute_limit = 0

	liver_traits = list(TRAIT_MEDICAL_METABOLISM)

	display_order = 1.3
	maptype = "limbus_labs"
	job_important = "Вы - нанятый 'Агентством Искажений Компании Лимбус' Корректировщик, специализирующийся на оказании первичной и вторичной медицинской помощи. Некоторые также могут обращаться к вам как к 'Хеку'. Оказывайте посильную помощь и не вмешивайтесь туда, куда вас не просят."
	job_abbreviation = "DOC"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 60,
								PRUDENCE_ATTRIBUTE = 20,
								TEMPERANCE_ATTRIBUTE = 40,
								JUSTICE_ATTRIBUTE = 20
								)

/datum/job/lcda_doctor/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORK_FORBIDDEN, JOB_TRAIT)

/obj/item/clothing/suit/armor/ego_gear/city/kcorp_sci/lcda
	name = "'Heka' uniform"
	desc = "A white labcoat with green lines. Has some protection, but it isn't that good."
	icon_state = "kcorp_sci"
	equip_slowdown = 0
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 20, BLACK_DAMAGE = 20, PALE_DAMAGE = 0)

/datum/outfit/job/lcda_doctor
	name = "LCDA 9 Stationary Doctor"
	jobtype = /datum/job/lcda_doctor

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/sneakers/black
	head = /obj/item/clothing/head/beret/tegu/viro
	l_hand = /obj/item/storage/firstaid/medical
	suit = /obj/item/clothing/suit/armor/ego_gear/city/kcorp_sci/lcda
	glasses = /obj/item/clothing/glasses/regular/circle
	backpack_contents = list(/obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	implants = /obj/item/organ/cyberimp/eyes/hud/medical

//LCA SCIENTIST

/datum/job/lcda_scientist
	title = "LCA Consultant"
	faction = "Station"
	supervisors = "Limbus Company Administration"
	selection_color = "#444444"
	total_positions = 2
	spawn_positions = 2
	department_head = list("LCDA 9 Lead Investigator")

	outfit = /datum/outfit/job/lcda_scientist

	access = list(ACCESS_MEDICAL, ACCESS_SECURITY)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_SECURITY)

	job_attribute_limit = 0

	display_order = 1.2
	maptype = "limbus_labs"
	job_important = "Вы - засланный сюда высшими инстанциями Компании учёный, ответственный за заполнение технической информации о Искажениях и поиск способов применения таковых в дальнейших операциях организации."
	job_abbreviation = "CON"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 20,
								PRUDENCE_ATTRIBUTE = 60,
								TEMPERANCE_ATTRIBUTE = 60,
								JUSTICE_ATTRIBUTE = 20
								)

/datum/job/lcda_scientist/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORK_FORBIDDEN, JOB_TRAIT)

/datum/outfit/job/lcda_scientist
	name = "LCA Consultant"
	jobtype = /datum/job/lcda_scientist

	uniform = /obj/item/clothing/under/suit/black_really
	ears = null
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/armor/ego_gear/limbus_labs/jacket
	glasses = /obj/item/clothing/glasses/monocle
	head = /obj/item/clothing/head/beret/black
	backpack_contents = list(/obj/item/door_key/lcda=1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//LCDA LEAD

/datum/job/lcda_lead
	title = "LCDA 9 Lead Investigator"
	faction = "Station"
	supervisors = "Limbus Company Administration"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/lcda_lead

	access = list(ACCESS_ARMORY, ACCESS_SECURITY, ACCESS_RND, ACCESS_MEDICAL, ACCESS_COMMAND, ACCESS_MANAGER)
	minimal_access = list(ACCESS_ARMORY, ACCESS_SECURITY, ACCESS_RND, ACCESS_MEDICAL, ACCESS_COMMAND, ACCESS_MANAGER)

	job_attribute_limit = 0

	display_order = 1
	maptype = "limbus_labs"
	job_important = "Вы - ведущий следователь Девятого отдела 'Агентства Искажений Компании Лимбус'. В ваши задачи входит организация операций, а также вынесение финального вердикта касательно поступаемых от вышестоящих инстанций дел."
	job_abbreviation = "LDR"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 60,
								PRUDENCE_ATTRIBUTE = 60,
								TEMPERANCE_ATTRIBUTE = 80,
								JUSTICE_ATTRIBUTE = 60
								)

/datum/job/lcda_lead/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/obj/item/clothing/suit/armor/ego_gear/city/mirae/lcda
	name = "combat jacket"
	desc = "A pretty dense, armored jacket."
	icon_state = "mirae"
	armor = list(RED_DAMAGE = 50, WHITE_DAMAGE = 80, BLACK_DAMAGE = 50, PALE_DAMAGE = 30)
	attribute_requirements = list()

/obj/item/door_key/lcda
	key_id = "LCDA OFFICE"

/datum/outfit/job/lcda_lead
	name = "LCDA 9 Lead Investigator"
	jobtype = /datum/job/lcda_lead

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/mirae/lcda
	glasses = /obj/item/clothing/glasses/sunglasses/big
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list(/obj/item/door_key/lcda=1, /obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//LCDA DETECTIVE

/datum/job/lcda_detective
	title = "LCDA 9 Investigator"
	faction = "Station"
	supervisors = "LCDA 9 Lead Investigator"
	selection_color = "#444444"
	total_positions = 6
	spawn_positions = 6
	department_head = list("LCDA 9 Lead Investigator")

	outfit = /datum/outfit/job/lcda_detective

	access = list(ACCESS_SECURITY)
	minimal_access = list(ACCESS_SECURITY)

	job_attribute_limit = 0

	display_order = 1.1
	maptype = "limbus_labs"
	job_important = "Вы - один из членов допросной команды Девятого отдела 'Агентства Искажений Компании Лимбус'. В ваши задачи входит обнаружение, захват, и ментальная обработка новых Искажений с последующей записью всех полученных записей для ведущего следователя."
	job_abbreviation = "INV"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 40,
								PRUDENCE_ATTRIBUTE = 40,
								TEMPERANCE_ATTRIBUTE = 40,
								JUSTICE_ATTRIBUTE = 40
								)

/datum/job/lcda_detective/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/lcda_detective
	name = "LCDA 9 Investigator"
	jobtype = /datum/job/lcda_detective

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/ego_gear/city/misc/second
	glasses = /obj/item/clothing/glasses/orange
	backpack_contents = list(/obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
