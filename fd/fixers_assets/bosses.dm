/mob/living/carbon/human/boss
	var/list/spawn_abilities = list()
	var/list/spawn_attributes = list(
									STRENGTH_STAT = 100,
									WILLPOWER_STAT = 100,
									OBSERVATION_STAT = 100,
									REFLEXES_STAT = 100,
									LUCK_STAT = 100,
									PRECISION_STAT = 100,
									INTELLECT_STAT = 100
									)

/mob/living/carbon/human/boss/Initialize()
	. = ..()

	ADD_TRAIT(src, TRAIT_COMBATFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_WORKFEAR_IMMUNE, JOB_TRAIT)
	ADD_TRAIT(src, TRAIT_ATTRIBUTES_VISION, JOB_TRAIT)

	var/obj/effect/proc_holder/spell/targeted/dice_roll/att_check = new
	AddSpell(att_check)

	if(spawn_abilities.len)
		for(var/ability_type in spawn_abilities)
			AddSpell(new ability_type)

	if(spawn_attributes.len)
		for(var/atrib in spawn_attributes)
			var/datum/attribute/atr = attributes[atrib]
			if(istype(atr))
				atr.level = spawn_attributes[atrib]
				atr.on_update(src)
