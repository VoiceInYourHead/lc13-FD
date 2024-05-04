//WALLS, ALOT//

//Wood

/turf/closed/indestructible/reinforced/wood/logs
	name = "log wall"
	desc = "A bright wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/woodfresh.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/indestructible/reinforced/wood/logs/darker
	desc = "A darker wooden wall. It has some age."
	icon = 'fd/icons/mojave_turfs/walls/wood.dmi'

/turf/closed/indestructible/reinforced/wood/planks
	name = "wooden wall"
	desc = "A bright white wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/indestructible/reinforced/wood/planks/blue
	name = "wooden wall"
	desc = "A blue wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding_blue.dmi'

/turf/closed/indestructible/reinforced/wood/planks/green
	name = "wooden wall"
	desc = "A green wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding_green.dmi'

/turf/closed/indestructible/reinforced/wood/planks/red
	name = "wooden wall"
	desc = "A red wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding_red.dmi'

//Brick

/turf/closed/indestructible/reinforced/brick
	name = "brick wall"
	desc = "A brown-red brick wall."
	icon = 'fd/icons/mojave_turfs/walls/brick.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/indestructible/reinforced/brick/darker
	icon = 'fd/icons/mojave_turfs/walls/brickalt.dmi'

/turf/closed/indestructible/reinforced/brick/gray
	name = "brick wall"
	desc = "A gray brick wall."
	icon = 'fd/icons/mojave_turfs/walls/brickgray.dmi'

/turf/closed/indestructible/reinforced/brick/moulded
	name = "moulded brick wall"
	desc = "A grayish wall. This one probably built a long time ago."
	icon = 'fd/icons/mojave_turfs/walls/drought/prison.dmi'

//Concrete

/turf/closed/indestructible/reinforced/concrete
	name = "concrete wall"
	desc = "A bright concrete wall."
	icon = 'fd/icons/mojave_turfs/walls/concrete.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/indestructible/reinforced/concrete/blue
	desc = "A bright blue concrete wall."
	icon = 'fd/icons/mojave_turfs/walls/concretealt.dmi'

//Metal

/turf/closed/indestructible/reinforced/metal
	name = "metal wall"
	desc = "A pretty much impenetrable piece of metal."
	icon = 'fd/icons/mojave_turfs/walls/dungeon_1.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/indestructible/reinforced/metal/rusted
	name = "rusted metal wall"
	icon = 'fd/icons/mojave_turfs/walls/dungeon_rust_1.dmi'

/turf/closed/indestructible/reinforced/metal/rusted/industrial
	icon = 'fd/icons/mojave_turfs/walls/rusty_industrial.dmi'

/turf/closed/indestructible/reinforced/metal/rusted/newish
	icon = 'fd/icons/mojave_turfs/walls/rustmetal.dmi'

/turf/closed/indestructible/reinforced/metal/rusted/newish_grooved
	icon = 'fd/icons/mojave_turfs/walls/rrustmetal.dmi'

/turf/closed/indestructible/reinforced/metal/vault
	icon = 'fd/icons/mojave_turfs/walls/vault_wall.dmi'

/turf/closed/indestructible/reinforced/metal/vault_alt
	icon = 'fd/icons/mojave_turfs/walls/vault_vent.dmi'

/turf/closed/indestructible/reinforced/metal/newish
	icon = 'fd/icons/mojave_turfs/walls/metal.dmi'

/turf/closed/indestructible/reinforced/metal/newish_grooved
	name = "reinforced metal wall"
	icon = 'fd/icons/mojave_turfs/walls/rmetal.dmi'

//Other

/turf/closed/indestructible/reinforced/other/bunker
	name = "old bunker wall"
	desc = "A concrete-like wall. Pretty much impenetrable."
	icon = 'fd/icons/mojave_turfs/walls/bunker.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/indestructible/reinforced/other/sewer
	name = "old sewer wall"
	desc = "A concrete-like wall. It smells not that good, honestly."
	icon = 'fd/icons/mojave_turfs/walls/sewer.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

