#define WALL_SMOOTHING SMOOTH_GROUP_FD_SIDEWALK, SMOOTH_GROUP_FD_LOW_WALL, SMOOTH_CORNERS, SMOOTH_GROUP_WALLS
#define DESERT_SMOOTHING SMOOTH_GROUP_FD_DESERT, SMOOTH_GROUP_FD_SIDEWALK, SMOOTH_GROUP_FD_TILE, SMOOTH_GROUP_FD_SNOW, SMOOTH_GROUP_FD_ROAD

#define TURF_LAYER_SNOW 2.003
#define TURF_LAYER_SNOW_BORDER 2.2

#define TURF_LAYER_ROAD 2.002
#define TURF_LAYER_ROAD_BORDER 2.0021
#define TURF_LAYER_ROAD_DECAL 2.00201

#define TURF_LAYER_DESERT 2.001
#define TURF_LAYER_DESERT_BORDER 2.0011

#define TURF_LAYER_ICE 2.001 //if someone puts ice and desert together im going to blow their brains out
#define TURF_LAYER_ICE_BORDER 2.0011

/turf/closed
	plane = WALL_PLANE
	var/frill_icon

/turf/closed/Initialize(mapload)
	. = ..()
	if(frill_icon)
		AddElement(/datum/element/frill, frill_icon)

//WALLS, ALOT//

//Wood

/turf/closed/indestructible/reinforced/wood/logs
	name = "log wall"
	desc = "A bright wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/woodfresh.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	frill_icon = 'fd/icons/mojave_turfs/walls/woodfresh_frill.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

/turf/closed/indestructible/reinforced/wood/logs/darker
	desc = "A darker wooden wall. It has some age."
	icon = 'fd/icons/mojave_turfs/walls/wood.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/wood_frill.dmi'

/turf/closed/indestructible/reinforced/wood/planks
	name = "wooden wall"
	desc = "A bright white wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	frill_icon = 'fd/icons/mojave_turfs/walls/drought/siding_frill.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

/turf/closed/indestructible/reinforced/wood/planks/blue
	name = "wooden wall"
	desc = "A blue wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding_blue.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/drought/siding_blue_frill.dmi'

/turf/closed/indestructible/reinforced/wood/planks/green
	name = "wooden wall"
	desc = "A green wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding_green.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/drought/siding_green_frill.dmi'

/turf/closed/indestructible/reinforced/wood/planks/red
	name = "wooden wall"
	desc = "A red wooden wall. Pretty new looking."
	icon = 'fd/icons/mojave_turfs/walls/drought/siding_red.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/drought/siding_red_frill.dmi'

//Brick

/turf/closed/indestructible/reinforced/brick
	name = "brick wall"
	desc = "A brown-red brick wall."
	icon = 'fd/icons/mojave_turfs/walls/brick.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	frill_icon = 'fd/icons/mojave_turfs/walls/brick_frill.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

/turf/closed/indestructible/reinforced/brick/darker
	icon = 'fd/icons/mojave_turfs/walls/brickalt.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/brickalt_frill.dmi'

/turf/closed/indestructible/reinforced/brick/gray
	name = "brick wall"
	desc = "A gray brick wall."
	icon = 'fd/icons/mojave_turfs/walls/brickgray.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/brickgray_frill.dmi'

/turf/closed/indestructible/reinforced/brick/moulded
	name = "moulded brick wall"
	desc = "A grayish wall. This one probably built a long time ago."
	icon = 'fd/icons/mojave_turfs/walls/drought/prison.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/drought/prison_frill.dmi'

//Concrete

/turf/closed/indestructible/reinforced/concrete
	name = "concrete wall"
	desc = "A bright concrete wall."
	icon = 'fd/icons/mojave_turfs/walls/concrete.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	frill_icon = 'fd/icons/mojave_turfs/walls/concrete_frill.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

/turf/closed/indestructible/reinforced/concrete/blue
	desc = "A bright blue concrete wall."
	icon = 'fd/icons/mojave_turfs/walls/concretealt.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/concretealt_frill.dmi'

//Metal

