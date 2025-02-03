#define isnpcbeacon(A) (istype(A, /obj/effect/landmark/npcbeacon))

/obj/effect/landmark/npcbeacon
	icon = 'fd/icons/landmarks_static.dmi'
	name = "NPC beacon"
	var/directionwalk

/obj/effect/landmark/npc_spawn_point

/obj/effect/landmark/npc_spawn_point/Initialize()
	. = ..()
	GLOB.npc_spawn_points |= src

/obj/effect/landmark/npcbeacon/directed
	name = "NPC traffic"
	icon_state = "npc"
	icon = 'fd/icons/landmarks_static.dmi'

/obj/effect/landmark/npcbeacon/directed/Initialize()
	..()
	directionwalk = dir

/obj/effect/landmark/npcwall
	icon = 'fd/icons/landmarks_static.dmi'
	name = "NPC Wall"
	icon_state = "x"

/obj/effect/landmark/npcactivity
	icon = 'fd/icons/landmarks_static.dmi'
	name = "NPC Activity"
	icon_state = "bullets"

/obj/effect/landmark/npcability
	icon = 'fd/icons/landmarks_static.dmi'
	name = "NPC Ability"
	icon_state = "ability"

/obj/effect/landmark/npcactivity/Initialize()
	. = ..()
	GLOB.npc_activities += src

/mob/living/simple_animal/npc
	var/organschecklist = 0

/mob/living/simple_animal/npc/Initialize()
	..()
	GLOB.npc_list += src
	GLOB.alive_npc_list += src

	if(should_be_randomized)
		faction_current = pick(faction_outfit)
		random_outfit = pick(1,2,3,4,5)
		icon_state = "[faction_current]_[random_outfit]"
		icon_living = "[faction_current]_[random_outfit]"
		icon_dead = "[icon_state]_dead"
	add_movespeed_modifier(/datum/movespeed_modifier/npc)

/mob/living/simple_animal/npc/death()
	GLOB.alive_npc_list -= src
	SShumannpcpool.npclost()
	walk(src,0)
	..()

/mob/living/simple_animal/npc/Destroy()
	..()
	GLOB.npc_list -= src
	GLOB.alive_npc_list -= src
	SShumannpcpool.npclost()

/mob/living/simple_animal/npc/Life()
	if(stat == DEAD)
		return

/mob/living/simple_animal/npc/proc/CreateWay(var/direction)
	var/turf/location = get_turf(src)
	for(var/distance = 1 to 50)
		location = get_step(location, direction)
		if(iswallturf(location))
			return location
		for(var/atom/A in location)
			if(A.density && !istype(A, /obj/structure))
				return location
			if(istype(A, /obj/effect/landmark/npcwall))
				return get_step_towards(location, get_turf(src))
			if(isnpcbeacon(A) && prob(50))
				stopturf = 1
				return get_step(location, direction)

/mob/living/simple_animal/npc/proc/ChoosePath()
	if(!old_movement)
		var/list/possible_list = list()
		for(var/obj/effect/landmark/npcactivity/N in GLOB.npc_activities)
			if(get_dist(src, N) < 64)
				var/turf/T = get_step(N, turn(get_dir(src, N), 180))
				var/obj/effect/landmark/npcability/A = locate() in T
				if(A)
					if(N.x > x-3 && N.x < x+3)
						possible_list += N
					if(N.y > y-3 && N.y < y+3)
						possible_list += N
		if(!length(possible_list))
			var/atom/shitshit
			for(var/obj/effect/landmark/npcactivity/N in GLOB.npc_activities)
				if(N)
					if(!shitshit)
						shitshit = N
					if(get_dist(src, N) > 1 && get_dist(src, N) < get_dist(src, shitshit))
						shitshit = N
			if(shitshit)
				return shitshit
			else
				return pick(GLOB.npc_activities)

		return pick(possible_list)
	else
		var/turf/north_steps = CreateWay(NORTH)
		var/turf/south_steps = CreateWay(SOUTH)
		var/turf/west_steps = CreateWay(WEST)
		var/turf/east_steps = CreateWay(EAST)

		if(dir == NORTH || dir == SOUTH)
			if(get_dist(src, west_steps) >= 7 && get_dist(src, east_steps) >= 7)
				return(pick(west_steps, east_steps))
			if(get_dist(src, west_steps) > get_dist(src, east_steps))
				if(prob(75))
					return west_steps
			else if(get_dist(src, east_steps) > get_dist(src, west_steps))
				if(prob(75))
					return east_steps
			else
				if(dir == NORTH)
					return pick(west_steps, east_steps, south_steps)
				else
					return pick(west_steps, east_steps, north_steps)

		if(dir == WEST || dir == EAST)
			if(get_dist(src, north_steps) >= 7 && get_dist(src, south_steps) >= 7)
				return pick(north_steps, south_steps)
			if(get_dist(src, north_steps) > get_dist(src, south_steps))
				if(prob(75))
					return north_steps
			else if(get_dist(src, south_steps) > get_dist(src, north_steps))
				if(prob(75))
					return south_steps
			else
				if(dir == WEST)
					return pick(north_steps, south_steps, east_steps)
				else
					return pick(north_steps, south_steps, west_steps)