//FLOORS, ALOT//

//Wood

/turf/open/floor/wood/fd
	icon = 'fd/icons/mojave_turfs/floors.dmi'
	icon_state = "wood tiles"
	desc = "Wooden flooring."
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)
	baseturfs = /turf/baseturf_bottom //No lattices please
	var/has_alternate_states = TRUE //for damage, alts etc.
	var/alternate_states = 1
	var/has_base_states = TRUE //for starting variety (mainly wood)
	var/base_states = 2

/turf/open/floor/wood/fd/Initialize()
	. = ..()
	if(has_alternate_states)
		if(prob(25))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"
		else if(has_base_states && prob(80))
			icon_state = "[icon_state][rand(1,(base_states))]"

/turf/open/floor/wood/fd/burn_tile()
	burnt = 1
	return //We lack sprites for this. To do: make overlay here instead.

/turf/open/floor/wood/fd/break_tile()
	broken = 1
	return

/turf/open/floor/wood/fd/crowbar_act(mob/living/user, obj/item/I)
	return FALSE

/turf/open/floor/wood/fd/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/wood/fd/screwdriver_act(mob/living/user, obj/item/I)
	return

/turf/open/floor/wood/fd/common
	icon_state = "wood_common"
	alternate_states = 6

/turf/open/floor/wood/fd/fancy
	icon_state = "wood_fancy"
	alternate_states = 6
	has_base_states = FALSE

/turf/open/floor/wood/fd/wide
	icon_state = "wood_wide"
	alternate_states = 6

/turf/open/floor/wood/fd/mosaic
	icon_state = "wood_mosaic"
	alternate_states = 6

//Carpet

/turf/open/floor/wood/fd/carpet
	name = "carpet"
	desc = "carpeted wooden flooring."
	icon = 'fd/icons/mojave_turfs/carpet_red.dmi'
	icon_state = "carpet-255"
	base_icon_state = "carpet"
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_CARPET_BAREFOOT
	clawfootstep = FOOTSTEP_CARPET_BAREFOOT
	has_alternate_states = FALSE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_CARPET_RED, SMOOTH_GROUP_FD_TILE)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_RED)
	flags_1 = NONE
	bullet_bounce_sound = null
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	has_base_states = FALSE

/turf/open/floor/wood/fd/carpet/blue
	icon = 'fd/icons/mojave_turfs/carpet_blue.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_CARPET_BLUE)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_BLUE)

/turf/open/floor/wood/fd/carpet/green
	icon = 'fd/icons/mojave_turfs/carpet_green.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_FD_CARPET_GREEN)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_GREEN)

/turf/open/floor/wood/fd/carpet/violet
	icon = 'fd/icons/mojave_turfs/carpet_violet.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_FD_CARPET_VIOLET)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_VIOLET)

/turf/open/floor/wood/fd/carpet/shaggy
	icon = 'fd/icons/mojave_turfs/carpet_shaggy_red.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_FD_CARPET_SHAGGY_RED)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_SHAGGY_RED)

/turf/open/floor/wood/fd/carpet/shaggy/blue
	icon = 'fd/icons/mojave_turfs/carpet_shaggy_blue.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_FD_CARPET_SHAGGY_BLUE)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_SHAGGY_BLUE)

/turf/open/floor/wood/fd/carpet/shaggy/green
	icon = 'fd/icons/mojave_turfs/carpet_shaggy_green.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_FD_CARPET_SHAGGY_GREEN)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_SHAGGY_GREEN)

/turf/open/floor/wood/fd/carpet/shaggy/violet
	icon = 'fd/icons/mojave_turfs/carpet_shaggy_violet.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN,SMOOTH_GROUP_FD_CARPET_SHAGGY_VIOLET)
	canSmoothWith = list(SMOOTH_GROUP_FD_CARPET_SHAGGY_VIOLET)

//Tiled

/obj/item/stack/tile/fd //We need this because upstream turf code is not great.
	turf_type = /turf/open/floor/fd
	merge_type = /obj/item/stack/tile/fd

