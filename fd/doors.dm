/atom
	//FD edit; flags specifically used for PM13 content
	var/fd_flags_1 = NONE

///Setter for the `density` variable to append behavior related to its changing.
/atom/proc/set_density(new_value)
	SHOULD_CALL_PARENT(TRUE)
	if(density == new_value)
		return
	SEND_SIGNAL(src, COMSIG_ATOM_SET_DENSITY, new_value)
	. = density
	density = new_value

/// The equivalent of the standard version of [/obj/item/proc/attack] but for non mob targets.
/obj/item/proc/attack_atom(obj/attacked_atom, mob/living/user, params)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_OBJ, attacked_atom, user) & COMPONENT_CANCEL_ATTACK_CHAIN)
		return
	if(item_flags & NOBLUDGEON)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	user.do_attack_animation(attacked_atom)
	attacked_atom.attacked_by(src, user)

/obj/machinery/door/unpowered/fd
	icon = 'fd/icons/mojave_structures/doors.dmi'
	name = "base state FD door"
	pixel_x = -16
	pixel_y = -8
	layer = ABOVE_MOB_LAYER
	density = TRUE
	assemblytype = null
	can_crush = FALSE
	spark_system = null
	max_integrity = 1000
	armor = list(MELEE = 50, BULLET = 80, LASER = 90, ENERGY = 90, BOMB = 30, BIO = 100, FIRE = 80, ACID = 100)
	damage_deflection = 15
	fd_flags_1 = LOCKABLE_1
	var/door_type = null
	var/solidity = SOLID
	var/frametype = "metal"
	var/opensound = 'sound/machines/door_open.ogg'
	var/closesound = 'sound/machines/door_close.ogg'
	//used for attack checks
	var/open = FALSE
	//used for damage overlays
	var/has_damage_overlay = TRUE
	//used for mirrored overlays
	var/mirrored = FALSE

/obj/machinery/door/unpowered/fd/Initialize()
	. = ..()
	if(dir == NORTH)
		pixel_y = 8

	if(dir == SOUTH)
		pixel_y = -8

	if(dir == EAST)
		pixel_x = -3
		pixel_y = 16
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

	if(dir == WEST)
		pixel_x = -28
		pixel_y = 16
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

