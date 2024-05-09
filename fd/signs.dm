/obj/structure/fd/sign
	name = "Generic FD sign"
	desc = "OOOOAAAGHHO OOOHOHHH HELP I DONT WANT TO ADD SHIT ANYMORE IM OVER IT HEEELP-"
	icon = 'fd/icons/mojave_structures/64x64_signs.dmi'
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	max_integrity = 500 // Hardy but not immortal

/obj/structure/fd/sign/bazaar
	name = "bazaar sign"
	desc = "A set of signs clearly directing you to the heart of the greed. Obviously there is many things to be gained in this particular direction."
	icon_state = "bazaar"
	max_integrity = 750
	integrity_failure = 500

/obj/structure/fd/sign/private
	name = "sign"
	desc = "A sign exclaiming 'Private Property'! You get the feeling the property ahead is private."
	icon_state = "private"
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/fd/sign/workers
	name = "sign"
	desc = "A sign declaring a zone being off limits. Peculiar."
	icon_state = "workers"
	bound_x = 64
	pixel_y = 24
	density = FALSE

/obj/structure/fd/sign/rent
	name = "rent sign"
	desc = "FOR RENT. How exciting."
	icon_state = "rent"
	pixel_y = 32
	density = FALSE

/obj/structure/fd/sign/clinic
	name = "clinic sign"
	desc = "The great green cross of Snowcrest. You're finally safe..?"
	icon_state = "clinic"
	pixel_y = 32
	density = FALSE

/obj/structure/fd/sign/bar
	name = "bar sign"
	desc = "Light blocks forming the word 'BAR'. Throat be dry no more!"
	icon_state = "bar"
	pixel_y = 32
	density = FALSE
	max_integrity = 75
	integrity_failure = 35

/obj/structure/fd/sign/open
	name = "open sign"
	desc = "A neon sign, showing if the building is open for business or not! Incredible!"
	icon_state = "open"
	max_integrity = 75
	integrity_failure = 35
	pixel_y = 32
	density = FALSE

/obj/structure/fd/sign/open/bar
	icon_state = "open_bar"

/obj/structure/fd/sign/hotel
	name = "hotel sign"
	desc = "A hotel at last! Time to rest those weary feet."
	icon_state = "hotel"
	max_integrity = 800
	bound_x = 64
	pixel_y = 32
	density = FALSE

/obj/structure/fd/sign/weopen
	name = "sign"
	desc = "A sign. We're OPEN? Fantastic news!"
	icon_state = "we_open"
	anchored = TRUE
	density = TRUE
	max_integrity = 650 // Hardy but not immortal
	integrity_failure = 500
