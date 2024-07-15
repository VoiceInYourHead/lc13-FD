/obj/effect/temp_visual/dice_roll
	icon = 'fd/icons/dice_roll.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "dice_roll"
	duration = 20

/obj/effect/temp_visual/dice_fail
	icon = 'fd/icons/dice_roll.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "dice_failure"

/obj/effect/temp_visual/dice_fail/super
	icon_state = "dice_true_failure"

/obj/effect/temp_visual/dice_success
	icon = 'fd/icons/dice_roll.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	icon_state = "dice_success"

/obj/effect/temp_visual/dice_success/super
	icon_state = "dice_true_success"

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
	sound_to_playing_players('fd/sound/dice_better.wav')
	new /obj/effect/temp_visual/dice_roll(get_turf(user))
	if(do_after(user, 2 SECONDS))
		if(roll > player_stat)
			if(roll >= 90)
				send_to_playing_players(span_userdanger("[user] совершает проверку на [wanted_attribute] и ПОЛУЧАЕТ КРИТИЧЕСКИЙ ПРОВАЛ!"))
				user.visible_message(span_danger("[user] [phrase] Но всё словно валится из рук! Как же неприятно!"))
				sound_to_playing_players('fd/sound/failure.wav')
				new /obj/effect/temp_visual/dice_fail/super(get_turf(user))
				return TRUE
			send_to_playing_players(span_userdanger("[user] совершает проверку на [wanted_attribute] и ПРОВАЛИВАЕТ ЕЁ С РЕЗУЛЬТАТОМ [roll]!"))
			user.visible_message(span_danger("[user] [phrase] Но что-то идёт не по плану!"))
			new /obj/effect/temp_visual/dice_fail(get_turf(user))
			return TRUE
		if(roll <= player_stat)
			if(roll <= 10)
				send_to_playing_players(span_userdanger("[user] совершает проверку на [wanted_attribute] и его действия приводят к КРИТИЧЕСКОМУ УСПЕХУ!"))
				user.visible_message(span_nicegreen("[user] [phrase] Вся работа была выполнена без единой заминки! Потрясающе!"))
				sound_to_playing_players('fd/sound/success.wav')
				new /obj/effect/temp_visual/dice_success/super(get_turf(user))
				return TRUE
			send_to_playing_players(span_userdanger("[user] совершает проверку на [wanted_attribute] и УСПЕШНО ПРОХОДИТ ЕЁ С РЕЗУЛЬТАТОМ [roll]!"))
			user.visible_message(span_nicegreen("[user] [phrase] Не то что бы что-то могло пойти не так, верно?"))
			new /obj/effect/temp_visual/dice_success(get_turf(user))
			return TRUE