/mob/living/simple_animal/npc/proc/CheckMove(var/hardlock = FALSE)
	if(stat >= HARD_CRIT)
		return TRUE
	if(last_grab+15 > world.time && !hardlock)
		return TRUE
	if(key)
		return TRUE
	if(IsSleeping())
		return TRUE
	if(IsUnconscious())
		return TRUE
	if(IsParalyzed())
		return TRUE
	if(IsKnockdown())
		return TRUE
	if(IsStun())
		return TRUE
	if(HAS_TRAIT(src, TRAIT_RESTRAINED))
		return TRUE
	if(is_talking)
		return TRUE
	if(pulledby && !hardlock)
		if(prob(30))
			resist()
			return TRUE
		else
			return TRUE
	return FALSE


/mob/living/simple_animal/npc/proc/route_optimisation()
	var/sosat = FALSE
	for(var/mob/M in viewers(7, src))
		if(M.client)
			sosat = TRUE
	if(sosat)
		return FALSE
	return TRUE

/mob/living/simple_animal/npc
	var/client_cleaned = FALSE

/mob/living/simple_animal/npc/handle_automated_movement()
	if(client)
		if(!client_cleaned)
			remove_movespeed_modifier(/datum/movespeed_modifier/npc)
			client_cleaned = TRUE
		return
	if(CheckMove())
		return
	if(!staying)
		lifespan = lifespan+1
	if(pulledby)
		if(prob(25))
			Aggro(pulledby, TRUE)

	if(!walktarget)
		stopturf = rand(1, 2)
		walktarget = ChoosePath()
		face_atom(walktarget)

	if(isturf(loc))
		if(danger_source)
			a_intent = INTENT_HARM
			if(m_intent == MOVE_INTENT_WALK)
				toggle_move_intent(src)
			var/reqsteps = round((SShumannpcpool.next_fire-world.time)/total_multiplicative_slowdown())
			set_glide_size(DELAY_TO_GLIDE_SIZE(total_multiplicative_slowdown()))
			walk_away(src, danger_source, reqsteps, total_multiplicative_slowdown())

			if(last_danger_meet+300 <= world.time)
				danger_source = null
				a_intent = INTENT_HELP
		else if(less_danger)
			var/reqsteps = round((SShumannpcpool.next_fire-world.time)/total_multiplicative_slowdown())
			set_glide_size(DELAY_TO_GLIDE_SIZE(total_multiplicative_slowdown()))
			walk_away(src, less_danger, reqsteps, total_multiplicative_slowdown())
			if(prob(25))
				emote("scream")
		else if(walktarget && !staying)
			if(prob(25))
				toggle_move_intent(src)
			var/reqsteps = round((SShumannpcpool.next_fire-world.time)/total_multiplicative_slowdown())
			set_glide_size(DELAY_TO_GLIDE_SIZE(total_multiplicative_slowdown()))
			walk_to(src, walktarget, reqsteps, total_multiplicative_slowdown())

/mob/living/simple_animal/npc/handle_automated_action()
	if(CheckMove())
		return
	if(pulledby)
		if(stat == CONSCIOUS)
			if(prob(25))
				Aggro(pulledby, TRUE)
	if(get_dist(danger_source, src) < 7)
		last_danger_meet = world.time
	if(on_fire)
		resist_fire()
	if(!staying)
		if(!walktarget)
			walktarget = ChoosePath()
		if(loc == tupik_loc)
			tupik_steps += 1
		if(loc != tupik_loc)
			tupik_loc = loc
			tupik_steps = 0
		if(tupik_steps > 3)
			var/turf/T = get_step(src, pick(NORTH, SOUTH, WEST, EAST))
			face_atom(T)
			step_to(src,T,0)
			if(walktarget && !old_movement)
				if(route_optimisation())
					forceMove(get_turf(walktarget))
