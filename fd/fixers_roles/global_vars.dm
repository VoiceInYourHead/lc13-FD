/mob/living
	var/flame_stacks = 0
	var/max_flame_stacks = 20
	var/radiance = 0
	var/in_search = FALSE
	var/cooldown_radiance = 0
	var/cooldown_flame = 0

/mob/living/Life()
	..()

	if(cooldown_radiance > 0)
		cooldown_radiance -= 1

	if(cooldown_flame > 0)
		cooldown_flame -= 1

	if(radiance > 0 && cooldown_radiance == 0)
		remove_radiance()

	if(flame_stacks > 5 && cooldown_flame == 0) //so we will have atleast something in store, but not much
		remove_flames()

/mob/living/proc/remove_radiance()
	cooldown_radiance += 10
	radiance -= 1

/mob/living/proc/remove_flames()
	cooldown_flame += 30
	flame_stacks -= 1
