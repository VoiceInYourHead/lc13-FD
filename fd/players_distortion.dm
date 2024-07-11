#define FRAGMENT_SONG_COOLDOWN (14 SECONDS)

//Toggle Sprite
/obj/effect/proc_holder/spell/targeted/change_sprite
	name = "Change Appearance \[TO TWO\]"
	desc = "Changes your appearance to something else."

	charge_max = 10
	clothes_req = 0

	message = span_notice("You changed your sprite!")
	range = -1
	include_user = 1
	var/state = 1

/obj/effect/proc_holder/spell/targeted/change_sprite/cast(list/targets, mob/living/simple_animal/user = usr)

	if(state == 1)
		name = "Change Appearance \[TO TWO\]"
		user.icon = null //change to the needed file or remove
		user.icon_state = null //same here
		user.icon_living = null //same here
		user.icon_dead = null //same here
		user.pixel_x = 0
		user.pixel_y = 0
		state = 2
		return TRUE
	if(state == 2)
		name = "Change Appearance \[TO THREE\]"
		user.icon = null //change to the needed file or remove
		user.icon_state = null //same here
		user.icon_living = null //same here
		user.icon_dead = null //same here
		user.pixel_x = 0
		user.pixel_y = 0
		state = 3
		return TRUE
	if(state == 3)
		name = "Change Appearance \[TO ONE\]"
		user.icon = null //change to the needed file or remove
		user.icon_state = null //same here
		user.icon_living = null //same here
		user.icon_dead = null //same here
		user.pixel_x = 0
		user.pixel_y = 0
		state = 1
		return TRUE

/obj/effect/proc_holder/spell/targeted/change_sprite/mermaid

/obj/effect/proc_holder/spell/targeted/change_sprite/mermaid/cast(list/targets, mob/living/simple_animal/user = usr)

	if(state == 1)
		name = "Change Appearance \[TO TWO\]"
		user.icon = 'fd/icons/swift_distortion.dmi'
		user.icon_state = "pmermaid_standing"
		user.icon_living = "pmermaid_standing"
		user.icon_dead = null
		user.pixel_x = -12
		user.pixel_y = -12
		visible_message(span_warning("[user] поднимается из воды, обнажив свою изящную фигуру..."))
		state = 2
		return TRUE
	if(state == 2)
		name = "Change Appearance \[TO ONE\]"
		user.icon = 'fd/icons/swift_distortion.dmi'
		user.icon_state = "pmermaid_laying"
		user.icon_living = "pmermaid_laying"
		user.icon_dead = null
		user.pixel_x = -12
		user.pixel_y = -12
		visible_message(span_warning("[user] вновь прячет свой торс в воду..."))
		state = 1
		return TRUE

/mob/living/simple_animal/hostile/abnormality/fragment/fd_distortion
	name = "Mermaid"
	desc = "A limbless distortion ressembling a mermaid. Their heart shaped eyes look at you with both love and jealousy."
	icon = 'fd/icons/swift_distortion.dmi'
	icon_state = "pmermaid_laying"
	icon_living = "pmermaid_laying"
	icon_dead = null
	portrait = "piscine"
	death_sound = 'sound/abnormalities/piscinemermaid/waterjump.ogg'
	attack_sound = 'sound/abnormalities/piscinemermaid/splashattack.ogg'
	del_on_death = FALSE
	maxHealth = 4000
	health = 4000
	pixel_x = -12
	base_pixel_x = -12
	damage_coeff = list(RED_DAMAGE = 1.5, WHITE_DAMAGE = 1.5, BLACK_DAMAGE = 0.5, PALE_DAMAGE = 2)
	ranged = TRUE
	melee_damage_lower = 15
	melee_damage_upper = 20 //really subpar damage and speed but most of her damage is oxyloss anyway
	rapid_melee = 2
	melee_damage_type = BLACK_DAMAGE
	stat_attack = HARD_CRIT
	attack_sound = 'sound/abnormalities/fragment/attack.ogg'
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stab"
	faction = list("hostile")

	var/suffocation_range = 1
	song_damage = 10 // Dealt 8 times

/mob/living/simple_animal/hostile/abnormality/fragment/fd_distortion/Initialize()
	. = ..()
	var/obj/effect/proc_holder/spell/targeted/change_sprite/mermaid/sprite = new
	src.AddSpell(sprite)

/mob/living/simple_animal/hostile/abnormality/fragment/fd_distortion/Life()
	. = ..()
	if(status_flags & GODMODE)
		return
	if(!.)
		return
	for(var/mob/living/carbon/human/H in oview(src, suffocation_range))
		H.adjustOxyLoss(3, updating_health=TRUE, forced=TRUE)
		new /obj/effect/temp_visual/mermaid_drowning(get_turf(H))
	return