/turf/closed/indestructible/reinforced/metal
	name = "metal wall"
	desc = "A pretty much impenetrable piece of metal."
	icon = 'fd/icons/mojave_turfs/walls/dungeon_1.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/dungeon_1_frill.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

/turf/closed/indestructible/reinforced/metal/rusted
	name = "rusted metal wall"
	icon = 'fd/icons/mojave_turfs/walls/dungeon_rust_1.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/dungeon_rust_1_frill.dmi'

/turf/closed/indestructible/reinforced/metal/rusted/industrial
	icon = 'fd/icons/mojave_turfs/walls/rusty_industrial.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/rusty_industrial_frill.dmi'

/turf/closed/indestructible/reinforced/metal/rusted/newish
	icon = 'fd/icons/mojave_turfs/walls/rustmetal.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/rustmetal_frill.dmi'

/turf/closed/indestructible/reinforced/metal/rusted/newish_grooved
	icon = 'fd/icons/mojave_turfs/walls/rrustmetal.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/rrustmetal_frill.dmi'

/turf/closed/indestructible/reinforced/metal/vault
	icon = 'fd/icons/mojave_turfs/walls/vault_wall.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/vault_wall_frill.dmi'

/turf/closed/indestructible/reinforced/metal/vault_alt
	icon = 'fd/icons/mojave_turfs/walls/vault_vent.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/vault_vent_frill.dmi'

/turf/closed/indestructible/reinforced/metal/newish
	icon = 'fd/icons/mojave_turfs/walls/metal.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/metal_frill.dmi'

/turf/closed/indestructible/reinforced/metal/newish_grooved
	name = "reinforced metal wall"
	icon = 'fd/icons/mojave_turfs/walls/rmetal.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/rmetal_frill.dmi'

//Other

/turf/closed/indestructible/reinforced/other/bunker
	name = "old bunker wall"
	desc = "A concrete-like wall. Pretty much impenetrable."
	icon = 'fd/icons/mojave_turfs/walls/bunker.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/bunker_frill.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

/turf/closed/indestructible/reinforced/other/sewer
	name = "old sewer wall"
	desc = "A concrete-like wall. It smells not that good, honestly."
	icon = 'fd/icons/mojave_turfs/walls/sewer.dmi'
	frill_icon = 'fd/icons/mojave_turfs/walls/sewer_frill.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_WALL)
	canSmoothWith= list(SMOOTH_GROUP_FD_WALL)

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

//A plating that can't be destroyed but can have stuff like floor tiles slapped on for construction

//Ground

/turf/open/floor/plating/fd/ReplaceWithLattice()
	return //No lattice please - this might break things

/turf/open/floor/plating/fd/ground
	name = "ground"
	desc = "Some really hard ground. Looks like you can't destroy this for sure."
	baseturfs = /turf/open/floor/plating/fd/ground
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	//Used for larger than 32x border icons
	var/border_icon

/turf/open/floor/plating/fd/ground/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/fd/ground/break_tile()
	return //unbreakable

/turf/open/floor/plating/fd/ground/burn_tile()
	return //unburnable

/turf/open/floor/plating/fd/ground/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/fd/ground/MakeDry()
	return

/turf/open/floor/plating/dirt/fd
	baseturfs = /turf/open/floor/plating/fd/ground
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	slowdown = 0.5

/turf/open/floor/plating/fd/ground/desert
	name = "\proper desert"
	desc = "A stretch of desert."
	icon = 'fd/icons/mojave_turfs/64x/drought_1.dmi'
	icon_state = "dirt-255"
	base_icon_state = "dirt"
	slowdown = 0.7 //Hard and very dry ground. Not as hard to walk on as sand
	baseturfs = /turf/open/floor/plating/fd/ground/desert
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_DESERT)
	canSmoothWith = list(DESERT_SMOOTHING)
	layer = TURF_LAYER_DESERT
	var/digResult = /obj/item/stack/ore/glass //Sounds like a whole lot of not my problem at this very second
	var/dug = FALSE

/turf/open/floor/plating/fd/ground/desert/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

