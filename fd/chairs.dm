/obj/structure/chair/fd
	name = "base class chair"
	desc = "Scream at the coders if you see this."
	icon = 'fd/icons/mojave_structures/chairs.dmi'
	item_chair = /obj/item/chair/fd
	layer = BELOW_OBJ_LAYER
	max_integrity = 100

// Metal Chairs //

/obj/structure/chair/fd/metal
	name = "metal chair"
	desc = "An uncomfortable chair."
	icon_state = "metal_chair"
	item_chair = /obj/item/chair/fd/metal

/obj/structure/chair/fd/metal/broken
	name = "broken metal chair"
	desc = "A broken chair that is somehow more comfortable than a regular one."
	icon_state = "metal_chair_broken"
	item_chair = /obj/item/chair/fd/metal/broken

/obj/structure/chair/fd/metal/unfinished
	name = "unfinished metal chair"
	desc = "Without a backrest, this chair is essentially a stool with rods."
	icon_state = "metal_chair_unfinished"
	item_chair = /obj/item/chair/fd/metal/unfinished

/obj/structure/chair/fd/metal/blue
	name = "metal chair"
	icon_state = "metal_chair_blue"
	item_chair = /obj/item/chair/fd/metal/blue

/obj/structure/chair/fd/metal/blue/broken
	name = "broken metal chair"
	desc = "A broken chair that is somehow more comfortable than a regular one."
	icon_state = "metal_chair_blue_broken"
	item_chair = /obj/item/chair/fd/metal/blue/broken

/obj/structure/chair/fd/metal/blue/unfinished
	name = "unfinished metal chair"
	desc = "Without a backrest, this chair is essentially a stool with rods."
	icon_state = "metal_chair_blue_unfinished"
	item_chair = /obj/item/chair/fd/metal/blue/unfinished

/obj/structure/chair/fd/metal/red
	icon_state = "metal_chair_red"
	item_chair = /obj/item/chair/fd/metal/red

/obj/structure/chair/fd/metal/red/broken
	name = "broken metal chair"
	desc = "A broken chair that is somehow more comfortable than a regular one."
	icon_state = "metal_chair_red_broken"
	item_chair = /obj/item/chair/fd/metal/red/broken

/obj/structure/chair/fd/metal/red/unfinished
	name = "unfinished metal chair"
	desc = "Without a backrest, this chair is essentially a stool with rods."
	icon_state = "metal_chair_red_unfinished"
	item_chair = /obj/item/chair/fd/metal/red/unfinished

/obj/structure/chair/fd/metal/folding
	name = "metal folding chair"
	desc = "Before the war, These were viewed as the lowest form of seat. Now? What's not to love. It's a chair that's easily moveable. Genius!"
	icon_state = "metal_chair_folding"
	item_chair = /obj/item/chair/fd/metal/folding

/obj/structure/chair/fd/metal/stool
	name = "bar stool"
	desc = "A bar stool. It's help up against time rather well. Perfect to prop yourself up on after a long day."
	icon_state = "barstool"
	item_chair = /obj/item/chair/fd/metal/stool

// Wood Chairs //

/obj/structure/chair/fd/wood
	name = "wooden chair"
	desc = "An antique wooden chair with a small green cushion."
	icon_state = "wood_chair"
	item_chair = /obj/item/chair/fd/wood

/obj/structure/chair/fd/wood/padded
	name = "padded wooden chair"
	desc = "An antique wooden chair with a large, plush red cushion"
	icon_state = "wood_chair_padded"
	item_chair = /obj/item/chair/fd/wood/padded

// Quirky Chairs //

/obj/structure/chair/comfy/fd
	name = "base class Mojave Sun comfy chair"
	desc = "Scream at the coders if you see this."
	icon = 'fd/icons/mojave_structures/chairs.dmi'
	color = null
	max_integrity = 100

/obj/structure/chair/comfy/fd/GetArmrest()
	return mutable_appearance(icon, "(icon_state)_armrest")

/obj/structure/chair/comfy/fd/armchair
	name = "armchair"
	desc = "A once plush velour accent piece, this chair's upholstery has faded."
	icon_state = "armchair"

/obj/structure/chair/comfy/fd/retro
	name = "retro chair"
	desc = "With a fiberglass body, this chair harkens to a future that never came."
	icon_state = "retro_chair"

/obj/structure/chair/comfy/fd/captain
	name = "captain's chair"
	desc = "Show everyone who is in charge."
	icon_state = "captain_chair"

/obj/structure/chair/comfy/fd/ergo
	name = "ergonomic chair"
	desc = "Even in a nuclear wasteland, one should never neglect their back."
	icon_state = "ergo_chair"
	anchored = FALSE

