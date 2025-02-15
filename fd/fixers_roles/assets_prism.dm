/area/city/prism

/area/city/prism/office_firstfloor
	name = "Prism Office - Cafe"

/area/city/prism/office_secondfloor
	name = "Prism Office - Living Space"

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

/obj/item/clothing/under/prism_office/albert
	desc = "An office suit combined with long trench. Looks cool."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Albert_under"

/obj/item/clothing/under/prism_office/aurum
	name = "rich pale suit"
	desc = "Elite looking pale suit with some gold on it."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Aurum_under"

/obj/item/clothing/under/prism_office/will
	name = "black turtleneck"
	desc = "An old looking black turtleneck."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Will_under"

/obj/item/clothing/under/prism_office/schau
	name = "green sweater"
	desc = "An pathetic green sweater."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Schau_under"

/obj/item/clothing/under/prism_office/emily
	name = "Office suit"
	desc = "An cool looking black office uniform."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Emily_under"

/obj/item/clothing/suit/armor/ego_gear/city/schau_trench
	name = "dusty trenchcoat"
	desc = "An stylish brown trench."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Schau_Trench"
	flags_inv = null
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 0, BLACK_DAMAGE = 0, PALE_DAMAGE = 0)
	attribute_requirements = list()

/obj/item/clothing/suit/armor/ego_gear/city/emily_coat
	name = "worn-out coat"
	desc = "An stylish red battle coat."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Emily_Coat"
	flags_inv = null
	armor = list(RED_DAMAGE = 20, WHITE_DAMAGE = 0, BLACK_DAMAGE = 0, PALE_DAMAGE = 0)
	attribute_requirements = list()

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak
	name = "Prism Office armored cloak"
	desc = "An stylish way to show that you are here. This one has blue triangle on back."
	icon = 'fd/icons/prism/prism.dmi'
	worn_icon = 'fd/icons/prism/prism.dmi'
	icon_state = "Aurum_Cloak"
	flags_inv = null
	armor = list(RED_DAMAGE = 50, WHITE_DAMAGE = 25, BLACK_DAMAGE = 30, PALE_DAMAGE = 20)
	attribute_requirements = list()

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/emily
	desc = "An stylish way to show that you are here. This one has red triangle on back."
	icon_state = "Gwaine_Cloak"

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/will
	desc = "An stylish way to show that you are here. This one has white triangle on back."
	icon_state = "Libra_Cloak"

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/albert
	desc = "Long dark cloak. This one has golden triangle on it's back."
	icon_state = "Albert_Cloak"

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/schau
	desc = "An stylish way to show that you are here. This one has green triangle on back."
	icon_state = "Schau_Cloak"

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/ezra
	desc = "An tattered dark cloak. This one has purple triangle on back."
	icon_state = "Ezra_cloak"
	var/state = 1

/obj/item/clothing/suit/armor/ego_gear/city/prism_cloak/ezra/AltClick(mob/user)
	if(state == 1)
		state = 2
		icon_state = "Ezra_cloak_alt"
		worn_icon_state = "Ezra_cloak_alt"
		update_icon()
		user.update_icon()
		return
	if(state == 2)
		state = 1
		icon_state = "Ezra_cloak"
		worn_icon_state = "Ezra_cloak"
		update_icon()
		user.update_icon()
		return

/obj/item/clothing/ears/ear_ring
	name = "ear ring"
	desc = "It's shiny!"
	icon = 'fd/icons/prism/Zakol.dmi'
	worn_icon = 'fd/icons/prism/Zakol.dmi'
	icon_state = "zakolka"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD 	// We protect all because magic
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	armor = list(RED_DAMAGE = 10, WHITE_DAMAGE = 0, BLACK_DAMAGE = 0, PALE_DAMAGE = 0)
	worn_icon_state = "zakolka_worn"

/obj/item/clothing/glasses/eyepatch/pros_libra
	name = "strange wrap"
	desc = "It in fact looking like something which would be worn by Index."
	icon = 'fd/icons/prism/Index.dmi'
	worn_icon = 'fd/icons/prism/Index.dmi'
	icon_state = "pros"

	armor = list(RED_DAMAGE = 10, WHITE_DAMAGE = 10, BLACK_DAMAGE = 0, PALE_DAMAGE = 0)
