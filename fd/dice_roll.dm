/obj/effect/temp_visual/dice_roll
	icon = 'fd/icons/dice_roll.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "dice_roll"
	duration = 20

/obj/effect/temp_visual/dice_fail
	icon = 'fd/icons/dice_roll.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "dice_failure"
	duration = 30

/obj/effect/temp_visual/dice_success
	icon = 'fd/icons/dice_roll.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "dice_success"
	duration = 30

/obj/effect/proc_holder/spell/targeted/dice_roll
	name = "Attribute Check"
	desc = "Выполняет проверку одной из выбранных характеристик."

	charge_max = 10
	clothes_req = 0

	message = span_notice("Ты кинул кубик!")
	range = -1
	include_user = 1
	var/list/attributes_rolling = list("Мужество", "Мудрость", "Выдержка", "Справедливость")
	var/player_stat = 0

/obj/effect/proc_holder/spell/targeted/dice_roll/cast(list/targets, mob/living/user = usr)
//setup
	var/phrase = input(user, "Напишите действие персонажа с маленькой буквы!", "Выполнить...", "поднимает камень.") as null|text
	if(!phrase)
		return FALSE
	var/wanted_attribute = input(user, "Выберите нужную вам характеристику", "Бросаем...") as null|anything in attributes_rolling
	if(wanted_attribute == "Мужество")
		player_stat = get_attribute_level(user, FORTITUDE_ATTRIBUTE)
	if(wanted_attribute == "Мудрость")
		player_stat = get_attribute_level(user, PRUDENCE_ATTRIBUTE)
	if(wanted_attribute == "Выдержка")
		player_stat = get_attribute_level(user, TEMPERANCE_ATTRIBUTE)
	if(wanted_attribute == "Справедливость")
		player_stat = get_attribute_level(user, JUSTICE_ATTRIBUTE)
	if(!wanted_attribute)
		return FALSE
//execution
	var/roll = rand(1,100)
	sound_to_playing_players('fd/sound/dice.mp3')
	new /obj/effect/temp_visual/dice_roll(get_turf(user))
	if(do_after(user, 2 SECONDS))
		if(roll > player_stat)
			send_to_playing_players(span_userdanger("[user] совершает проверку на [wanted_attribute] и ПРОВАЛИВАЕТ ЕЁ С РЕЗУЛЬТАТОМ [roll]!"))
			user.visible_message(span_danger("[user] [phrase] Но проваливатся!"))
			new /obj/effect/temp_visual/dice_fail(get_turf(user))
			return TRUE
		if(roll <= player_stat)
			send_to_playing_players(span_userdanger("[user] совершает проверку на [wanted_attribute] и УСПЕШНО ПРОХОДИТ ЕЁ С РЕЗУЛЬТАТОМ [roll]!"))
			user.visible_message(span_nicegreen("[user] [phrase] У него всё получается!"))
			new /obj/effect/temp_visual/dice_success(get_turf(user))
			return TRUE
