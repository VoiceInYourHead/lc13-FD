/datum/attribute/fortitude
	name = STRENGTH_STAT
	desc = "То, что в первую очередь приходит на помощь, когда диалог не задался. Поможет открыть то, что открываться не хочет или поднять то, что в целом поднимать не стоило бы."
	affected_stats = list("Max Health")
	initial_stat_value = DEFAULT_HUMAN_MAX_HEALTH
	level_limit = 80

/datum/attribute/fortitude/get_printed_level_bonus()
	return round(level * STRENGTH_MOD) + initial_stat_value

/datum/attribute/fortitude/on_update(mob/living/carbon/user)
	if(!istype(user))
		return FALSE
	user.death_threshold = HEALTH_THRESHOLD_DEAD - round((level + level_buff) * 0.5)
	user.hardcrit_threshold = HEALTH_THRESHOLD_FULLCRIT - round((level + level_buff) * 0.25)
	return TRUE