/turf/open/floor/plating/fd/ground/desert/update_icon()
	. = ..()
	var/rand_icon = rand(1,3)
	switch(rand_icon)
		if(1)
			icon = 'fd/icons/mojave_turfs/64x/drought_1.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/drought_1_border.dmi'
		if(2)
			icon = 'fd/icons/mojave_turfs/64x/drought_2.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/drought_2_border.dmi'
		if(3)
			icon = 'fd/icons/mojave_turfs/64x/drought_3.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/drought_3_border.dmi'

	add_overlay(image(border_icon, icon_state, TURF_LAYER_DESERT_BORDER, pixel_x = -16, pixel_y = -16))

/turf/open/floor/plating/fd/ground/desertalt
	icon = 'fd/icons/mojave_turfs/ground.dmi'
	icon_state = "desert_1"
	baseturfs = /turf/open/floor/plating/fd/ground/desertalt
	smoothing_groups = list(SMOOTH_GROUP_FD_DESERT)
	canSmoothWith = list(SMOOTH_GROUP_FD_DESERT)
	layer = TURF_LAYER

/turf/open/floor/plating/fd/ground/desertalt/Initialize()
	. = ..()
	icon_state = "desert_[rand(1,3)]"

/turf/open/floor/plating/fd/ground/snow
	name = "snow"
	desc = "Fresh powder."
	icon = 'fd/icons/mojave_turfs/64x/snow_1.dmi'
	icon_state = "snow-255"
	base_icon_state = "snow"
	slowdown = 1
	footstep = FOOTSTEP_SAND
	baseturfs = /turf/open/floor/plating/fd/ground/snow
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_SNOW)
	canSmoothWith = list(SMOOTH_GROUP_FD_SNOW, SMOOTH_GROUP_FD_TILE)
	layer = TURF_LAYER_SNOW
	var/digResult = /obj/item/stack/sheet/mineral/snow
	var/dug = FALSE
	var/area/curr_area = null

/turf/open/floor/plating/fd/ground/snow/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)
	curr_area = get_area(src)

/turf/open/floor/plating/fd/ground/snow/update_icon()
	. = ..()
	var/rand_icon = rand(1,3)
	switch(rand_icon)
		if(1)
			icon = 'fd/icons/mojave_turfs/64x/snow_1.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/snow_1_border.dmi'
		if(2)
			icon = 'fd/icons/mojave_turfs/64x/snow_2.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/snow_2_border.dmi'
		if(3)
			icon = 'fd/icons/mojave_turfs/64x/snow_3.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/snow_3_border.dmi'

	add_overlay(image(border_icon, icon_state, TURF_LAYER_SNOW_BORDER, pixel_x = -16, pixel_y = -16))

/turf/open/floor/plating/fd/ground/snow/attackby(obj/item/W, mob/user, params)
	return

/turf/open/floor/plating/fd/ground/snow/dug
	name = "paved snow"
	desc = "Freshly paved out snow."
	icon = 'fd/icons/mojave_turfs/64x/snow_paved.dmi'
	border_icon = 'fd/icons/mojave_turfs/64x/snow_1_border.dmi'
	dug = TRUE
	slowdown = 0.65

/turf/open/floor/plating/fd/ground/mountain
	name = "mountain"
	desc = "Damp cave flooring."
	baseturfs = /turf/open/floor/plating/fd/ground/mountain
	icon = 'fd/icons/mojave_turfs/cave.dmi'
	icon_state = "cave_1"
	slowdown = 0.1
	var/area/curr_area = null
	var/variants = 7

/turf/open/floor/plating/fd/ground/mountain/Initialize()
	. = ..()
	icon_state = "cave_[rand(1,(variants))]"
	curr_area = get_area(src)

/turf/open/floor/plating/fd/ground/mountain/drought
	name = "mountain"
	desc = "Dry cave flooring. Red dust kicks up as you walk by it."
	baseturfs = /turf/open/floor/plating/fd/ground/mountain/drought
	icon = 'fd/icons/mojave_turfs/cave_drought.dmi'
	icon_state = "cave_1"
	slowdown = 0.20
	variants = 8

//Roads

