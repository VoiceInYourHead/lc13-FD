//Спизженно с ВТМника и значительно упрощено

/mob/living/simple_animal/npc
	name = "unknown"
	a_intent = INTENT_HELP
	var/datum/socialrole/socialrole

	var/is_talking = FALSE
	var/last_annoy = 0
	var/last_danger_meet = 0
	var/mob/living/danger_source
	var/atom/movable/less_danger
	var/mob/living/last_attacker
	var/last_health = 100
	var/mob/living/last_damager

	var/turf/walktarget

	var/last_grab = 0

	var/tupik_steps = 0
	var/tupik_loc

	var/stopturf = 1

	var/staying = FALSE

	var/lifespan = 0
	var/old_movement = FALSE
	var/max_stat = 2

	var/list/spotted_bodies = list()

//Так как нам нет необходимости делать их полноценными хуманами, а симплмобов одеть мы не можем - будем использовать готовые пресеты спрайтов!

	var/list/faction_outfit = list("civ","fixer","syndicate")
	var/faction_current = "civ"
	var/should_be_randomized = FALSE
	var/random_outfit = 1
	icon = 'fd/icons/npc.dmi'
	icon_state = "red_eyed"
	icon_living = "red_eyed"

/datum/movespeed_modifier/npc
	multiplicative_slowdown = 2

/datum/socialrole

	//For reaction
	var/list/neutral_phrases = list("Отъебись.",
																	"Иди своей дорогой, дружок.",
																	"Не лучшее время для болтовни, приятель.",
																	"Мхмм...",
																	"Я тебя знаю?",
																	"У меня не так много времени.")
	var/list/random_phrases = list("Смотри, куда идешь!",
																	"Кажется, я уже в третий раз хожу здесь по кругу...",
																	"Канализационная крыса. Возвращайся в канализацию, откуда пришел.",
																	"Турист... Хах.")
	var/list/answer_phrases = list("Я согласен.",
																	"Да-да...",
																	"Точно.",
																	"Может быть.",
																	"Верно.",
																	"Утвердительный..")
	var/list/help_phrases = list("Помогите!",
																"Помогите мне!!",
																"Что за херня здесь творится?!",
																"Стреляй!!")

/mob/living/simple_animal/npc/proc/AssignSocialRole(var/datum/socialrole/S, var/dont_random = FALSE)
	if(!S)
		return
	socialrole = new S()

/mob/living/simple_animal/npc/proc/GetSayDelay(var/message)
	var/delay = length_char(message)
	return delay

/mob/living/simple_animal/npc/proc/RealisticSay(var/message)
	walk(src,0)
	if(!message)
		return
	if(is_talking)
		return
	if(stat >= HARD_CRIT)
		return
	is_talking = TRUE
	spawn(5)
		if(stat != DEAD)
			say(message)
			is_talking = FALSE

/mob/living/simple_animal/npc/proc/Annoy(var/atom/source)
	walk(src,0)
	if(CheckMove())
		return
	if(is_talking)
		return
	if(danger_source)
		return
	if(stat >= HARD_CRIT)
		return
	if(world.time <= last_annoy+50)
		return
	if(source)
		spawn(rand(3, 7))
			face_atom(source)
	last_annoy = world.time
	var/phrase
	if(prob(50))
		phrase = pick(socialrole.neutral_phrases)
	RealisticSay(phrase)

/mob/living/carbon/human/Bump(atom/Obstacle)
	. = ..()
	var/mob/living/simple_animal/npc/NPC = locate() in get_turf(Obstacle)
	if(NPC)
		if(a_intent != INTENT_HELP)
			NPC.Annoy(src)

/mob/living/simple_animal/npc/Move(NewLoc, direct)
	. = ..()
	if(CheckMove())
		walk(src,0)
	var/getaway = stopturf+1
	if(!old_movement)
		getaway = 2
	if(get_dist(src, walktarget) <= getaway)
		walk(src,0)
		walktarget = null

