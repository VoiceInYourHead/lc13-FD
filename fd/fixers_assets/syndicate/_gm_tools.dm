GLOBAL_VAR(syndicate_boss)

/client/proc/boss_throw_up()
	set category = "GM Tools.Syndicate"
	set name = "Throw up"
	set desc = "Makes boss throw up."

	if(!holder)
		return

	var/mob/living/carbon/boss = GLOB.syndicate_boss
	if(!boss)
		return

	boss.vomit(0, FALSE, FALSE, rand(0,1), TRUE, VOMIT_PURPLE, FALSE, TRUE, 0)

	message_admins("Admin [key_name_admin(usr)] заставил босса блевануть живокровью.")

/client/proc/end_boss_battle(confirm in list("No", "Yes"))
	set category = "GM Tools.Ending"
	set name = "Death cutscene"
	set desc = "Death cutscene."

	if(!holder || confirm == "No")
		return

	end_cutscene()

/proc/end_cutscene()
	var/mob/living/carbon/boss = GLOB.syndicate_boss
	if(!boss)
		return

	boss.plane = 45
	for(var/mob/player in GLOB.player_list)
		player.overlay_fullscreen("boss_death", /atom/movable/screen/fullscreen/flash/mob_focus)
		player.plane = 45

		if(isliving(player))
			var/mob/living/living_player = player
			living_player.SetStun(1000, TRUE)

	sleep(3 SECONDS)

	sound_to_playing_players('sound/effects/his_grace_ascend.ogg', 60, FALSE)

	sleep(3 SECONDS)

	for(var/mob/player in GLOB.player_list)
		var/x_offset = (boss.x - player.x) * 32
		var/y_offset = (boss.y - player.y) * 32
		animate(player.client, pixel_x = x_offset, pixel_y = y_offset, time = 6 SECONDS, easing = CUBIC_EASING)

	sleep(2.5 SECONDS)

	for(var/mob/player in GLOB.player_list)
		player.face_atom(boss)

	sleep(5.5 SECONDS)

	sound_to_playing_players('sound/effects/singlebeat.ogg', 500, FALSE)

	sleep(4 SECONDS)

	sound_to_playing_players('sound/effects/gravhit.ogg', 500, FALSE)
	for(var/mob/mob in GLOB.mob_list)
		mob.color = COLOR_BLACK
	boss.color = COLOR_RED

	sleep(4 SECONDS)

	boss.set_resting(TRUE, TRUE, TRUE)
	sound_to_playing_players('sound/effects/bodyfall1.ogg', 500, FALSE)

	sleep(3 SECONDS)

	for(var/mob/player in GLOB.player_list)
		player.clear_fullscreen("boss_death", 5 SECONDS)

	for(var/mob/mob in GLOB.mob_list)
		animate(mob, color = initial(mob.color), time = 5 SECONDS, flags = ANIMATION_PARALLEL)

	sleep(5 SECONDS)

	boss.apply_damage(200, BRAIN)
	boss.plane = initial(boss.plane)
	for(var/mob/player in GLOB.player_list)
		player.plane = initial(player.plane)

	sleep(3 SECONDS)

	for(var/mob/player in GLOB.player_list)
		animate(player.client, pixel_x = 0, pixel_y = 0, time = 6 SECONDS, easing = CUBIC_EASING)

		if(isliving(player))
			var/mob/living/living_player = player
			living_player.SetStun(0, TRUE)

/atom/movable/screen/fullscreen/flash/mob_focus
	icon = 'icons/hud/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "flash"
	color = COLOR_BLACK
	alpha = 0

	plane = 44
	layer = 3

/atom/movable/screen/fullscreen/flash/mob_focus/Initialize(mapload)
	. = ..()
	animate(src, alpha = 255, time = 5 SECONDS, easing = CUBIC_EASING|EASE_OUT)

	main_anim_sequence()

/atom/movable/screen/fullscreen/flash/mob_focus/proc/main_anim_sequence()
	set waitfor = FALSE

	sleep(14 SECONDS)

	animate(src, color = COLOR_BLUE, time = 0.4 SECONDS, easing = CUBIC_EASING|EASE_IN)
	animate(color = COLOR_BLACK, time = 0.4 SECONDS, easing = CUBIC_EASING|EASE_OUT)

	sleep(4 SECONDS)

	color = COLOR_WHITE