/turf/open/floor/plating/fd/ground/road
	name = "\proper road"
	desc = "A stretch of road."
	baseturfs = /turf/open/floor/plating/fd/ground/road
	icon = 'fd/icons/mojave_turfs/64x/road_1.dmi'
	icon_state = "road-255"
	base_icon_state = "road"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_ROAD)
	canSmoothWith = list(SMOOTH_GROUP_FD_ROAD, SMOOTH_GROUP_FD_SIDEWALK, SMOOTH_GROUP_FD_TILE, SMOOTH_GROUP_FD_SNOW, SMOOTH_GROUP_FD_OPENSPACE)
	layer = TURF_LAYER_ROAD

/turf/open/floor/plating/fd/ground/road/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

/turf/open/floor/plating/fd/ground/road/update_icon()
	. = ..() //Inheritance required for road decals
	var/rand_icon = rand(1,3)
	var/crack_randomiser = "crack_[rand(1,24)]"
	var/road_randomiser = rand(-10,10)
	var/direction_randomiser = rand(0,8)

	switch(rand_icon)
		if(1)
			icon = 'fd/icons/mojave_turfs/64x/road_1.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/road_1_border.dmi'
		if(2)
			icon = 'fd/icons/mojave_turfs/64x/road_2.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/road_2_border.dmi'
		if(3)
			icon = 'fd/icons/mojave_turfs/64x/road_3.dmi'
			border_icon = 'fd/icons/mojave_turfs/64x/road_3_border.dmi'

	if(prob(20))
		add_overlay(image('fd/icons/mojave_turfs/road.dmi', crack_randomiser, TURF_LAYER_ROAD_DECAL, direction_randomiser, road_randomiser, road_randomiser))

	add_overlay(image(border_icon, icon_state, TURF_LAYER_ROAD_BORDER, pixel_x = -16, pixel_y = -16))


//Sidewalks

/turf/open/floor/plating/fd/ground/sidewalk
	name = "sidewalk"
	desc = "Paved tiles specifically designed for walking upon."
	baseturfs = /turf/open/floor/plating/fd/ground/sidewalk
	icon = 'fd/icons/mojave_turfs/sidewalk.dmi'
	icon_state = "sidewalk-255"
	base_icon_state = "sidewalk"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_SIDEWALK)
	canSmoothWith = list(SMOOTH_GROUP_FD_SIDEWALK, WALL_SMOOTHING, SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_DESERT, SMOOTH_GROUP_FD_TILE)

/turf/open/floor/plating/fd/ground/sidewalk/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)

//Roofing

/turf/open/floor/plating/fd/roof
	name = "roof"
	desc = "Old roofing."
	icon = 'fd/icons/mojave_turfs/roof_asphalt.dmi'
	icon_state = "roof-255"
	base_icon_state = "roof"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_ROOF_NORMAL)
	canSmoothWith = list(SMOOTH_GROUP_FD_ROOF_NORMAL, WALL_SMOOTHING)

/turf/open/floor/plating/fd/roof/noborder //for holes and stuff
	icon = 'fd/icons/mojave_turfs/roof_asphalt_noborder.dmi'

/turf/open/floor/plating/fd/roof/sheet
	icon = 'fd/icons/mojave_turfs/roof_sheet.dmi'
	smoothing_groups = list(SMOOTH_GROUP_FD_ROOF_SHEET, SMOOTH_GROUP_FD_ROOF_SHEET)
	canSmoothWith = list(SMOOTH_GROUP_FD_ROOF_SHEET, WALL_SMOOTHING)

/turf/open/floor/plating/fd/roof/sheet/noborder //for holes and stuff
	icon = 'fd/icons/mojave_turfs/roof_sheet_noborder.dmi'

/turf/open/floor/plating/fd/roof/metal
	footstep = FOOTSTEP_FLOOR
	icon = 'fd/icons/mojave_turfs/roof_metal.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_ROOF_METAL)
	canSmoothWith = list(SMOOTH_GROUP_FD_ROOF_METAL, WALL_SMOOTHING)

/turf/open/floor/plating/fd/roof/metal/rusty
	icon = 'fd/icons/mojave_turfs/roof_rusty.dmi'

/turf/open/floor/plating/fd/roof/wood
	icon = 'fd/icons/mojave_turfs/roof_wood.dmi'
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_ROOF_WOOD)
	canSmoothWith = list(SMOOTH_GROUP_FD_ROOF_WOOD, WALL_SMOOTHING)

