/datum/attribute/prudence
	name = WILLPOWER_STAT
	desc = "Сила воли, духа - называйте как хотите. Олицетворяет то, насколько же вы устойчивы к ужасам Города и способны ли принимать аморальные решения, идущие вразрез с самим понятием человечности."
	affected_stats = list("Max Sanity")
	initial_stat_value = DEFAULT_HUMAN_MAX_SANITY
	level_limit = 80

/datum/attribute/prudence/get_printed_level_bonus()
	return round(level * WILLPOWER_MOD) + initial_stat_value