/mob/living/simple_animal/npc/attack_hand(mob/user)
	if(user)
		if(user.a_intent == INTENT_HELP)
			Annoy(user)
		if(user.a_intent == INTENT_DISARM)
			Aggro(user, TRUE)
		if(user.a_intent == INTENT_HARM)
			for(var/mob/living/simple_animal/npc/NEPIC in oviewers(7, src))
				NEPIC.Aggro(user)
			Aggro(user, TRUE)
	..()

/mob/living/simple_animal/npc/on_hit(obj/projectile/P)
	. = ..()
	if(P)
		if(P.firer)
			for(var/mob/living/simple_animal/npc/NEPIC in oviewers(7, src))
				NEPIC.Aggro(P.firer)
			Aggro(P.firer, TRUE)

/mob/living/simple_animal/npc/hitby(atom/movable/AM, skipcatch, hitpush = TRUE, blocked = FALSE, datum/thrownthing/throwingdatum)
	. = ..()
	if(throwingdatum)
		if(throwingdatum.thrower)
			Aggro(throwingdatum.thrower, TRUE)

/mob/living/simple_animal/npc/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(user)
		if(W.force)
			for(var/mob/living/simple_animal/npc/NEPIC in oviewers(7, src))
				NEPIC.Aggro(user)
			Aggro(user, TRUE)

/mob/living/simple_animal/npc/grabbedby(mob/living/carbon/user, supress_message = FALSE)
	. = ..()
	last_grab = world.time

/mob/living/simple_animal/npc/proc/EmoteAction()
	walk(src,0)
	if(CheckMove())
		return
	var/shitemote = pick("sigh", "smile", "stare", "look", "spin", "giggle", "blink", "blush", "nod", "sniff", "shrug", "cough", "yawn")
	if(!is_talking)
		is_talking = TRUE
		spawn(rand(5, 10))
			emote(shitemote)
			is_talking = FALSE

/mob/living/simple_animal/npc/proc/StareAction()
	walk(src,0)
	if(CheckMove())
		return
	if(!is_talking)
		var/list/interest_persons = list()
		for(var/mob/living/carbon/human/H in viewers(4, src))
			if(H)
				if(H != src)
					interest_persons += H
		if(length(interest_persons))
			is_talking = TRUE
			spawn(rand(2, 7))
				face_atom(pick(interest_persons))
				spawn(rand(1, 5))
					is_talking = FALSE

/mob/living/simple_animal/npc/proc/SpeechAction()
	walk(src,0)
	if(CheckMove())
		return
	if(!is_talking)
		var/list/interest_persons = list()
		for(var/mob/living/simple_animal/npc/H in viewers(4, src))
			if(H)
				if(H != src && !H.CheckMove())
					interest_persons += H
		if(length(interest_persons))
			var/mob/living/simple_animal/npc/N = pick(interest_persons)
			face_atom(N)
			var/question = pick(socialrole.random_phrases)
			RealisticSay(question)
			spawn(rand(1, 5))
				N.face_atom(src)
				N.is_talking = TRUE
				spawn(GetSayDelay(question))
					N.is_talking = FALSE
					N.RealisticSay(pick(N.socialrole.answer_phrases))

/mob/living/simple_animal/npc/proc/Aggro(var/mob/M, var/attacked = FALSE)
	if(M == src)
		return
	if(CheckMove(hardlock = TRUE))
		return
	if((stat != DEAD) && !HAS_TRAIT(M, TRAIT_DEATHCOMA))
		danger_source = M
		if(attacked)
			last_attacker = M
			if(health != last_health)
				last_health = health
				last_damager = M
	if((last_danger_meet + 2 SECONDS) < world.time)
		last_danger_meet = world.time
		if(prob(50))
			emote("scream")
		else
			RealisticSay(pick(socialrole.help_phrases))