//Ice

/turf/open/floor/plating/fd/ground/ice
	name = "ice"
	desc = "A dangerous ice sheet, tread carefully."
	icon = 'fd/icons/mojave_turfs/64x/ice_1.dmi'
	icon_state = "ice-255"
	base_icon_state = "ice"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_FD_ICE)
	canSmoothWith = list(SMOOTH_GROUP_FD_ICE, SMOOTH_GROUP_FD_SIDEWALK, WALL_SMOOTHING, SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FD_DESERT, SMOOTH_GROUP_FD_TILE, SMOOTH_GROUP_FD_SNOW, SMOOTH_GROUP_FD_ROAD)
	layer = TURF_LAYER_ICE
	baseturfs = /turf/open/floor/plating/fd/ground/ice/cracked

/turf/open/floor/plating/fd/ground/ice/cracked
	baseturfs = /turf/open/floor/plating/fd/ground/ice/morecracked
	icon = 'fd/icons/mojave_turfs/64x/ice_2.dmi'

/turf/open/floor/plating/fd/ground/ice/morecracked
	baseturfs = /turf/open/floor/plating/fd/ground/ice/morecracked
	icon = 'fd/icons/mojave_turfs/64x/ice_3.dmi'

/turf/open/floor/plating/fd/ground/ice/Initialize()
	. = ..()
	addtimer(CALLBACK(src, /atom/.proc/update_icon), 1)
	MakeSlippery(TURF_WET_WATER, INFINITY, 0, INFINITY, TRUE, overlay = FALSE)

/turf/open/floor/plating/fd/ground/ice/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent, overlay)
	AddComponent(/datum/component/wet_floor, wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent, overlay)

/turf/open/floor/plating/fd/ground/ice/update_icon()
	. = ..()
	add_overlay(image('fd/icons/mojave_turfs/64x/ice_border.dmi', icon_state, TURF_LAYER_ICE_BORDER, pixel_x = -16, pixel_y = -16))

//Openspace

//This functions like normal openspace but prevents placing lattice, so people cannot cheese catwalks or floors clear across the map.
/turf/open/openspace/fd
	icon = 'fd/icons/mojave_turfs/ground.dmi'
	icon_state = "transparent" //Different icon so it's visually distinct for mappers.
	can_build_on = FALSE
	can_cover_up = FALSE
	smoothing_groups = list(SMOOTH_GROUP_FD_OPENSPACE)

/turf/open/openspace/fd/Initialize()
	. = ..()
	icon = 'icons/turf/floors.dmi'
	icon_state = "invisible" //Reset to original icon so it doesn't darken things when viewed in game.

//Wallpapers and Wall Coverings

/obj/effect/turf_decal/fd/covering
	icon = 'fd/icons/wallcovering.dmi'

//Wallpapers

/obj/effect/turf_decal/fd/covering/wallpaper/green
	icon_state = "wallpaper_green"

/obj/effect/turf_decal/fd/covering/wallpaper/blue
	icon_state = "wallpaper_blue"

/obj/effect/turf_decal/fd/covering/wallpaper/blue/stripes
	icon_state = "wallpaper_stripes"

/obj/effect/turf_decal/fd/covering/wallpaper/red
	icon_state = "wallpaper_red"

//Tiles

/obj/effect/turf_decal/fd/covering/tiles/blue
	icon_state = "tiles_cyan"

/obj/effect/turf_decal/fd/covering/tiles/white
	icon_state = "tiles_white"

//Paint

/obj/effect/turf_decal/fd/covering/paint/gray
	icon_state = "paint_gray"

/obj/effect/turf_decal/fd/covering/paint/white
	icon_state = "paint_white"

/obj/effect/turf_decal/fd/covering/paint/red
	icon_state = "paint_red"

/obj/effect/turf_decal/fd/covering/paint/yellow
	icon_state = "paint_yellow"

/obj/effect/turf_decal/fd/covering/paint/green
	icon_state = "paint_green"

/obj/effect/turf_decal/fd/covering/paint/blue
	icon_state = "paint_blue"
