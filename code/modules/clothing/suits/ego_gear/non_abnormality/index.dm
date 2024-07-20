/obj/item/clothing/suit/armor/ego_gear/city/index
	flags_inv = HIDEJUMPSUIT | HIDEGLOVES
	name = "index proselyte armor"
	desc = "Armor worn by index proselytes."
	icon_state = "index_proselyte"
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 20, BLACK_DAMAGE = 20, PALE_DAMAGE = 30)
	attribute_requirements = list(
							STRENGTH_STAT = 60,
							WILLPOWER_STAT = 60,
							OBSERVATION_STAT = 60,
							REFLEXES_STAT = 60
							)

/obj/item/clothing/suit/armor/ego_gear/adjustable/index_proxy //Choose your Drip babey
	name = "index proxy armor"
	desc = "Armor worn by index proxies."
	icon_state = "index_proxy_open"
	icon = 'icons/obj/clothing/ego_gear/lc13_armor.dmi'
	worn_icon = 'icons/mob/clothing/ego_gear/lc13_armor.dmi'
	armor = list(RED_DAMAGE = 30, WHITE_DAMAGE = 30, BLACK_DAMAGE = 30, PALE_DAMAGE = 40)
	attribute_requirements = list(
							STRENGTH_STAT = 80,
							WILLPOWER_STAT = 80,
							OBSERVATION_STAT = 80,
							REFLEXES_STAT = 80
							)
	alternative_styles = list("index_proxy_open", "index_proxy_closed")

/obj/item/clothing/suit/armor/ego_gear/city/index_mess
	name = "index messenger armor"
	desc = "Armor worn by index messengers."
	icon_state = "yan_cloak"
	armor = list(RED_DAMAGE = 50, WHITE_DAMAGE = 50, BLACK_DAMAGE = 50, PALE_DAMAGE = 60)
	attribute_requirements = list(
							STRENGTH_STAT = 100,
							WILLPOWER_STAT = 100,
							OBSERVATION_STAT = 100,
							REFLEXES_STAT = 100
							)
