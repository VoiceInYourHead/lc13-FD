/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_red
	name = "Black Roses Member"
	desc = "A miserable drug-addict. He's eyes and veins shining red."
	icon = 'fd/icons/npc.dmi'
	icon_state = "red_eyed"
	icon_living = "red_eyed"
	faction = list("roses")
	gender = NEUTER
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = TRUE
	see_in_dark = 3
	vision_range = 12
	aggro_vision_range = 20
	move_to_delay = 5
	stat_attack = HARD_CRIT
	melee_damage_type = RED_DAMAGE
	butcher_results = list(/obj/item/food/meat/slab = 1)
	guaranteed_butcher_results = list(/obj/item/food/meat/slab = 1)
	damage_coeff = list(BRUTE = 1, RED_DAMAGE = 1, WHITE_DAMAGE = 1, BLACK_DAMAGE = 1, PALE_DAMAGE = 2)
	blood_volume = BLOOD_VOLUME_NORMAL
	mob_size = MOB_SIZE_HUMAN
	a_intent = INTENT_HARM

	maxHealth = 500
	health = 500
	melee_damage_lower = 30
	melee_damage_upper = 40
	var/phase_two = FALSE
	var/special_is_active = TRUE
	attack_sound = 'sound/weapons/fixer/generic/baton1.ogg'
	attack_verb_continuous = "crushes"
	attack_verb_simple = "crush"

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_red/Initialize()
	. = ..()
	var/random_icon = pick(1,2)
	icon_state = "red_eyed[random_icon]"
	icon_living = "red_eyed[random_icon]"
	icon_dead = "red_eyed_dead[random_icon]"

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_red/proc/taunt(mob/living/target, mob/living/druggie)
	var/atom/throw_target = get_edge_target_turf(target, druggie.dir)
	if(!target.anchored)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 3), whack_speed, druggie)

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_red/proc/reset_delay()
	special_is_active = TRUE

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_red/Life()
	..()

	if(special_is_active && target)
		for(target in orange(1, src))
			taunt(target, src)
			special_is_active = FALSE
			addtimer(CALLBACK(src, PROC_REF(reset_delay),), 10 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

	if(health <= 250 && !phase_two)
		phase_two = TRUE
		for(var/mob/living/H in orange(1, src))
			taunt(H, src)
		move_to_delay -= 1
		melee_damage_lower += 20
		melee_damage_upper += 20
		health += 50
		add_filter("rage", 2, list("type" = "outline", "color" = "#a30b18", "size" = 1))

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green
	name = "Black Roses Member"
	desc = "A miserable drug-addict. He's eyes and veins shining green."
	icon = 'fd/icons/npc.dmi'
	icon_state = "green_eyed"
	icon_living = "green_eyed"
	faction = list("roses")
	gender = NEUTER
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = TRUE
	see_in_dark = 3
	vision_range = 12
	aggro_vision_range = 20
	move_to_delay = 2
	stat_attack = HARD_CRIT
	melee_damage_type = RED_DAMAGE
	butcher_results = list(/obj/item/food/meat/slab = 1)
	guaranteed_butcher_results = list(/obj/item/food/meat/slab = 1)
	damage_coeff = list(BRUTE = 1, RED_DAMAGE = 1, WHITE_DAMAGE = 1, BLACK_DAMAGE = 1, PALE_DAMAGE = 2)
	blood_volume = BLOOD_VOLUME_NORMAL
	mob_size = MOB_SIZE_HUMAN
	a_intent = INTENT_HARM

	maxHealth = 200
	health = 200
	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_sound = 'sound/weapons/fixer/generic/blade1.ogg'
	attack_verb_continuous = "slices"
	attack_verb_simple = "slice"
	var/combo_count = 0

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green/Initialize()
	. = ..()
	var/random_icon = pick(1,2)
	icon_state = "green_eyed[random_icon]"
	icon_living = "green_eyed[random_icon]"
	icon_dead = "green_eyed_dead[random_icon]"

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green/bullet_act(obj/projectile/P, atom/newloc)
	if(!(target in orange(1,src)))
		dodge(newloc,dir)
		return
	..()

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green/attacked_by(obj/item/I, mob/living/user, atom/newloc)
	if(prob(70))
		dodge(newloc,dir)
		return
	..()

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green/proc/damage_target(mob/living/target)
	target.apply_damage(10, RED_DAMAGE, null, target.run_armor_check(null, RED_DAMAGE), spread_damage = TRUE)

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green/Life()
	..()

	if(combo_count >= 1)
		combo_count -= 1

/mob/living/simple_animal/hostile/humanoid/blackrose_syndicate_green/AttackingTarget(atom/attacked_target)
	combo_count += 1

	if(combo_count >= 5 && isliving(attacked_target))
		src.visible_message(span_danger("[src] оставляет [attacked_target] глубокую кровоточащую рану!"))
		addtimer(CALLBACK(src, PROC_REF(damage_target), attacked_target), 3 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(damage_target), attacked_target), 6 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(damage_target), attacked_target), 9 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(damage_target), attacked_target), 12 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(damage_target), attacked_target), 15 SECONDS)
		combo_count = 0

	return ..()
