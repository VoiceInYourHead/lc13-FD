/obj/item/story_related
	name = "something"
	desc = "something"
	icon = 'fd/icons/story.dmi'
	icon_state = "book"
	var/clue = "some random text that will show up on success" //текст, выводимый людям с достаточным уровнем стата
	var/needed_stat = OBSERVATION_STAT //какой стат мы используем для осмотра
	var/difficulty = 0 //насколько большим должен быть этот стат для получения нормальных результатов
	var/found = FALSE //обнаружен ли предмет? по большей части нужно для абилки бруно, но можно также юзать если хочется выделить предмет на фоне остального
	var/list/who_failed = list()

/obj/item/story_related/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/story_related/process()
	if(found)
		icon_state = "[initial(icon_state)]_found"
	if(!found)
		icon_state = "[initial(icon_state)]"

/obj/item/story_related/attack_self(mob/user)
	for(var/mob/living/failed in who_failed)
		if(failed == user)
			to_chat(user, span_warning("Что ещё ты хочешь тут найти? Ты и так осмотрел его вдоль и поперёк."))
			return
	var/stat_level = get_attribute_level(user, needed_stat)
	to_chat(user, span_notice("Ты внимательно осматриваешь предмет несколько секунд..."))
	if(do_after(user, 10 SECONDS, src))
		if(stat_level < difficulty)
			if(prob(70))
				to_chat(user, span_warning("Но не можешь понять, что в нём такого..."))
				found = FALSE
				who_failed += user
				return
		found = FALSE
		to_chat(user, span_nicegreen("[clue]"))
