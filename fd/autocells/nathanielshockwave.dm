
/datum/automata_cell/lanceshockwave
	neighbor_type = NEIGHBORS_CARDINAL

	// Strength of the cell
	var/strength = 5
	// How much strength the cell loses every propagation
	var/strength_dropoff = 2
	// See on_turf_entered
//	var/list/atom/exploded_atoms = list()
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


/datum/automata_cell/lanceshockwave/proc/should_die()
	if(strength <= 0)
		return TRUE
	return FALSE

/datum/automata_cell/lanceshockwave/proc/on_turf_entered(atom/movable/A)
/*	// Once is enough
	if(A in exploded_atoms)
		return

	exploded_atoms += A
*/
	if(A.gc_destroyed)
		return

	INVOKE_ASYNC(A, /atom.proc/explosion_throw, strength, null)

/datum/automata_cell/lanceshockwave/update_state(list/turf/neighbors)
	if(should_die())
		death()
		return

	INVOKE_ASYNC(in_turf, /atom.proc/explosion_throw, strength, direction)
	for(var/atom/A in in_turf)
//		if(A in exploded_atoms)
// 			continue
		if(A.gc_destroyed)
			continue
		INVOKE_ASYNC(A, /atom.proc/explosion_throw, strength, direction)
//		exploded_atoms += A


	// Propagate to cardinals directions
	var/list/to_spread = GLOB.cardinals.Copy()
	for(var/datum/automata_cell/lanceshockwave/C in neighbors)
		to_spread -= get_dir(in_turf, C.in_turf)

	for(var/dir in to_spread)
		var/turf/T = get_step(in_turf, dir)

		if(!T)
			continue

		if(T.is_blocked_turf(TRUE))
			continue

		var/datum/automata_cell/lanceshockwave/C = propagate(dir)
		// Make it weaker
		C.strength = strength - strength_dropoff
		C.direction = dir

/obj/effect/particle_effect/shockwave
	name = "shockwave"
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	anchored = TRUE
	mouse_opacity = 0
	layer = FLY_LAYER


/atom/proc/explosion_throw(severity, direction, scatter_multiplier = 1)
	return

/mob/explosion_throw(severity, direction, scatter_multiplier)
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