/obj/machinery/door/unpowered/fd/update_overlays()
	. = ..()

	cut_overlays()

	if(dir == EAST)
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

	if(dir == WEST)
		add_overlay(image(icon,icon_state="[frametype]_frame_vertical_overlay", layer = ABOVE_ALL_MOB_LAYER))

	if(has_damage_overlay) //stunning code, code of the year
		switch(open)
			if(TRUE)
				switch(mirrored)
					if(TRUE)
						switch(dir)
							if(EAST)
								if(obj_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(obj_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(obj_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
							if(WEST)
								if(obj_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(obj_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(obj_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
					if(FALSE)
						switch(dir)
							if(EAST)
								if(obj_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(obj_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
								else if(obj_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = -17, pixel_y = -2))
							if(WEST)
								if(obj_integrity < (0.25 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(obj_integrity < (0.50 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
								else if(obj_integrity < (0.75 * max_integrity))
									cut_overlays()
									add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_x = 17, pixel_y = -2))
			if(FALSE)
				switch(dir)
					if(NORTH)
						if(obj_integrity < (0.25 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER, pixel_y = -8))
						else if(obj_integrity < (0.50 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER, pixel_y = -8))
						else if(obj_integrity < (0.75 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER, pixel_y = -8))
					if(SOUTH)
						if(obj_integrity < (0.25 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_3", layer = FLOAT_LAYER))
						else if(obj_integrity < (0.50 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_2", layer = FLOAT_LAYER))
						else if(obj_integrity < (0.75 * max_integrity))
							cut_overlays()
							add_overlay(image(icon, icon_state = "damage_closed_1", layer = FLOAT_LAYER))


/obj/machinery/door/unpowered/fd/open()
	if(!density)
		return TRUE
	if(operating)
		return
	operating = TRUE
	set_opacity(0)
	set_density(FALSE)
	flags_1 &= ~PREVENT_CLICK_UNDER_1
	open = TRUE
	update_icon()
	set_opacity(0)
	operating = FALSE
	update_freelook_sight()
	playsound(src, (opensound), 50, TRUE)
	return TRUE

/obj/machinery/door/unpowered/fd/close()
	if(density)
		return TRUE
	if(operating)
		return
	if(safe)
		for(var/atom/movable/M in get_turf(src))
			if(M.density && M != src) //something is blocking the door
				return
	operating = TRUE
	set_density(TRUE)
	flags_1 |= PREVENT_CLICK_UNDER_1
	open = FALSE
	update_icon()
	if(visible && !glass)
		set_opacity(1)
	operating = FALSE
	update_freelook_sight()
	playsound(src, (closesound), 50, TRUE)
	return TRUE

/obj/machinery/door/unpowered/fd/update_icon(updates)
	. = ..()
	if(density)
		icon_state = "[door_type]_closed"
	else
		icon_state = "[door_type]_open"

/obj/machinery/door/unpowered/fd/try_to_activate_door(mob/living/M)
	add_fingerprint(M)
	if(density)
		open()
	else
		close()
	return TRUE

/obj/machinery/door/unpowered/fd/attack_hand(mob/living/M)
	if(.)
		return
	if(do_after(M, 0.5 SECONDS, interaction_key = DOAFTER_SOURCE_DOORS))
		try_to_activate_door(M)

/obj/machinery/door/unpowered/fd/attackby(obj/item/I, mob/living/M, params)
	. = ..()
	if(!open)
		update_icon()
		return ((obj_flags & CAN_BE_HIT) && I.attack_atom(src, M, params))

/obj/machinery/door/unpowered/fd/do_animate(animation)
	return

/obj/machinery/door/unpowered/fd/Bumped(atom/movable/AM)
	return

/obj/machinery/door/unpowered/fd/metal
	name = "metal door"
	icon_state = "metal_closed"
	door_type = "metal"
	max_integrity = 2000 //its metal
	armor = list(MELEE = 80, BULLET = 90, LASER = 60, ENERGY = 90, BOMB = 30, BIO = 100, FIRE = 80, ACID = 100)
	damage_deflection = 25

/obj/machinery/door/unpowered/fd/metal/deconstruct(disassembled = TRUE)
	qdel(src)

/obj/machinery/door/unpowered/fd/metal/mirrored
	icon_state = "metal_mirrored_closed"
	door_type = "metal_mirrored"
	mirrored = TRUE

/obj/machinery/door/unpowered/fd/metal/alt
	icon_state = "metal_alt_closed"
	door_type = "metal_alt"

/obj/machinery/door/unpowered/fd/metal/mirrored/alt
	icon_state = "metal_alt_mirrored_closed"
	door_type = "metal_alt_mirrored"

/obj/machinery/door/unpowered/fd/metal/red
	icon_state = "metal_red_closed"
	door_type = "metal_red"

/obj/machinery/door/unpowered/fd/metal/mirrored/red
	icon_state = "metal_red_mirrored_closed"
	door_type = "metal_red_mirrored"

// Wood doors //
/obj/machinery/door/unpowered/fd/wood
	name = "wood door"
	icon_state = "wood_closed"
	door_type = "wood"
	frametype = "wood"

/obj/machinery/door/unpowered/fd/wood/deconstruct(disassembled = TRUE)
	qdel(src)

/obj/machinery/door/unpowered/fd/wood/mirrored
	icon_state = "wood_mirrored_closed"
	door_type = "wood_mirrored"
	mirrored = TRUE

/obj/machinery/door/unpowered/fd/wood/red
	icon_state = "wood_red_closed"
	door_type = "wood_red"

/obj/machinery/door/unpowered/fd/wood/mirrored/red
	icon_state = "wood_red_mirrored_closed"
	door_type = "wood_red_mirrored"

/obj/machinery/door/unpowered/fd/wood/blue
	icon_state = "wood_blue_closed"
	door_type = "wood_blue"

/obj/machinery/door/unpowered/fd/wood/mirrored/blue
	icon_state = "wood_blue_mirrored_closed"
	door_type = "wood_blue_mirrored"

/obj/machinery/door/unpowered/fd/wood/green
	icon_state = "wood_green_closed"
	door_type = "wood_green"

/obj/machinery/door/unpowered/fd/wood/mirrored/green
	icon_state = "wood_green_mirrored_closed"
	door_type = "wood_green_mirrored"

/obj/machinery/door/unpowered/fd/wood/white
	icon_state = "wood_white_closed"
	door_type = "wood_white"

/obj/machinery/door/unpowered/fd/wood/mirrored/white
	icon_state = "wood_white_mirrored_closed"
	door_type = "wood_white_mirrored"

// Window/Open doors //

/obj/machinery/door/unpowered/fd/seethrough
	name = "generic FD see-through door"
	glass = TRUE
	opacity = 0
	var/passthrough_chance = 80

/obj/machinery/door/unpowered/fd/seethrough/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(locate(/obj/machinery/door/unpowered/fd/seethrough) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob((passthrough_chance)))
			return TRUE
		return FALSE

/obj/machinery/door/unpowered/fd/seethrough/metal
	name = "metal door"
	icon_state = "metal_window_closed"
	door_type = "metal_window"
	passthrough_chance = 40 //Small window!
	max_integrity = 1500 //its metal
	armor = list(MELEE = 80, BULLET = 90, LASER = 60, ENERGY = 90, BOMB = 30, BIO = 100, FIRE = 80, ACID = 100)
	damage_deflection = 25

/obj/machinery/door/unpowered/fd/seethrough/metal/deconstruct(disassembled = TRUE)
	qdel(src)

/obj/machinery/door/unpowered/fd/seethrough/mirrored/metal
	name = "metal door"
	icon_state = "metal_window_mirrored_closed"
	door_type = "metal_window_mirrored"
	mirrored = TRUE

/obj/machinery/door/unpowered/fd/seethrough/bar
	name = "barred door"
	icon_state = "metal_bar_closed"
	door_type = "metal_bar"
	has_damage_overlay = FALSE

/obj/machinery/door/unpowered/fd/seethrough/mirrored/bar
	name = "barred door"
	icon_state = "metal_bar_mirrored_closed"
	door_type = "metal_bar_mirrored"
	has_damage_overlay = FALSE

/obj/machinery/door/unpowered/fd/seethrough/grate
	name = "grated door"
	icon_state = "metal_grate_closed"
	door_type = "metal_grate"
	has_damage_overlay = FALSE

/obj/machinery/door/unpowered/fd/seethrough/mirrored/grate
	name = "grated door"
	icon_state = "metal_grate_mirrored_closed"
	door_type = "metal_grate_mirrored"
	has_damage_overlay = FALSE

/obj/machinery/door/airlock/fd
	name = "mechanical door"
	desc = "The very pinnacle of door technology. Even after all this time, still usually reliably opens and closes! Don't stick your head in it."
	icon = 'fd/icons/airlocks/generic.dmi'
	overlays_file = 'fd/icons/airlocks/overlays.dmi'
	normal_integrity = 800 // big metal door
	armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, FIRE = 100, ACID = 100)
	security_level = 1
	layer = 4.5
	closingLayer = CLOSED_DOOR_LAYER
	hackProof = TRUE
	fd_flags_1 = LOCKABLE_1
	doorOpen = 'fd/sound/doorblast_open.ogg'
	doorClose = 'fd/sound/doorblast_close.ogg'
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/door/airlock/fd/Bumped(atom/movable/AM)
	return

//TEMP AIRLOCK LOCKING (will be replaced by hacking)
/obj/machinery/door/airlock/fd/attackby(obj/item/I, mob/living/M, params)
	. = ..()
	if(locked && !(M.a_intent = INTENT_HARM))
		to_chat(M, "<span class='warning'> The [name] is locked.</span>")
		playsound(src, 'fd/sound/door_locked.ogg', 50, TRUE)
		return

/obj/machinery/door/airlock/fd/attack_hand(mob/living/M)
	if(locked)
		to_chat(M, "<span class='warning'> The [name] is locked.</span>")
		playsound(src, 'fd/sound/door_locked.ogg', 50, TRUE)
		return
	if(.)
		return
	if(flags_1 & LOCKABLE_1)
		to_chat(M, span_warning("The [name] is locked."))
		playsound(src, 'fd/sound/door_locked.ogg', 50, TRUE)
		return
	. = ..()

/obj/machinery/door/airlock/fd/screwdriver_act(mob/living/user, obj/item/tool)
	return
