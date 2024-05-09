//The physical rugs//

/obj/structure/fd/rug
	name = "rug"
	desc = "A common rug, used to cover your boring floor. Transporting these has been the bane of humanity for years, now."
	icon = 'fd/icons/mojave_structures/64x64_rugs.dmi'
	icon_state = "rug_blue"
	flags_1 = FLAMMABLE
	anchored = TRUE
	layer = LOW_OBJ_LAYER
	bound_height = 64
	bound_width = 64
	layer = BELOW_OPEN_DOOR_LAYER
	obj_flags = NONE // No hitting these anymore
	var/has_alt_states = FALSE // Currenlty just rubber rugs. Could be more in the future. dunno.
	var/alternate_states

/obj/structure/fd/rug/Initialize()
	. = ..()
	if(has_alt_states)
		if(prob(85))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"

/obj/structure/fd/rug/fancy
	desc = "A common rug, used to cover your boring floor. It's got a nice and simple pattern on it, perfect for the living room."
	icon_state = "rug_fancy"

/obj/structure/fd/rug/yellow
	desc = "A common rug, used to cover your boring floor. It's got a semi-complex pattern on it, very appeasing to the eyes!"
	icon_state = "rug_yellow"

/obj/structure/fd/rug/red
	desc = "A common rug, used to cover your boring floor. It's got a red circle pattern on it. Bubbly!"
	icon_state = "rug_red"

/obj/structure/fd/rug/rubber
	name = "rubber mat"
	desc = "A large rubber mat, usually used in industrial areas to keep traction in slick conditions."
	icon_state = "rug_rubber"

/obj/structure/fd/rug/mat
	name = "door mat"
	desc = "A small door mat, it's got nothing on it, but it's still good for wiping your feet off before entering."
	icon = 'fd/icons/mojave_structures/32x32_rugs.dmi'
	icon_state = "mat_blank"

/obj/structure/fd/rug/mat/welcome
	name = "door mat"
	desc = "A small door mat, it's got the word WELCOME across it for the complete cozy home experience."
	icon_state = "mat_welcome"

/obj/structure/fd/rug/mat/vulgar
	name = "door mat"
	desc = "You shouldn't be seeing this mat."
	icon = 'fd/icons/mojave_structures/32x32_rugs.dmi'

/obj/structure/fd/rug/mat/vulgar/getfucked
	desc = "A small door mat, it's got the words GET FUCKED sprayed across it by what looks to be blood."
	icon_state = "mat_vulgar"

/obj/structure/fd/rug/mat/vulgar/fuckoff
	desc = "A small door mat, it's got the words FUCK OFF!! across it, looks like someone doesn't want visitors."
	icon_state = "mat_vulgar_2"

/obj/structure/fd/rug/mat/vulgar/shittown
	desc = "A small door mat, it's got the words SHIT TOWN across it, someone doesn't like this town."
	icon_state = "mat_town"

/obj/structure/fd/rug/mat/rubber
	name = "rubber mats"
	desc = "A small assortment of rubber mats. Good for keeping traction in slippery areas."
	icon_state = "rubber"
	has_alt_states = TRUE
	alternate_states = 11

/obj/structure/fd/rug/mat/rubber/single
	name = "rubber mat"
	desc = "A medium sized rubber mat. Good traction, good looks."
	icon_state = "rubber_single"
	has_alt_states = FALSE
