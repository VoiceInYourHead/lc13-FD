/datum/attribute/justice
	name = REFLEXES_STAT
	desc = "Скорость и ловкость персонажа. Влияет на то, насколько хорошо вы будете скакать под пулями и как быстро сможете выполнить ту или иную задачу."
	affected_stats = list("Power Modifier") //todo : split into Melee Strength and Movement Speed
	level_limit = 80

/datum/attribute/justice/on_update(mob/living/carbon/user)
	if(!istype(user))
		return FALSE
	var/slowdown = -(get_modified_level() / REFLEXES_MOVESPEED_DIVISER)
	user.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/reflex_stat, multiplicative_slowdown = slowdown)
	return TRUE