/turf/open/floor/fd
	desc = "Tiled flooring."
	icon = 'fd/icons/mojave_turfs/floors.dmi'
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/fd
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	var/has_alternate_states = FALSE
	var/alternate_states

/turf/open/floor/fd/burn_tile()
	burnt = 1
	return //We're not spriting damage variations for the millions of tiles we have. To do: make overlay here instead.

/turf/open/floor/fd/break_tile()
	broken = 1
	return

/turf/open/floor/fd/crowbar_act(mob/living/user, obj/item/I)
	return FALSE

/turf/open/floor/fd/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/fd/tile
	icon_state = "grey"
	has_alternate_states = TRUE
	alternate_states = 8

/turf/open/floor/fd/tile/long
	icon_state = "grey_long"
	alternate_states = 6

/turf/open/floor/fd/tile/blue
	icon_state = "blue"

/turf/open/floor/fd/tile/blue/long
	icon_state = "blue_long"
	alternate_states = 6

/turf/open/floor/fd/tile/navy
	icon_state = "navy"
	alternate_states = 7

/turf/open/floor/fd/tile/brown
	icon_state = "brown"

/turf/open/floor/fd/tile/brown/big
	icon_state = "brown_big"
	has_alternate_states = FALSE

/turf/open/floor/fd/tile/fancy
	icon_state = "fancy"
	alternate_states = 7

/turf/open/floor/fd/tile/large
	icon_state = "tiled tiles"

/turf/open/floor/fd/tile/large/navy
	icon_state = "navy_large"
	alternate_states = 3

/turf/open/floor/fd/tile/large/cream
	icon_state = "cream_large"
	has_alternate_states = FALSE

/turf/open/floor/fd/tile/large/black
	icon_state = "black_large"
	alternate_states = 3

/turf/open/floor/fd/tile/large/white
	icon_state = "white_large"
	alternate_states = 3

/turf/open/floor/fd/tile/large/green
	icon_state = "green_large"
	alternate_states = 3

/turf/open/floor/fd/tile/large/checkered
	icon_state = "checker_large"
	alternate_states = 3

/turf/open/floor/fd/tile/large/cafeteria
	icon_state = "cafe_large"
	alternate_states = 3

/turf/open/floor/fd/tile/full
	icon_state = "tiled tiles"
	has_alternate_states = FALSE

/turf/open/floor/fd/tile/full/navy
	icon_state = "navy_full"

/turf/open/floor/fd/tile/full/green
	icon_state = "green_full"

//Metal

/turf/open/floor/fd/metal
	footstep = FOOTSTEP_PLATING //clonk
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	icon_state = "steel_industrial"
	desc = "Metal flooring."
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)

/turf/open/floor/fd/metal/plate
	icon_state = "steel_solid"
	has_alternate_states = TRUE
	alternate_states = 3

/turf/open/floor/fd/metal/border
	icon_state = "steel_industrial_b"

/turf/open/floor/fd/metal/border/corner
	icon_state = "steel_industrial_b_corner"

/turf/open/floor/fd/metal/border/sides
	icon_state = "steel_industrial_b_sides"

/turf/open/floor/fd/metal/border/end
	icon_state = "steel_industrial_b_end"

/turf/open/floor/fd/metal/grate
	icon_state = "steel_grate"

/turf/open/floor/fd/metal/grate/alt
	icon_state = "steel_grate_alt"

/turf/open/floor/fd/metal/grate/border
	icon_state = "steel_grate_border"

/turf/open/floor/fd/metal/grate/border/warning
	icon_state = "steel_grate_warning"

/turf/open/floor/fd/metal/warning
	icon_state = "steel_warning"

/turf/open/floor/fd/metal/stayclear
	icon_state = "steel_stayclear"

/turf/open/floor/fd/metal/walkway
	icon_state = "steel_walkway"

/turf/open/floor/fd/metal/walkway/corner
	icon_state = "steel_walkway_corner"