/obj/structure/chair/comfy/fd/ergo/Moved()
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 100, TRUE)

/obj/structure/chair/fd/overlaypickup/plastic
	name = "plastic chair"
	desc = "The most generic chair known to pre-war man."
	icon_state = "plastic_chair"
	armrest_icon = "plastic_chair_armrest"
	item_chair = /obj/item/chair/fd/plastic
	max_integrity = 100

/obj/structure/chair/fd/overlaypickup //overlay chairs you can pick up
	var/mutable_appearance/armrest
	var/armrest_icon = "comfychair_armrest"

/obj/structure/chair/fd/overlaypickup/Initialize()
	. = ..()
	armrest = GetArmrest()
	armrest.layer = ABOVE_MOB_LAYER
	return

/obj/structure/chair/fd/overlaypickup/proc/GetArmrest()
	return mutable_appearance(icon, "(icon_state)_armrest")

/obj/structure/chair/fd/overlaypickup/Destroy()
	. = ..()
	QDEL_NULL(armrest)
	return

/obj/structure/chair/fd/overlaypickup/post_buckle_mob(mob/living/M)
	. = ..()
	update_armrest()

/obj/structure/chair/fd/overlaypickup/proc/update_armrest()
	if(has_buckled_mobs())
		add_overlay(armrest)
	else
		cut_overlay(armrest)

/obj/structure/chair/fd/overlaypickup/post_unbuckle_mob()
	. = ..()
	update_armrest()

// Office Chairs //

/obj/structure/chair/office/Moved()
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 75, TRUE)

/obj/structure/chair/office/fd
	name = "base class Mojave sun office chair"
	desc = "Scream at the coders if you see this."
	icon = 'fd/icons/mojave_structures/chairs.dmi'
	max_integrity = 100

/obj/structure/chair/office/fd/red
	name = "office chair"
	desc = "Still spins."
	icon_state = "office_chair"

/obj/structure/chair/office/fd/red/broken
	name = "office chair"
	desc = "Hardly spins."
	icon_state = "office_chair_broken"

/obj/structure/chair/office/fd/blue
	name = "office chair"
	icon_state = "office_chair_blue"

/obj/structure/chair/office/fd/blue/broken
	icon_state = "office_chair_blue_broken"

/obj/structure/chair/office/fd/green
	name = "office chair"
	icon_state = "office_chair_green"

/obj/structure/chair/office/fd/green/broken
	icon_state = "office_chair_green_broken"

//// ITEM VARIANTS ////

/obj/item/chair/fd
	name = "base class chair"
	desc = "Scream at the coders if you see this."
	icon = 'fd/icons/mojave_structures/chairs.dmi'
	icon_state = "metal_chair_toppled"
	custom_materials = null
	origin_type = /obj/structure/chair/fd
	break_chance = 0

// Metal Chair Items //

/obj/item/chair/fd/metal
	name = "metal chair"
	desc = "An uncomfortable chair."
	icon_state = "metal_chair_toppled"
	inhand_icon_state = "metal_chair"
	origin_type = /obj/structure/chair/fd/metal

/obj/item/chair/fd/metal/broken
	desc = "A broken chair that is somehow more comfortable than a regular one."
	icon_state = "metal_chair_broken_toppled"
	inhand_icon_state = "metal_chair_broken"
	origin_type = /obj/structure/chair/fd/metal/broken

/obj/item/chair/fd/metal/unfinished
	desc = "Without a backrest, this chair is essentially a stool with rods."
	icon_state = "metal_chair_unfinished_toppled"
	inhand_icon_state = "metal_chair_unfinished"
	origin_type = /obj/structure/chair/fd/metal/unfinished

/obj/item/chair/fd/metal/blue
	name = "metal chair"
	desc = "An uncomfortable chair."
	icon_state = "metal_chair_blue_toppled"
	inhand_icon_state = "metal_chair"
	origin_type = /obj/structure/chair/fd/metal/blue

/obj/item/chair/fd/metal/blue/broken
	desc = "A broken chair that is somehow more comfortable than a regular one."
	icon_state = "metal_chair_blue_broken_toppled"
	inhand_icon_state = "metal_chair_broken"
	origin_type = /obj/structure/chair/fd/metal/blue/broken

/obj/item/chair/fd/metal/blue/unfinished
	desc = "Without a backrest, this chair is essentially a stool with rods."
	icon_state = "metal_chair_blue_unfinished_toppled"
	inhand_icon_state = "metal_chair_unfinished"
	origin_type = /obj/structure/chair/fd/metal/blue/unfinished

