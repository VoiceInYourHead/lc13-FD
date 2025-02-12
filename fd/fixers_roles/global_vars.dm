
/obj/
	var/knowledge = 0

/obj/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/ego_weapon/city/dieci_key))
		var/obj/item/ego_weapon/city/dieci_key/prism = I
		if(knowledge <= 0)
			to_chat(user, span_notice("Здесь нечего изучать!"))
			return FALSE
		if(prism.combat_mode)
			to_chat(user, span_notice("Учёбе не место в драке! Твой ключ в боевом режиме!"))
			return FALSE
		if(do_after(user, 5 SECONDS, src))
			prism.knowledge_stored += knowledge
			knowledge = 0

	. = ..()

/mob/living
	var/flame_stacks = 0
	var/max_flame_stacks = 20
	var/radiance = 0
	var/in_search = FALSE
	var/cooldown_radiance = 0
	var/cooldown_flame = 0

	var/radiance_window
	var/radiance_effect
	var/radiance_timeout = FALSE

/mob/living/Life()
	..()

	if(cooldown_radiance > 0)
		cooldown_radiance -= 1

	if(cooldown_flame > 0)
		cooldown_flame -= 1

	if(!radiance_window && radiance_effect)
		cut_overlay(radiance_effect)

	if(radiance >= 5 && !radiance_window && !radiance_timeout)
		radiance_effect = image('fd/icons/wod_assets/icons.dmi', "presence", pixel_y = 16)
		add_overlay(radiance_effect)
		radiance_window = TRUE
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob, remove_movespeed_modifier), /datum/movespeed_modifier/blinded), 10 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
		if(do_after(src, 10 SECONDS, timed_action_flags = (IGNORE_USER_LOC_CHANGE|IGNORE_TARGET_LOC_CHANGE|IGNORE_INCAPACITATED|IGNORE_HELD_ITEM)))
			cut_overlay(radiance_effect)
			radiance_window = FALSE
			radiance_timeout = TRUE
			addtimer(CALLBACK(src, PROC_REF(radiance_timeout),), 10 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

	if(radiance > 0 && cooldown_radiance == 0 && !radiance_window)
		remove_radiance()

	if(flame_stacks > 5 && cooldown_flame == 0) //so we will have atleast something in store, but not much
		remove_flames()

/mob/living/proc/radiance_timeout()
	radiance_timeout = FALSE

/mob/living/proc/remove_radiance()
	cooldown_radiance += 10
	radiance -= 1

/mob/living/proc/remove_flames()
	cooldown_flame += 30
	flame_stacks -= 1
