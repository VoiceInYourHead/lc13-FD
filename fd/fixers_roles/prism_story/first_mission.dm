//AREAS

/area/city/prism/factory_lower
	name = "Factory (0LVL)"

/area/city/prism/factory_middle
	name = "Factory (1LVL)"

/area/city/prism/factory_upper
	name = "Factory (2LVL)"

//STUFF OK

/obj/structure/story_related/false_floor
	name = "floor"
	desc = "Metal flooring."
	icon = 'fd/icons/mojave_turfs/floors.dmi'
	icon_state = "secret"
	obj_flags =  BLOCK_Z_OUT_DOWN

	clue = "Тщательно осматривая половицу, ты несколько раз постукиваешь по её поверхности понимая, что по ту сторону, кажется, есть некая полость? Скрытый проход. Но как нам избавиться от неё? Не похоже, что мы сможем просто снять эту плиту..."
	needed_stat = OBSERVATION_STAT
	difficulty = 60
	var/already_opened = FALSE
	var/variant = 1

/obj/structure/story_related/false_floor/proc/open()
	icon_state = "[initial(icon_state)][variant]_moving"
	obj_flags = null
	already_opened = TRUE

/obj/structure/story_related/secret_lever
	name = "old table clock"
	desc = "Very old looking clocks. (You can adjust time on it by Alt+Click)"
	icon = 'fd/icons/items.dmi'
	icon_state = "wooden_clock"

	clue = "Странно...с этими часами явно что-то не так. Ладно ещё то, что они стоят на месте, но зачем здесь эти красные вычерченные отметки?...Указывают на две цифры, 9 и 11."
	needed_stat = OBSERVATION_STAT
	difficulty = 40
	var/list/allowed_numbers = list(1,2,3,4,5,6,7,8,9,10,11,12)
	var/first_number = 12
	var/second_number = 12
	var/correct_first_number = 9
	var/correct_second_number = 11
	var/solved = FALSE

/obj/structure/story_related/secret_lever/process()
	..()
	if(first_number == correct_first_number && second_number == correct_second_number && !solved)
		solved = TRUE

	if(solved)
		for(var/obj/structure/story_related/false_floor/FF in world)
			if(FF.already_opened == FALSE)
				FF.open()

/obj/structure/story_related/secret_lever/AltClick(mob/user)
	. = ..()
	first_number = input(user, "Выберите, на какое время перевести первую стрелку!", "Настраиваем...") as null|anything in allowed_numbers
	second_number = input(user, "Выберите, на какое время перевести вторую стрелку!", "Настраиваем...") as null|anything in allowed_numbers
	if(first_number == correct_first_number)
		to_chat(user, span_nicegreen("Вы проворачиваете первую стрелку на [first_number] и что-то щёлкает!"))
	if(second_number == correct_second_number)
		to_chat(user, span_nicegreen("Вы проворачиваете вторую стрелку на [second_number] и что-то щёлкает!"))
	to_chat(user, span_notice("Вы повернули стрелки на [first_number] и [second_number] часов."))
	desc = "Very old looking clocks, looking at [first_number] and [second_number]. (You can adjust time on it by Alt+Click)"
