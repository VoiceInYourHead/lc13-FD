// ДАНДО И ЕГО ВЕЩИ

/obj/item/clothing/under/dando_official
	name = "white shirt"
	desc = "Simple white shirt with the cross."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Dando_under"
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 20, BLACK_DAMAGE = 20, PALE_DAMAGE = 20)
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD

/obj/item/clothing/suit/armor/ego_gear/city/dando_official
	name = "Sotto Capo cloak"
	desc = "Thumb official uniform."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Dando_cloak"
	flags_inv = null
	armor = list(RED_DAMAGE = 80, WHITE_DAMAGE = 100, BLACK_DAMAGE = 20, PALE_DAMAGE = 100)
	attribute_requirements = list()

/obj/item/ego_weapon/city/thumbcane/dando
	force = 80
	attribute_requirements = list()

/datum/job/dando
	title = "Dando Martinez"
	faction = "Thumb"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/dando

	job_attribute_limit = 100

	display_order = 1.6
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "THUMB"

	roundstart_attributes = list(
								STRENGTH_STAT = 30,
								WILLPOWER_STAT = 200,
								OBSERVATION_STAT = 200,
								REFLEXES_STAT = 30,
								LUCK_STAT = 0,
								PRECISION_STAT = 200,
								INTELLECT_STAT = 200
								)

/datum/job/dando/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/dando
	name = "Dando Martinez"
	jobtype = /datum/job/dando

	uniform = /obj/item/clothing/under/dando_official
	suit = /obj/item/clothing/suit/armor/ego_gear/city/dando_official
	back = null
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/laceup
	head = null
	mask = null
	neck = null
	ears = null
	glasses = /obj/item/clothing/glasses/orange
	id = null

	l_pocket = null
	r_pocket = null

	suit_store = null

	r_hand = /obj/item/ego_weapon/city/thumbcane/dando
	l_hand = null

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

// ШИМУРА И ЕЁ ДЕВЧАЧЬИ ТРЯПОЧКИ

/obj/item/clothing/under/shimura
	name = "black bodysuit"
	desc = "Very tight and agile black bodysuit."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Shimura_under"
	armor = list(RED_DAMAGE = 50, WHITE_DAMAGE = 30, BLACK_DAMAGE = 50, PALE_DAMAGE = 30)
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.

	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD

/obj/item/clothing/glasses/shimura
	name = "circle glasses"
	desc = "Stylish, big, circle glasses."
	icon = 'fd/icons/prism/inventory_states.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Shimura_glasses"
	inhand_icon_state = "glasses"

/obj/item/gun/ego_gun/city/shimura_rev
	name = "high-caliber magnum"
	desc = "An very expensive pistol, which is obviously need alot of strength to actually handle it."
	icon = 'fd/icons/rev10.dmi'
	icon_state = "rev10"
	inhand_icon_state = "fullstopdeagle"
	weapon_weight = WEAPON_LIGHT
	slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/caseless/fullstop
	fire_sound = 'sound/weapons/gun/rifle/shot_alt.ogg'
	projectile_damage_multiplier = 5
	shotsleft = 6
	reloadtime = 2 SECONDS
	attribute_requirements = list()
	fire_delay = 12

/datum/job/shimura
	title = "Katsu Shimura"
	faction = "Prism"
	supervisors = "Crave your own way"
	selection_color = "#444444"
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/shimura

	job_attribute_limit = 100

	display_order = 1.7
	maptype = "fixer_dnd"
	job_important = "Вы и сами знате, кто вы такой."
	job_abbreviation = "KATSU"

	roundstart_attributes = list(
								STRENGTH_STAT = 20,
								WILLPOWER_STAT = 100,
								OBSERVATION_STAT = 100,
								REFLEXES_STAT = 80,
								LUCK_STAT = 20,
								PRECISION_STAT = 80,
								INTELLECT_STAT = 150
								)

/datum/job/shimura/after_spawn(mob/living/carbon/human/H, mob/M)
	..()
	ADD_TRAIT(H, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(H, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

/datum/outfit/job/shimura
	name = "Katsu Shimura"
	jobtype = /datum/job/shimura

	uniform = /obj/item/clothing/under/shimura
	suit = null
	back = null
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/jackboots
	head = null
	mask = null
	neck = /obj/item/clothing/neck/stripedbluescarf
	ears = null
	glasses = /obj/item/clothing/glasses/shimura
	id = null

	l_pocket = /obj/item/gun/ego_gun/city/shimura_rev
	r_pocket = /obj/item/gun/ego_gun/city/shimura_rev

	suit_store = null

	r_hand = null
	l_hand = null

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
