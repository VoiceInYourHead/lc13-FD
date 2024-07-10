/obj/machinery/door/unpowered/fd
	var/locked_up = FALSE
	var/lock_id = null

/obj/item/door_key
	name = "key (empty)"
	desc = "Key, just a key."
	icon = 'fd/icons/keys_inventory.dmi'
	icon_state = "brass"
	w_class = WEIGHT_CLASS_TINY
	var/key_id = null

/obj/item/door_key/Initialize()
	. = ..()
	if(key_id != null)
		name = "key ([key_id])"