/mob/living/simple_animal/hostile/abnormality/fragment/fd_distortion/OpenFire()
	if(!can_act || client)
		return

	if(song_cooldown <= world.time)
		song()

/mob/living/simple_animal/hostile/abnormality/fragment/fd_distortion/song()
	if(song_cooldown > world.time)
		return
	can_act = FALSE
	flick("fragment_song_transition" , src)
	SLEEP_CHECK_DEATH(5)

	particle_note = new(get_turf(src))
	particle_note.pixel_y = 26
	particle_song = new(get_turf(src))
	particle_song.pixel_y = 26
	playsound(get_turf(src), 'sound/abnormalities/fragment/sing.ogg', 50, 0, 4)

	for(var/mob/living/L in view(8, src))
		if(faction_check_mob(L, FALSE))
			continue
		if(L.stat == DEAD)
			continue
		L.apply_damage(song_damage, WHITE_DAMAGE, null, L.run_armor_check(null, WHITE_DAMAGE), spread_damage = TRUE)
	SLEEP_CHECK_DEATH(3)

	flick("fragment_song_transition" , src)
	SLEEP_CHECK_DEATH(5)

	can_act = TRUE
	song_cooldown = world.time + song_cooldown_time
	if(!particle_note)
		return
	particle_note.fadeout()
	particle_song.fadeout()

/mob/living/simple_animal/hostile/abnormality/fragment/fd_distortion/BreachEffect(mob/living/carbon/human/user, breach_type)
	. = ..()
	icon = 'fd/icons/swift_distortion.dmi'
	icon_living = "pmermaid_breach"
	icon_dead = "pmermaid_slain"
	icon_state = icon_living
	pixel_y = -16
	base_pixel_y = -16

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion
	name = "Hatred"
	desc = "An red aggressive creature."
	health = 2000
	maxHealth = 2000
	attack_verb_continuous = "whips"
	attack_verb_simple = "whip"
	attack_sound = 'sound/weapons/slash.ogg'
	icon = 'fd/icons/kanaryss_distortion.dmi'
	icon_state = "broodmother"
	icon_living = "broodmother"
	icon_dead = "egg_sac"

	move_to_delay = 2
	pixel_x = -17
	base_pixel_x = -17
	var/combo_counter = 0

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion/Life()
	. = ..()
	if(!.) // Dead
		return FALSE

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion/death()
	can_act = FALSE
	icon_state = icon_dead

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion/Stagger()
	can_act = FALSE
	SLEEP_CHECK_DEATH(10 SECONDS)
	can_act = TRUE

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion/AttackingTarget(atom/attacked_target)
	SEND_SIGNAL(src, COMSIG_HOSTILE_ATTACKINGTARGET, target)
	in_melee = TRUE
	if(ismob(target))
		changeNext_move(SSnpcpool.wait / rapid_melee)
		// Wow! that's a really weird variable to base attack speed on! Yes.
		// It's because mobs typically attack once per this duration, because the subsystem calls handle_automated_movement() which then calls the attacking procs.
	combo_counter += 1
	if ((grab_cooldown <= world.time) && prob(35) && (!client))//checks for client since you can still use the claw if you click nearby
		var/turf/target_turf = get_turf(target)
		return ClawGrab(target_turf)
	if(combo_counter >= 3)
		combo_counter = 0
		return Whip_Attack()
	return target.attack_animal(src)

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion/ClawGrab(target)
	if(grab_cooldown > world.time)
		return
	grab_cooldown = world.time + grab_cooldown_time
	can_act = FALSE
	face_atom(target)
	playsound(get_turf(src), 'sound/abnormalities/kqe/load1.ogg', 75, 0, 3)
	var/grab_delay = (get_dist(src, target) <= 2) ? (1 SECONDS) : (0.5 SECONDS)
	SLEEP_CHECK_DEATH(grab_delay)
	new /obj/effect/kqe_claw(get_turf(target))
	SLEEP_CHECK_DEATH(5 SECONDS)
	can_act = TRUE

/mob/living/simple_animal/hostile/abnormality/kqe/fd_distortion/Whip_Attack()
	can_act = FALSE
	var/matrix/init_transform = transform
	animate(src, transform = transform*1.5, time = 3, easing = BACK_EASING|EASE_OUT)
	face_atom(target)
	playsound(get_turf(src), attack_sound, 75, 0, 3)
	SLEEP_CHECK_DEATH(10)
	for(var/turf/T in view(2, src))
		new /obj/effect/temp_visual/smash_effect(T)
		HurtInTurf(T, list(), melee_damage_upper, RED_DAMAGE, check_faction = TRUE, hurt_mechs = TRUE)
	SLEEP_CHECK_DEATH(3)
	can_act = TRUE
	animate(src, transform = init_transform, time = 5)

#undef FRAGMENT_SONG_COOLDOWN
