/obj/item/clothing/under/zweiroadblock
	name = "Roadblock Office amish suit"
	desc = "An standart office suit."
	icon = 'fd/icons/zwei/zwei_inventory.dmi'
	worn_icon = 'fd/icons/zwei/zwei_onmob.dmi'
	icon_state = "roadblock_under"
	can_adjust = FALSE //adjusting is mostly hardcoded. Im not messing with any of it.

/obj/item/ego_weapon/shield/roadblock
	name = "piked riot shield"
	desc = "A riot shield used by Association Zwei."
	special = "Slows down the user significantly."
	icon = 'fd/icons/zwei/zwei_inventory.dmi'
	icon_state = "roadblock_shield"
	lefthand_file = 'fd/icons/zwei/roadblock_shield_l.dmi'
	righthand_file = 'fd/icons/zwei/roadblock_shield_r.dmi'
	force = 20
	slowdown = 0.5
	damtype = RED_DAMAGE
	attack_verb_continuous = list("shoves", "bashes")
	attack_verb_simple = list("shove", "bash")
	hitsound = 'sound/weapons/genhit2.ogg'
	reductions = list(50, 40, 40, 20)
	projectile_block_duration = 10 SECONDS
	block_cooldown = 4 SECONDS
	block_duration = 2 SECONDS
	item_flags = SLOWS_WHILE_IN_HAND


/obj/item/ego_weapon/shield/roadblock/attack(mob/living/target, mob/living/user)
	. = ..()
	if(!.)
		return FALSE
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 2), whack_speed, user)

/obj/item/clothing/suit/armor/ego_gear/city/zweiroadblock_coat
	name = "Roadblock Office armored jacket"
	desc = "A excellent protection of standart Zwei jacket, now with style."
	icon = 'fd/icons/zwei/zwei_inventory.dmi'
	worn_icon = 'fd/icons/zwei/zwei_onmob.dmi'
	icon_state = "roadblock_coat"
	flags_inv = null
	armor = list(RED_DAMAGE = 60, WHITE_DAMAGE = 30, BLACK_DAMAGE = 40, PALE_DAMAGE = 20)
	attribute_requirements = list()
	hat = /obj/item/clothing/head/ego_hat/helmet/zweiroadblock

/obj/item/clothing/suit/armor/ego_gear/city/zweiroadblock_trench
	name = "Roadblock Office armored trenchcoat"
	desc = "A excellent protection of standart Zwei uniform, now with style."
	icon = 'fd/icons/zwei/zwei_inventory.dmi'
	worn_icon = 'fd/icons/zwei/zwei_onmob.dmi'
	icon_state = "roadblock_leader_trench"
	flags_inv = null
	armor = list(RED_DAMAGE = 70, WHITE_DAMAGE = 40, BLACK_DAMAGE = 50, PALE_DAMAGE = 20)
	attribute_requirements = list()

/obj/item/clothing/head/ego_hat/helmet/zweiroadblock
	name = "Association Zwei riot helmet"
	desc = "A riot helmet worn by Zwei Offices."
	icon = 'fd/icons/zwei/zwei_inventory.dmi'
	worn_icon = 'fd/icons/zwei/zwei_onmob.dmi'
	icon_state = "roadblock_helmet_shield"
	perma = TRUE
	flags_inv = HIDEHAIR|HIDEEARS