/obj/item/chair/fd/metal/red
	name = "metal chair"
	desc = "An uncomfortable chair."
	icon_state = "metal_chair_red_toppled"
	inhand_icon_state = "metal_chair"
	origin_type = /obj/structure/chair/fd/metal/red

/obj/item/chair/fd/metal/red/broken
	desc = "A broken chair that is somehow more comfortable than a regular one."
	icon_state = "metal_chair_red_broken_toppled"
	inhand_icon_state = "metal_chair_broken"
	origin_type = /obj/structure/chair/fd/metal/red/broken

/obj/item/chair/fd/metal/red/unfinished
	desc = "Without a backrest, this chair is essentially a stool with rods."
	icon_state = "metal_chair_red_unfinished_toppled"
	inhand_icon_state = "metal_chair_unfinished"
	origin_type = /obj/structure/chair/fd/metal/red/unfinished

/obj/item/chair/fd/metal/folding
	name = "metal folding chair"
	desc = "Before the war, These were viewed as the lowest form of seat. Now? What's not to love. It's a chair that's easily moveable. Genius!"
	icon_state = "metal_chair_folding_toppled"
	inhand_icon_state = "metal_chair_folding"
	origin_type = /obj/structure/chair/fd/metal/folding

/obj/item/chair/fd/metal/stool
	name = "bar stool"
	desc = "A bar stool. It's help up against time rather well. Perfect to prop yourself up on after a long day."
	icon_state = "barstool_toppled"
	inhand_icon_state = "stool"
	origin_type = /obj/structure/chair/fd/metal/stool

// Office Chair Items //

/obj/item/chair/fd/metal/office
	name = "base class office chair"
	desc = "Scream at the coders if you see this."
	origin_type = /obj/structure/chair/office/fd

/obj/item/chair/fd/metal/office/red
	name = "office chair"
	desc = "Still spins, but not like this."
	icon_state = "office_chair_toppled"
	inhand_icon_state = "office_chair"
	origin_type = /obj/structure/chair/office/fd/red

/obj/item/chair/fd/metal/office/red/broken
	desc = "Hardly spins. Especially not like this."
	icon_state = "office_chair_broken_toppled"
	inhand_icon_state = "office_chair_broken"
	origin_type = /obj/structure/chair/office/fd/red/broken

/obj/item/chair/fd/metal/office/blue
	name = "office chair"
	desc = "Still spins, but not like this."
	icon_state = "office_chair_blue_toppled"
	inhand_icon_state = "office_chair_blue"
	origin_type = /obj/structure/chair/office/fd/blue

/obj/item/chair/fd/metal/office/blue/broken
	desc = "Hardly spins. Especially not like this."
	icon_state = "office_chair_blue_broken_toppled"
	inhand_icon_state = "office_chair_blue"
	origin_type = /obj/structure/chair/office/fd/blue/broken

/obj/item/chair/fd/metal/office/green
	name = "office chair"
	desc = "Still spins, but not like this."
	icon_state = "office_chair_green_toppled"
	inhand_icon_state = "office_chair_green"
	origin_type = /obj/structure/chair/office/fd/green

/obj/item/chair/fd/metal/office/green/broken
	desc = "Hardly spins. Especially not like this."
	icon_state = "office_chair_green_broken_toppled"
	inhand_icon_state = "office_chair_green"
	origin_type = /obj/structure/chair/office/fd/green/broken

// Wood Chair Items //

/obj/item/chair/fd/wood
	name = "wooden chair"
	desc = "An antique wooden chair with a small green cushion."
	icon_state = "wood_chair_toppled"
	custom_materials = list(/datum/material/wood = 2000)
	origin_type = /obj/structure/chair/fd/wood

/obj/item/chair/fd/wood/padded
	name = "padded wooden chair"
	desc = "An antique wooden chair with a large, plush red cushion"
	icon_state = "wood_chair_padded_toppled"
	inhand_icon_state = "wood_chair_padded"
	origin_type = /obj/structure/chair/fd/wood/padded

// Misc Chair Items //

/obj/item/chair/fd/plastic
	name = "plastic chair"
	desc = "The most generic chair known to pre-war man."
	w_class = WEIGHT_CLASS_NORMAL
	force = 7
	throw_range = 5
	break_chance = 5
	icon_state = "plastic_chair_toppled"
	origin_type = /obj/structure/chair/fd/overlaypickup/plastic

/obj/structure/chair/comfy/fd/diner
	name = "diner seat"
	desc = "A nice padded diner style seat. A fantastic place to rest your feet."
	icon_state = "diner_chair"
