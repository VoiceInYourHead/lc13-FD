//HHPP OWNER

/datum/job/hhpp_owner
	title = "HHPP Owner"
	faction = "Station"
	supervisors = "Yourself"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/hhpp_owner

	job_attribute_limit = 0

	display_order = 3
	maptype = "limbus_labs"
	job_important = "Вы - владелец успешного ресторана в Подворотнях, 'ХамХамПангПанг'. Сделайте всё, чтобы подняться ещё выше. Ах да, вы также, дефакто, являетесь Офисом, поэтому..."
	job_abbreviation = "CIV"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 20,
								PRUDENCE_ATTRIBUTE = 40,
								TEMPERANCE_ATTRIBUTE = 40,
								JUSTICE_ATTRIBUTE = 20
								)

/datum/job/hhpp_owner/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/obj/item/door_key/hhpp
	key_id = "HHPP"

/obj/item/ego_weapon/city/awl/no_attributes
	attribute_requirements = list()

/datum/outfit/job/hhpp_owner
	name = "HHPP Owner"
	jobtype = /datum/job/hhpp_owner

	uniform = /obj/item/clothing/under/suit/tuxedo
	ears = null
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/that
	glasses = /obj/item/clothing/glasses/monocle
	gloves = /obj/item/clothing/gloves/color/latex
	backpack_contents = list(/obj/item/door_key/hhpp = 1, /obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/pda = 1, /obj/item/storage/wallet/random_ahn = 1)
	belt = /obj/item/ego_weapon/city/awl/no_attributes

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//HHPP WORKER

/datum/job/hhpp
	title = "HHPP Worker"
	faction = "Station"
	supervisors = "Owner"
	selection_color = "#444444"
	total_positions = 2
	spawn_positions = 2

	outfit = /datum/outfit/job/hhpp

	job_attribute_limit = 0

	display_order = 3.1
	maptype = "limbus_labs"
	job_important = "Вы - работник успешного ресторана в Подворотнях, 'ХамХамПангПанг'. Сделайте всё, чтобы подняться ещё выше. Ах да, вы также, дефакто, являетесь Офисом, поэтому..."
	job_abbreviation = "CIV"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 20,
								PRUDENCE_ATTRIBUTE = 20,
								TEMPERANCE_ATTRIBUTE = 20,
								JUSTICE_ATTRIBUTE = 20
								)

/datum/outfit/job/hhpp
	name = "HHPP Worker"
	jobtype = /datum/job/hhpp

	uniform = /obj/item/clothing/under/suit/sl
	ears = null
	shoes = /obj/item/clothing/shoes/sneakers/black
	head = /obj/item/clothing/head/bowler
	gloves = /obj/item/clothing/gloves/color/latex
	backpack_contents = list(/obj/item/door_key/hhpp = 1, /obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//STASHER

/datum/job/stasher
	title = "Stasher"
	faction = "Station"
	supervisors = "Yourself"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/stasher

	job_attribute_limit = 0

	display_order = 3.2
	maptype = "limbus_labs"
	job_important = "Вы - Хламовщик. Человек, в лавке которого можно найти даже те вещи, что давно были сняты с производства или запрещены Главой. Найдите покупателя, наладьте бизнес, купайтесь в золоте! Хотя, его у вас и так в достатке."
	job_abbreviation = "CIV"

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 40,
								PRUDENCE_ATTRIBUTE = 40,
								TEMPERANCE_ATTRIBUTE = 40,
								JUSTICE_ATTRIBUTE = 40
								)

/datum/job/stasher/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/obj/item/door_key/stasher
	key_id = "SALVAGE SHOP"

/obj/item/clothing/suit/armor/ego_gear/he/uturn/lcda
	name = "strange suit"
	desc = "It's simple black, just like all the roads out there."
	icon_state = "uturn"
	armor = list(RED_DAMAGE = 40, WHITE_DAMAGE = 10, BLACK_DAMAGE = 0, PALE_DAMAGE = 20) // 70
	attribute_requirements = list()

/datum/outfit/job/stasher
	name = "Stasher"
	jobtype = /datum/job/stasher

	uniform = /obj/item/clothing/under/suit/black
	ears = null
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/armor/ego_gear/he/uturn/lcda
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	backpack_contents = list(/obj/item/door_key/stasher = 1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

//WORKSHOP WORKER

/datum/job/workshop_worker
	title = "Workshop Owner"
	faction = "Station"
	supervisors = "Yourself"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/workshop_worker

	job_attribute_limit = 0

	display_order = 3.3
	maptype = "limbus_labs"
	job_important = "Вы - владелец небольшой Мастерской в Подворотнях, зарабатывающий на создании различных инструментов и снаряжения местным Офисам."
	job_abbreviation = "CIV"

	access = list(ACCESS_ENGINE)
	minimal_access = list(ACCESS_ENGINE)

	roundstart_attributes = list(
								FORTITUDE_ATTRIBUTE = 20,
								PRUDENCE_ATTRIBUTE = 60,
								TEMPERANCE_ATTRIBUTE = 60,
								JUSTICE_ATTRIBUTE = 20
								)

/datum/job/workshop_worker/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/workshop_worker
	name = "Workshop Owner"
	jobtype = /datum/job/workshop_worker

	uniform = /obj/item/clothing/under/color/black
	ears = null
	shoes = /obj/item/clothing/shoes/workboots/mining
	head = /obj/item/clothing/head/soft/black
	glasses = /obj/item/clothing/glasses/welding
	backpack_contents = list(/obj/item/clothing/accessory/lawyers_badge/fixer = 1, /obj/item/storage/wallet/random_ahn = 1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
