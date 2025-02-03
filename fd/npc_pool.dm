#define FIRE_PRIORITY_VERYLOW		10

GLOBAL_LIST_EMPTY(npc_spawn_points)
GLOBAL_LIST_EMPTY(npc_list)
GLOBAL_LIST_EMPTY(alive_npc_list)
GLOBAL_LIST_EMPTY(npc_activities)

SUBSYSTEM_DEF(humannpcpool)
	name = "Human NPC Pool"
	flags = SS_POST_FIRE_TIMING|SS_NO_INIT|SS_BACKGROUND
	priority = FIRE_PRIORITY_VERYLOW
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 4 SECONDS

	var/list/currentrun = list()
	var/npc_max = 30

/datum/controller/subsystem/humannpcpool/stat_entry(msg)
	var/list/activelist = GLOB.npc_list
	var/list/living_list = GLOB.alive_npc_list
	msg = "NPCS:[length(activelist)] Living: [length(living_list)]"
	return ..()

/datum/controller/subsystem/humannpcpool/fire(resumed = FALSE)

	if (!resumed)
		var/list/activelist = GLOB.npc_list
		src.currentrun = activelist.Copy()

	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/mob/living/simple_animal/npc/NPC = currentrun[currentrun.len]
		--currentrun.len

		if (QDELETED(NPC))
			GLOB.npc_list -= NPC
			GLOB.alive_npc_list -= NPC
			log_world("Found a null in npc list!")
			continue

		if(MC_TICK_CHECK)
			return
		NPC.handle_automated_movement()

/datum/controller/subsystem/humannpcpool/proc/npclost()
	while(length(GLOB.alive_npc_list) < npc_max)
		var/atom/kal = pick(GLOB.npc_spawn_points)
		var/NEPIS = pick(/mob/living/simple_animal/npc)
		new NEPIS(get_turf(kal))

SUBSYSTEM_DEF(actionnpcpool)
	name = "Action NPC Pool"
	flags = SS_POST_FIRE_TIMING|SS_NO_INIT|SS_BACKGROUND
	priority = FIRE_PRIORITY_VERYLOW
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 7 SECONDS

	var/list/currentrun = list()

/datum/controller/subsystem/actionnpcpool/stat_entry(msg)
	var/list/activelist = GLOB.npc_list
	var/list/living_list = GLOB.alive_npc_list
	msg = "NPCS:[length(activelist)] Living: [length(living_list)]"
	return ..()

/datum/controller/subsystem/actionnpcpool/fire(resumed = FALSE)

	if (!resumed)
		var/list/activelist = GLOB.npc_list
		src.currentrun = activelist.Copy()

	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/mob/living/simple_animal/npc/NPC = currentrun[currentrun.len]
		--currentrun.len

		if (QDELETED(NPC))
			GLOB.npc_list -= NPC
			GLOB.alive_npc_list -= NPC
			log_world("Found a null in npc list!")
			continue

		if(MC_TICK_CHECK)
			return
		NPC.handle_automated_action()
