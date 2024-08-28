/mob/living
	var/flame_stacks = 0
	var/max_flame_stacks = 20
	var/radiance = 0
	var/in_search = FALSE

/mob/living/Life()
	..()
	if(radiance > 0)
		addtimer(CALLBACK(src, PROC_REF(remove_radiance),), 10 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

	if(flame_stacks > 5) //so we will have atleast something in store, but not much
		addtimer(CALLBACK(src, PROC_REF(remove_flames),), 30 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

/mob/living/proc/remove_radiance()
	radiance -= 1

/mob/living/proc/remove_flames()
	flame_stacks -= 1