/turf/open/floor/fd/metal/walkway/end
	icon_state = "steel_walkway_end"

//Concrete

/turf/open/floor/fd/concrete
	icon_state = "concrete_big"
	desc = "Concrete slabs."
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)

/turf/open/floor/fd/concrete/small
	icon_state = "concrete_small"
	has_alternate_states = TRUE
	alternate_states = 5

/turf/open/floor/fd/concrete/bricks
	icon_state = "concrete_bricks"
	has_alternate_states = TRUE
	alternate_states = 8

/turf/open/floor/fd/concrete/industrial
	icon_state = "concrete_industrial"
	desc = "Heavy duty concrete slabs." //DAS CONCRETE BABY

/turf/open/floor/fd/concrete/industrial/alt
	icon_state = "concrete_industrial_alt"

/turf/open/floor/fd/concrete/industrial/split
	icon_state = "concrete_industrial_split"

/turf/open/floor/fd/concrete/industrial/walkway
	icon_state = "concrete_walkway"

/turf/open/floor/fd/concrete/industrial/walkway/corner
	icon_state = "concrete_walkway_corner"

/turf/open/floor/fd/concrete/industrial/walkway/end
	icon_state = "concrete_walkway_end"

//Hybrid

/turf/open/floor/fd/concrete/cable
	icon_state = "concrete_cable_straight"
	desc = "Heavy duty cabling embedded in industrial grade concrete."

/turf/open/floor/fd/concrete/cable/curved
	icon_state = "concrete_cable_curve"

/turf/open/floor/fd/concrete/cable/merge
	icon_state = "concrete_cable_merge"

/turf/open/floor/fd/concrete/cable/intersection
	icon_state = "concrete_cable_intersection"

/turf/open/floor/fd/concrete/cable/box
	icon_state = "concrete_cable_box"

/turf/open/floor/fd/concrete/cable/node
	icon_state = "concrete_cable_node"

/turf/open/floor/fd/sewer
	icon = 'fd/icons/mojave_turfs/sewer_floor.dmi'
	icon_state = "floor-255"
	base_icon_state = "floor"
	desc = "Hard concrete sewer flooring, built to last."
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)
	canSmoothWith = list(SMOOTH_GROUP_CATWALK, SMOOTH_GROUP_CATWALK, SMOOTH_GROUP_FD_TILE)

//Ceramic

/turf/open/floor/fd/ceramic
	icon_state = "ceramic"
	desc = "Ceramic tiles."
	has_alternate_states = TRUE
	alternate_states = 2
	footstep = FOOTSTEP_FLOOR
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)

/turf/open/floor/fd/ceramic/ornate
	icon_state = "ornate"
	alternate_states = 3

/turf/open/floor/fd/ceramic/sierra
	icon_state = "sierra"
	alternate_states = 3

////Brick Floors////

/turf/open/floor/fd/brick
	icon_state = "brick"
	desc = "Brick flooring."
	has_alternate_states = TRUE
	alternate_states = 8
	footstep = FOOTSTEP_FLOOR
	smoothing_groups = list(SMOOTH_GROUP_FD_TILE)

////Pipe Floors////

/turf/open/floor/fd/metal/pipe
	icon_state = "pipe_straight"

/turf/open/floor/fd/metal/pipe/Entered(mob/living/M)
	. = ..()
	if(!istype(M))
		return

	for(var/obj/structure/lattice/catwalk/C in get_turf(M))
		return

	if(prob(30) && M.m_intent == MOVE_INTENT_RUN && M.body_position != LYING_DOWN)
		M.slip(5, M.loc, GALOSHES_DONT_HELP, 0, FALSE)
		playsound(M, 'sound/effects/bang.ogg', 10, 1)
		to_chat(usr, "<span class='warning'>You trip on the pipes!</span>")
		return

/turf/open/floor/fd/metal/pipe/corner
	icon_state = "pipe_corner"

/turf/open/floor/fd/metal/pipe/intersection
	icon_state = "pipe_intersection"
