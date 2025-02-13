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

/obj/item/story_related/empty_pillbox
	name = "empty pillbox"
	desc = "Opened pillbox without any pills inside."
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "pillow0"

	clue = "Баночка для хранения таблеток с тёмно-синей лентой. На ленте есть надпись, написанная маркером от руки. 'Проба 3, 10 мг.'."
	needed_stat = OBSERVATION_STAT
	difficulty = 20

/obj/item/story_related/doctor_notes
	name = "notebook"
	desc = "Someones diary or something like this."
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "passport0"

	clue = "Журнал некого неназванного врача. Это крайне подробный отчёт об аутопсии. Вот краткая выжимка из самого важного - ...оперируемый начал принимать препарат...пропущено...за три дня до проявления первых симптомов катарсиса. Жаловался на постоянную головную боль, наблюдалось сильное раздражение, повышение уровня агрессии. Спустя ещё два дня, вместе с активным потоотделением, стали проступать первые признаки метаморфоз и отказа базовых функций организма. К концу недели оперируемый полностью потерял связь с реальностью, принявшись наносить себе лёгкие и тяжёлые телесные повреждения, предположительно, в попытках избавиться от болеощущения. Остановить вовремя не удалось. При вскрытии было обнаружено, что пигмент его крови изменился на ярко-голубой, а большая часть внутренних органов покрылась биолюминесцентными, пульсирующими наростами, постепенно продолжавшими своё распространение в ходе проведения осмотра. Часть субстанции пост-жизнедеятельности оперируемого была собрана для проведения дальнейших экспериментов. Тело утилизировано посредством..."
	needed_stat = OBSERVATION_STAT
	difficulty = 20

/obj/item/story_related/corpo_id
	name = "id card"
	desc = "Someones ID card. Maybe we can get more access to the needed info with this?"
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "id7_regent"

	clue = "Карта с затёртой фотографией. Принадлежит некому 'О'Браяну', сотруднику Крыла 'D'. Подделка?...Не очень похоже на то. Что бы здесь не происходило, но очевидно что Синдикат - это самое низшее звено данного наркокартеля."
	needed_stat = OBSERVATION_STAT
	difficulty = 20

/obj/item/story_related/comp
	name = "personal laptop"
	desc = "It has an experimental B-Wing protection installed. If we could have someone smart enough to breach it..."
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "comp2"

	clue = "Слегка пораскинув мозгами и покопавшись в файлах, вам всё-таки удаётся обойти нетривиальную защиту, получив доступ к хранившимся там файлам. Впрочем, единственное, что вас действительно заинтересовало - это переписка некого О'Браяна с анонимом. Они обсуждают одного из бывших Цветных Корректировщиков, 'Белоснежного Творца', который бесследно пропал около двух месяцев назад. Его последним взятым заказом было сопровождение научной группы Крыла 'D' в Руинах. Судя по контексту, этим двоим не только известно о том, что он жив, но и то, что он вскоре 'навестит' их."
	needed_stat = INTELLECT_STAT
	difficulty = 60

/obj/item/story_related/comp/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/story_related/corpo_id))
		if(do_after(user, 10 SECONDS, src))
			to_chat(user, span_nicegreen("Войдя в систему под чужой картой, вы принялись копаться в файлах. Впрочем, единственное, что вас действительно заинтересовало - это переписка некого О'Браяна с анонимом. Они обсуждают одного из бывших Цветных Корректировщиков, 'Белоснежного Творца', который бесследно пропал около двух месяцев назад. Его последним взятым заказом было сопровождение научной группы Крыла 'D' в Руинах. Судя по контексту, этим двоим не только известно о том, что он жив, но и то, что он вскоре 'навестит' их."))

//Выдать для фейк-полис
/obj/item/story_related/fake_badge
	name = "zwei badge"
	desc = "This is silver badge, used by most of Zwei Fixers."
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "id13"

	clue = "Во-первых, не паниковать. Этот жетон - точно фальшифка. Кем бы не были эти люди - они явно не относятся к Цвай никаким местом и с большой вероятностью убили прежних носителей своей формы. Во-вторых - они точно сильнее нас в несколько раз. Попробуем придать их ответственности и точно проиграем. Или, как минимум, вскорем им то, что мы действительно что-то знаем."
	needed_stat = PRECISION_STAT
	difficulty = 70

/obj/item/story_related/fake_badge/attack_self(mob/living/carbon/user)
	if(user.real_name == "Aurum O'Lith")
		if(do_after(user, 10 SECONDS, src))
			to_chat(user, span_nicegreen("[clue]"))
			return
	..()

/datum/movespeed_modifier/dstout/doubled
	variable = TRUE
	multiplicative_slowdown = -1

/obj/item/story_related/pillbox
	name = "pillbox"
	desc = "Filled pillbox. (You can consume it on AltClick)"
	icon = 'fd/icons/wod_assets/items.dmi'
	icon_state = "pillow1"

	clue = "Баночка для хранения таблеток с тёмно-синей лентой. На ленте есть надпись, написанная маркером от руки. 'Проба 4, 10 мг. НА ОТПРАВКУ!'."
	needed_stat = OBSERVATION_STAT
	difficulty = 20

/obj/item/story_related/pillbox/AltClick(mob/living/carbon/human/user)
	. = ..()
	to_chat(user, span_resonate("Ты залпом закидываешь в себя содержимое таблетницы."))
	if(do_after(user, 2 SECONDS))
		user.visible_message("<span class='warning'>[user] начинает давиться и сжиматься в болезненном порыве несколько секунд, после чего, кажется, приходит в себя.</span>")
		user.add_movespeed_modifier(/datum/movespeed_modifier/dstout/doubled)
		addtimer(CALLBACK(user, TYPE_PROC_REF(/mob, remove_movespeed_modifier), /datum/movespeed_modifier/dstout/doubled), 60 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
		user.death_threshold -= 400
		user.hardcrit_threshold -= 400
		user.crit_threshold -= 400
		user.adjust_attribute_buff(STRENGTH_STAT, 400)
		user.Jitter(150)
		user.blueblood_affected = TRUE
		user.blueblood_duration = 60 SECONDS
		user.blueblood_debuff = TRUE
		to_chat(user, span_spiderscout("В твоих венах кипит самая настоящая злоба, смешавшаяся с пульсирующей болью, пронзающей каждую часть твоего тела."))
		qdel(src)

// Пакетик с живокровью(первородной)

// Тело одного из подопытных
