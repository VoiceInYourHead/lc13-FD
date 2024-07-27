/datum/attribute/luck
	name = LUCK_STAT
	desc = "Такая иллюзорная, но в то же время вполне реальная удача. Не даст вам знаний, но поможет вам в трудную минуту."
	level_limit = 100

/datum/attribute/luck/on_update(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE
	var/luck = get_attribute_level(user, LUCK_STAT)
	user.reroll = round(luck / 20)
	return TRUE
