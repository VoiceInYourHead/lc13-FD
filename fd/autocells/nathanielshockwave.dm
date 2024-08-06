
/datum/automata_cell/lanceshockwave
	neighbor_type = NEIGHBORS_CARDINAL

	// Strength of the cell
	var/power = 500
	// How much strength the cell loses every propagation
	var/power_falloff = 200
	// See on_turf_entered
	var/list/atom/exploded_atoms = list()
	// Which direction is the explosion traveling?
	// Note that this will be null for the epicenter
	var/direction = null
	var/duration = 15
	// We need to count it
	var/timerid

	var/obj/effect/particle_effect/shockwave/shockwave = null

/datum/automata_cell/lanceshockwave/birth()
	shockwave = new(in_turf)
	timerid = QDEL_IN(src, duration)

/datum/automata_cell/lanceshockwave/death()
	if(shockwave)
		deltimer(timerid)
		qdel(shockwave)


/datum/automata_cell/lanceshockwave/proc/on_turf_entered(atom/movable/A)
// Once is enough
	if(A in exploded_atoms)
		return

	exploded_atoms += A

	if(A.gc_destroyed)
		return

	INVOKE_ASYNC(A, /mob.proc/explosion_throw, power, null)

/datum/automata_cell/lanceshockwave/update_state(list/turf/neighbors)

	// Throw stuff
//	INVOKE_ASYNC(in_turf, /mob.proc/explosion_throw, power, direction)
//	message_admins("update_state, [in_turf] [power], [direction] ")
	for(var/atom/A in in_turf)
		if(A in exploded_atoms)
			continue
		if(A.gc_destroyed)
			continue
		INVOKE_ASYNC(A, /mob.proc/explosion_throw, power, direction)
		exploded_atoms += A

	if(power <= 0)
		death()
		return

	// Propagate the explosion
	var/list/to_spread = get_propagation_dirs()
	for(var/dir in to_spread)
		// Diagonals are longer, that should be reflected in the power falloff
		var/dir_falloff = 1
		if(isnull(direction))
			dir_falloff = 0

		var/new_power = power - (power_falloff * dir_falloff)

		// Explosion is too weak to continue
		if(new_power <= 0)
			continue

		var/new_falloff = power_falloff
		var/datum/automata_cell/lanceshockwave/E = propagate(dir)
		if(E)
			E.power = new_power
			E.power_falloff = new_falloff

			// Set the direction the explosion is traveling in
			E.direction = dir

			setup_new_cell(E)

	// We've done our duty, now die pls
	qdel(src)

/datum/automata_cell/lanceshockwave/proc/setup_new_cell(datum/automata_cell/lanceshockwave/E)
//	if(E.shockwave)
//		E.shockwave.alpha = E.power
	return

/datum/automata_cell/lanceshockwave/propagate(dir)
	if(!dir)
		return

	var/turf/T = get_step(in_turf, dir)
	if(QDELETED(T))
		return

	if(T.is_blocked_turf(TRUE))
		return

	// Create the new cell
	var/datum/automata_cell/lanceshockwave/C = new type(T)
	return C

// Get a list of all directions the explosion should propagate to before dying
/datum/automata_cell/lanceshockwave/proc/get_propagation_dirs()
	var/list/propagation_dirs = list()

	// If the cell is the epicenter, propagate in all directions
	if(isnull(direction))
		return GLOB.alldirs

	if(direction in GLOB.cardinals)
		propagation_dirs += list(direction, turn(direction, 45), turn(direction, -45))
	else
		propagation_dirs += direction

	return propagation_dirs


// ASSETS

/obj/effect/particle_effect/shockwave
	name = "shockwave"
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	anchored = TRUE
	mouse_opacity = 0
	layer = FLY_LAYER

/*
/atom/proc/explosion_throw(severity, direction, scatter_multiplier = 1)
	message_admins("Explosion Throw, ATOM, [src] INITIALIZED! SUKA BLYAT! [severity], [direction], [scatter_multiplier] ")
	return
*/
/mob/proc/explosion_throw(severity, direction, scatter_multiplier)
	if(anchored)
		return

	if(!istype(src.loc, /turf))
		return

	var/weight = 1
	var/range = round( severity/weight * 0.02 ,1)
	if(!direction)
		range = round( 2*range/3 ,1)
		direction = pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)

	if(range <= 0)
		return

	var/speed = max(range*1.5, 4)
	var/atom/target = get_ranged_target_turf(src, direction, range)

	var/spin = 0

	if(range > 1)
		spin = 1

	if(range >= 2)
		var/scatter = range/4
		var/scatter_x = rand(-scatter,scatter)
		var/scatter_y = rand(-scatter,scatter)
		target = locate(target.x + round( scatter_x , 1),target.y + round( scatter_y , 1),target.z) //Locate an adjacent turf.

	//time for the explosion to destroy windows, walls, etc which might be in the way
	INVOKE_ASYNC(src, /atom/movable.proc/throw_at, target, range, speed, null, spin)
