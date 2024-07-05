/obj/structure/fd/limbus_corridor
	name = "Strange door"
	desc = "Some veird looking door."
	icon = 'fd/icons/limbus_entrance.dmi'
	icon_state = "airlock"
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.
	anchored = TRUE
	density = FALSE
	opacity = FALSE

	var/static/list/AllLimbusTeleporters

/obj/structure/fd/limbus_corridor/Initialize()
	. = ..()
	LAZYADD(AllLimbusTeleporters, src)

/obj/structure/fd/limbus_corridor/Destroy()
	LAZYREMOVE(AllLimbusTeleporters, src)
	return ..()

/obj/structure/fd/limbus_corridor/attack_hand(mob/living/AM)
	if(!ismob(AM))
		return
	if(!id_target)
		return

	for(var/obj/structure/fd/limbus_corridor/BT in AllLimbusTeleporters)
		if(BT.id == src.id_target)
			icon_state = "airlockactive"
			if(do_after(AM, 10 SECONDS, target = src))
				AM.forceMove(BT.loc) //Teleport to location with correct id.
