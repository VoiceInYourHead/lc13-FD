/obj/item/clothing/under/prism_office
	name = "Office dim pale suit"
	desc = "An standart office suit."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "justunder"
	armor = list(RED_DAMAGE = 30, WHITE_DAMAGE = 0, BLACK_DAMAGE = 30, PALE_DAMAGE = 10)
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.

/obj/item/clothing/under/prism_office/thorne
	desc = "An standart office suit complemented by black coat."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Gwaine_under"

/obj/item/clothing/under/prism_office/ezra
	desc = "An standart office suit. Surely seen better days"
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Ezra_under"

/obj/item/clothing/under/prism_office/aurum
	name = "rich pale suit"
	desc = "Elite looking pale suit with some gold on it."
	icon = 'fd/icons/prism/Golsuit2.dmi'
	worn_icon = 'fd/icons/prism/Golsuit2.dmi'
	icon_state = "pale"

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak
	name = "Prism Office armored cloak"
	desc = "An stylish way to show that you are here. This one has blue triangle on back."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Aurum_Cloak"
	flags_inv = null
	armor = list(RED_DAMAGE = 50, WHITE_DAMAGE = 25, BLACK_DAMAGE = 30, PALE_DAMAGE = 20)
	attribute_requirements = list()

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/thorne
	desc = "An stylish way to show that you are here. This one has red triangle on back."
	icon_state = "Gwaine_Cloak"

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/ezra
	desc = "An tattered dark cloak. This one has purple triangle on back."
	icon_state = "Ezra_cloak"
	var/state = 1

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/ezra/AltClick(mob/user)
	if(state == 1)
		state = 2
		icon_state = "Ezra_cloak_alt"
		worn_icon_state = "Ezra_cloak_alt"
		return
	if(state == 2)
		state = 1
		icon_state = "Ezra_cloak"
		worn_icon_state = "Ezra_cloak"
		return

/obj/item/clothing/ears/ear_ring
	name = "ear ring"
	desc = "It's shiny!"
	icon = 'fd/icons/prism/Zakol.dmi'
	worn_icon = 'fd/icons/prism/Zakol.dmi'
	icon_state = "zakolka"
	armor = list(RED_DAMAGE = 10, WHITE_DAMAGE = 0, BLACK_DAMAGE = 0, PALE_DAMAGE = 0)
	worn_icon_state = "zakolka_worn"

/obj/item/clothing/glasses/eyepatch/pros_libra
	name = "strange wrap"
	desc = "It in fact looking like something which would be worn by Index."
	icon = 'fd/icons/prism/Index.dmi'
	worn_icon = 'fd/icons/prism/Index.dmi'
	icon_state = "pros"

	armor = list(RED_DAMAGE = 10, WHITE_DAMAGE = 10, BLACK_DAMAGE = 0, PALE_DAMAGE = 0)
