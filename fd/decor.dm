/obj/structure/fd/toilet
	name = "toilet"
	desc = "An old toilet. It's obviously seen better years, alas you think you can still see some water in it. Care for a drink?"
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "toilet"
	density = FALSE
	anchored = TRUE

/obj/structure/sink/fd
	name = "sink"
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "sink"
	desc = "An old sink, typically dispensing clean water. Hard to really tell if it's the case anymore, though."
	dispensedreagent = /datum/reagent/water
	has_water_reclaimer = TRUE
	reclaim_rate = 0.1

/obj/machinery/shower/fd
	name = "shower"
	desc = "An old shower, there must still be some water in the tank since it works, but you probably shouldn't leave your mouth open whilst using it."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "shower"

/obj/structure/mirror/fd
	desc = "A dust stained reflective mirror, you can sort of make out your reflection in it."
	icon = 'fd/icons/mojave_structures/32x64_tall_furniture.dmi'
	max_integrity = 100

/obj/structure/mirror/fd/Initialize()
	. = ..()
	AddElement(/datum/element/wall_mount)

/obj/structure/railing/fd
	name = "base state FD guard rail"
	icon = 'fd/icons/mojave_structures/railings.dmi'
	plane = WALL_PLANE
	layer = CLOSED_TURF_LAYER
	max_integrity = 150
	climbable = FALSE //so we can override TG

/obj/structure/railing/fd/Initialize()
	. = ..()
	if(dir == SOUTH)
		layer = ABOVE_ALL_MOB_LAYER
	if(dir == NORTH)
		layer = ABOVE_ALL_MOB_LAYER

	AddElement(/datum/element/climbable, climb_time = 3 SECONDS, climb_stun = 0)

/obj/structure/railing/fd/solo
	name = "guard rail"
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building"
	icon_state = "civ_solo"

/obj/structure/railing/fd/solo/industrial
	desc = "A sturdy rail setup with multiple functions, including but not limited to: ensuring you dont fly off the top of a four story tall building. It's got a slick orange taint, so you know it's to workplace regulations."
	icon_state = "indus_solo"

/obj/structure/railing/fd/sewer
	name = "guard rail"
	desc = "A rusty guard rail used to prevent you from falling into the region's sewage. Thank the lord it's there."
	icon_state = "railings_sewer"

// Fences. Huzzah! //
/obj/structure/railing/fd/wood
	name = "wooden fence"
	desc = "A classic wooden fence. It doesn't get more homely than this."
	icon_state = "wood_full"

/obj/structure/railing/fd/wood/ending
	icon_state = "wood_end"

/obj/structure/railing/fd/wood/single
	icon_state = "wood_solo"

/obj/structure/railing/fd/wood/snow
	name = "wooden fence"
	desc = "A classic wooden fence. It doesn't get more homely than this."
	icon_state = "wood_snow_full"

/obj/structure/railing/fd/wood/snow/ending
	icon_state = "wood_snow_end"

/obj/structure/railing/fd/wood/snow/single
	icon_state = "wood_snow_solo"

// TV

/obj/structure/fd/tv
	name = "base class FD television"
	desc = "A message asking the audience to please not use this asset appears on screen."
	icon = 'fd/icons/mojave_structures/television.dmi'
	icon_state = "radking_tv"
	max_integrity = 225
	density = TRUE
	anchored = TRUE

/obj/structure/fd/tv/rad_king
	name = "\improper King television"
	desc = "A very popular King television set from before days. Now just collecting dust."
	icon_state = "radking_tv"

/obj/structure/fd/tv/wooden
	name = "wood television console"
	desc = "A television console made of wood. This was probably an antique long before the bombs dropped."
	icon_state = "wood_tv"

/obj/structure/fd/tv/wooden/red
	icon_state = "redwood_tv"

/obj/structure/fd/tv/wooden/cabinet
	name = "television cabinet"
	desc = "A wood cabinet containing a television inside."
	icon_state = "cabinet_tv"

/obj/structure/fd/tv/tube
	name = "tube television"
	desc = "A classic tube television. You're not exactly sure why it's called a tube television."
	icon_state = "tube_tv"

/obj/structure/fd/tv/tube/small
	name = "small tube television"
	desc = "A small tube television. You're not exactly sure why it's called a tube television."
	icon_state = "small_tv"

/obj/structure/fd/tv/tube/tiny
	name = "tiny television"
	desc = "A very small TV. Perhaps made for a very small person."
	icon_state = "tiny_tv"

// Phones

/obj/structure/fd/pay_phone
	name = "payphone"
	desc = "A long unused and dead payphone, sure as hell ain't anyone to call on this thing no more."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "payphone"
	max_integrity = 250
	density = TRUE
	anchored = TRUE

/obj/structure/fd/pay_phone/withthephone
	icon_state = "payphone_alt"

/obj/structure/fd/phone
	name = "phone"
	desc = "A dusty and scuffed phone. You don't think it'll work again."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "phone_red"
	max_integrity = 100
	density = FALSE
	anchored = TRUE

/obj/structure/fd/phone/black
	icon_state = "phone_black"

// Storage

/obj/structure/fd/storage
	name = "generic FD storage"
	desc = "You place stuff on/in/or around it or it pretends to at least, pretty generic right."
	icon = 'fd/icons/mojave_structures/32x64_tall_furniture.dmi'
	armor = list(MELEE = 30, BULLET = 40, LASER = 10, ENERGY = 10, BOMB = 25, BIO = 100,  FIRE = 80, ACID = 100)
	density = TRUE
	anchored = TRUE
	max_integrity = 225

/obj/structure/fd/storage/store
	name = "store shelf"
	desc = "A proud american consumerism displayer, seems commercialism wasn't fully wiped out as intended."
	icon_state = "store_shelf"

/obj/structure/fd/storage/store/metal
	icon_state = "store_shelf_metal"

/obj/structure/fd/storage/bookshelf
	name = "bookshelf"
	desc = "Holder of knowledge, master of all."
	icon_state = "bookshelf"

/obj/structure/fd/storage/shelf
	name = "metal shelf"
	desc = "Used for storing just about anything you could think of, this one is in good condition."
	icon_state = "metal_shelf"
	opacity = FALSE

/obj/structure/fd/storage/shelf/wood
	name = "wood shelf"
	desc = "Used for storing just about anything you could think of."
	icon_state = "wood_shelf"

/obj/structure/fd/storage/shelf/wood/alt
	icon_state = "wood_shelf-alt"

/obj/structure/fd/storage/large
	name = "generic large FD storage"
	bound_width = 64
	icon = 'fd/icons/mojave_structures/64x64_large_furniture.dmi'
	max_integrity = 300

/obj/structure/fd/storage/large/Initialize()
	switch(dir)
		if(SOUTH, NORTH)
			bound_width = 64
			bound_height = 32
			bound_x = 0
		if(EAST, WEST)
			bound_width = 32
			bound_height = 64
			bound_x = 0
	. = ..()

/obj/structure/fd/storage/large/shelf
	name = "metal shelf"
	desc = "An extra large, heavy-duty shelf, used for storing just about anything you could think of, this one is in good condition."
	icon_state = "metal_shelf"
	opacity = FALSE

/obj/structure/fd/storage/large/shelf/wood
	name = "wood shelf"
	desc = "An extra large, wood shelf, used for storing just about anything you could think of while upkeeping your rustic tones."
	icon_state = "wood_shelf"

/obj/structure/fd/storage/large/shelf/wood/alt
	icon_state = "wood_shelf-alt"

/obj/structure/fd/storage/large/shelf/wood/drawers
	name = "wood shelf"
	desc = "A large wooden shelf set. There are drawers below for additional storage."
	icon_state = "wood_shelf_big"

/obj/structure/fd/storage/large/clothing
	name = "clothing rack"
	desc = "And they say fashion is dead."
	icon_state = "clothing_rack"
	max_integrity = 250

/obj/structure/fd/storage/large/medical
	name = "metal shelf"
	desc = "A wheeled shelfing unit. It has wheels for easy mass transport of items- Too bad the wheels are all worn out considerably."
	icon_state = "medshelves"

/obj/structure/fd/storage/large/shop
	name = "metal shelf"
	desc = "Layered metal shelfs, exceptionally tall and wide, prime for loose item storage."
	icon_state = "shelf_shop"


/obj/structure/fd/storage/large/showcase
	name = "showcase shelf"
	desc = "A pyramid of shelving units, ready to display wares to the eager world."
	icon_state = "showcase"

// Dresser Stuff

/obj/structure/dresser/fd
	name = "dresser"
	desc = "A nicely-crafted steel dresser. It's filled with lots of undies."
	icon = 'fd/icons/mojave_structures/cabinets.dmi'
	var/dresser_type = "circabinet_orange"
	max_integrity = 225
	pixel_y = 12

/obj/structure/dresser/fd/attack_hand(mob/user)
	icon_state = "[dresser_type]-open"
	update_icon()
	if(!Adjacent(user))//no tele-grooming
		icon_state = "[dresser_type]"
		return
	. = ..()
	if(.)
		return
	icon_state = "[dresser_type]"
	update_icon()

/obj/structure/dresser/fd/torquise
	dresser_type = "circabinet_torquise"
	icon_state = "circabinet_torquise"

/obj/structure/dresser/fd/torquise/tall
	icon_state = "circabinet_torquise_tall"
	dresser_type = "circabinet_torquise_tall"

/obj/structure/dresser/fd/orange
	icon_state = "circabinet_orange"
	dresser_type = "circabinet_orange"

/obj/structure/dresser/fd/orange/tall
	icon_state = "circabinet_orange_tall"
	dresser_type = "circabinet_orange_tall"

// Filing Cabinets

/obj/structure/filingcabinet/fd
	name = "filing cabinet"
	desc = "Perfect for filing with paper dust."
	icon = 'fd/icons/mojave_structures/cabinets.dmi'
	icon_state = "filing_cabinet"
	max_integrity = 150

/obj/structure/filingcabinet/fd/busted
	icon_state = "filing_cabinet_busted"

/obj/structure/filingcabinet/fd/empty
	icon_state = "filing_cabinet_empty"

/obj/structure/filingcabinet/fd/short
	icon_state = "filing_cabinet_small"
	pixel_y = -5

/obj/structure/filingcabinet/fd/short/busted
	icon_state = "filing_cabinet_small_busted"

// Broken Jukebox

/obj/structure/fd/jukebox
	name = "broken jukebox"
	desc = "A very old jukebox from before the days. Broken beyond repair, but could perhaps be salvaged for parts."
	icon = 'fd/icons/mojave_objects/hamradio.dmi'
	icon_state = "jukebox_off"
	max_integrity = 350
	density = TRUE
	anchored = TRUE

// Plant decor

/obj/structure/fd/pot
	name = "plant pot"
	desc = "An old ceramic plant pot. It has faint cracks lining it in random patterns, but it holds strong."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "pot_1"
	max_integrity = 50
	density = FALSE
	anchored = TRUE

/obj/structure/fd/pot/plant
	name = "plant pot"
	desc = "An old ceramic plant pot. It has faint cracks lining it in random patterns, but it holds strong. There is a dead plant in it."
	icon_state = "pot_2"

/obj/structure/fd/pot/plant/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "[initial(icon_state)]_[rand(2,4)]"

// Grocery Store Displays

/obj/structure/fd/deli
	name = "deli stand"
	desc = "Hot food used to be served here to customers, now nothing is left."
	icon = 'fd/icons/mojave_structures/stand_deli.dmi'
	icon_state = "deli_stand"
	density = TRUE
	anchored = TRUE
	max_integrity = 200

/obj/structure/fd/fruit_empty
	name = "fruit stand"
	desc = "These stands used to be full of the freshest fruit from all over."
	icon = 'fd/icons/mojave_structures/stand_fruit.dmi'
	icon_state = "fruitstand_empty"
	density = TRUE
	anchored = TRUE
	max_integrity = 200

/obj/structure/fd/fruit_empty/fake
	name = "fruit stand"
	desc = "Wait, fruit...? What the f- It's fake!"
	var/fruit_type = 1

/obj/structure/fd/fruit_empty/fake/Initialize()
	fruit_type = rand(1,3)
	icon_state = "fruitstand-[fruit_type]"
	return ..()

//Decorative and flavor/fluff things.

//street//

/obj/structure/filingcabinet/fd/mail
	name = "postbox"
	desc = "Last pickup, October XXXX."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "mailbox"
	pixel_y = 12

/obj/structure/filingcabinet/fd/mail/old
	icon_state = "mailbox_old"

/obj/structure/fd/storage/trashcan
	name = "trash can"
	desc = "An old trash can, used for getting the filth anywhere other than the street. Not that people care about that much, these days."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "trashbin"
	anchored = FALSE
	pixel_y = 10

/obj/structure/fd/storage/trashcan/Initialize()
	. = ..()
	if(prob(25))
		icon_state = "[initial(icon_state)]-[rand(1,3)]"
		return

//Decorative Cable, functional WYCI//

/obj/structure/fd/cable
	name = "cable"
	icon = 'fd/icons/mojave_objects/cables.dmi'
	density = FALSE

/obj/structure/fd/cable/red
	icon_state = "cable_red_straight"

/obj/structure/fd/cable/red/curve
	icon_state = "cable_red_curved"

/obj/structure/fd/cable/red/intersection
	icon_state = "cable_red_intersect"

/obj/structure/fd/cable/red/connector
	icon_state = "cable_red_connector"

/obj/structure/fd/cable/red/splice
	icon_state = "cable_red_spliced"

/obj/structure/fd/cable/blue
	icon_state = "cable_blue_straight"

/obj/structure/fd/cable/blue/curve
	icon_state = "cable_blue_curved"

/obj/structure/fd/cable/blue/intersection
	icon_state = "cable_blue_intersect"

/obj/structure/fd/cable/blue/connector
	icon_state = "cable_blue_connector"

/obj/structure/fd/cable/blue/splice
	icon_state = "cable_blue_spliced"

/obj/structure/fd/cable/green
	icon_state = "cable_green_straight"

/obj/structure/fd/cable/green/curve
	icon_state = "cable_green_curved"

/obj/structure/fd/cable/green/intersection
	icon_state = "cable_green_intersect"

/obj/structure/fd/cable/green/connector
	icon_state = "cable_green_connector"

/obj/structure/fd/cable/green/splice
	icon_state = "cable_green_spliced"

/obj/structure/fd/cable/black
	icon_state = "cable_black_straight"

/obj/structure/fd/cable/black/curve
	icon_state = "cable_black_curved"

/obj/structure/fd/cable/black/intersection
	icon_state = "cable_black_intersect"

/obj/structure/fd/cable/black/connector
	icon_state = "cable_black_connector"

/obj/structure/fd/cable/black/splice
	icon_state = "cable_black_spliced"

//Turf Decor//

/obj/structure/fd/turfdecor
	density = FALSE

/obj/structure/fd/turfdecor/drought //this shit looks whack af right now
	icon = 'fd/icons/mojave_structures/turf_decor.dmi'
	icon_state = "drought_1"

/obj/structure/fd/turfdecor/drought/Initialize()
	. = ..()
	icon_state = "drought_[rand(1,32)]"

	switch(icon_state)
		if("drought_31")
			name = "skull"
		else
			name = "rocks"

	var/matrix/M = new
	M.Translate(rand(-5,5),rand(-5,5))
	transform = M

// Medical Decoration //

/obj/structure/fd/medical_curtain
	name = "medical curtain"
	desc = "A vision blocker, used to shield eyes of the innocent from the sights of the deathly. These ones are secured firmly in the ground."
	icon = 'fd/icons/mojave_structures/medical.dmi'
	icon_state = "curtain"
	layer = ABOVE_OBJ_LAYER
	max_integrity = 100
	anchored = TRUE // If they're to be unanchored, you might as well make them toppleable. Go ahead, codersprite it...
	pixel_y = 12
	opacity = TRUE
	density = TRUE

// Skeletons //

/obj/structure/fd/skeleton
	name = "skeleton"
	desc = "The dust swept remains of a peoples long gone."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "skeleton"
	density = FALSE
	anchored = TRUE

// Barrels //

/obj/structure/fd/barrel
	name = "barrel"
	desc = "A sealed canister of mystery, closed to time."
	icon = 'fd/icons/mojave_structures/barrels.dmi'
	max_integrity = 400
	anchored = TRUE
	density = TRUE
	var/icon_type = null
	var/amount = 3 //used for icon randomisation amount
	var/unique = FALSE //used to set if the icon is randomised or not

/obj/structure/fd/barrel/Initialize()
	. = ..()
	if(!unique)
		icon_state = "[icon_type]_[rand(1, amount)]"

/obj/structure/fd/barrel/single

/obj/structure/fd/barrel/single/grey
	icon_state = "grey_1"
	icon_type = "grey"

/obj/structure/fd/barrel/single/grey/one
	icon_state = "grey_1"
	unique = TRUE

/obj/structure/fd/barrel/single/grey/two
	icon_state = "grey_2"
	unique = TRUE

/obj/structure/fd/barrel/single/grey/three
	icon_state = "grey_3"
	unique = TRUE

/obj/structure/fd/barrel/single/red
	icon_state = "red_1"
	icon_type = "red"

/obj/structure/fd/barrel/single/red/one
	icon_state = "red_1"
	unique = TRUE

/obj/structure/fd/barrel/single/red/two
	icon_state = "red_2"
	unique = TRUE

/obj/structure/fd/barrel/single/red/three
	icon_state = "red_3"
	unique = TRUE

/obj/structure/fd/barrel/single/yellow
	icon_state = "yellow_1"
	icon_type = "yellow"

/obj/structure/fd/barrel/single/yellow/one
	icon_state = "yellow_1"
	unique = TRUE

/obj/structure/fd/barrel/single/yellow/two
	icon_state = "yellow_2"
	unique = TRUE

/obj/structure/fd/barrel/single/yellow/three
	icon_state = "yellow_3"
	unique = TRUE

/obj/structure/fd/barrel/single/label
	icon_state = "label_1"
	icon_type = "label"

/obj/structure/fd/barrel/single/label/one
	icon_state = "label_1"
	unique = TRUE

/obj/structure/fd/barrel/single/label/two
	icon_state = "label_2"
	unique = TRUE

/obj/structure/fd/barrel/single/label/three
	icon_state = "label_3"
	unique = TRUE

/obj/structure/fd/barrel/single/hazard
	icon_state = "hazard_1"
	icon_type = "hazard"

/obj/structure/fd/barrel/single/hazard/one
	icon_state = "hazard_1"
	unique = TRUE

/obj/structure/fd/barrel/single/hazard/two
	icon_state = "hazard_2"
	unique = TRUE

/obj/structure/fd/barrel/single/hazard/three
	icon_state = "hazard_3"
	unique = TRUE

/obj/structure/fd/barrel/single/redalt
	icon_state = "red_alt_1"
	icon_type = "red_alt"

/obj/structure/fd/barrel/single/redalt/one
	icon_state = "red_alt_1"
	unique = TRUE

/obj/structure/fd/barrel/single/redalt/two
	icon_state = "red_alt_2"
	unique = TRUE

/obj/structure/fd/barrel/single/redalt/three
	icon_state = "red_alt_3"
	unique = TRUE

/obj/structure/fd/barrel/single/toxic
	icon_state = "toxic_1"
	icon_type = "toxic"
	amount = 4
	light_range = 1.5
	light_color = "#4ba54f"

/obj/structure/fd/barrel/single/toxic/one
	icon_state = "toxic_1"
	unique = TRUE

/obj/structure/fd/barrel/single/toxic/two
	icon_state = "toxic_2"
	unique = TRUE

/obj/structure/fd/barrel/single/toxic/three
	icon_state = "toxic_3"
	unique = TRUE

/obj/structure/fd/barrel/single/toxic/four
	icon_state = "toxic_4"
	unique = TRUE

/obj/structure/fd/barrel/single/waste
	icon_state = "waste_1"
	icon_type = "waste"

/obj/structure/fd/barrel/single/waste/one
	icon_state = "waste_1"
	unique = TRUE

/obj/structure/fd/barrel/single/waste/two
	icon_state = "waste_2"
	unique = TRUE

/obj/structure/fd/barrel/single/waste/three
	icon_state = "waste_3"
	unique = TRUE

/obj/structure/fd/barrel/single/flammable
	icon_state = "flammable_1"
	icon_type = "flammable"

/obj/structure/fd/barrel/single/flammable/one
	icon_state = "flammable_1"
	unique = TRUE

/obj/structure/fd/barrel/single/flammable/two
	icon_state = "flammable_2"
	unique = TRUE

/obj/structure/fd/barrel/single/flammable/three
	icon_state = "flammable_3"
	unique = TRUE

/obj/structure/fd/barrel/single/warning
	icon_state = "warning_1"
	icon_type = "warning"

/obj/structure/fd/barrel/single/warning/one
	icon_state = "warning_1"
	unique = TRUE

/obj/structure/fd/barrel/single/warning/two
	icon_state = "warning_2"
	unique = TRUE

/obj/structure/fd/barrel/single/warning/three
	icon_state = "warning_3"
	unique = TRUE

/obj/structure/fd/barrel/double
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 2

/obj/structure/fd/barrel/double/grey
	icon_state = "double_grey_1"
	icon_type = "double_grey"

/obj/structure/fd/barrel/double/grey/one
	icon_state = "double_grey_1"
	unique = TRUE

/obj/structure/fd/barrel/double/grey/two
	icon_state = "double_grey_2"
	unique = TRUE

/obj/structure/fd/barrel/double/red
	icon_state = "double_red_1"
	icon_type = "double_red"

/obj/structure/fd/barrel/double/red/one
	icon_state = "double_red_1"
	unique = TRUE

/obj/structure/fd/barrel/double/red/two
	icon_state = "double_red_2"
	unique = TRUE

/obj/structure/fd/barrel/double/yellow
	icon_state = "double_yellow_1"
	icon_type = "double_yellow"

/obj/structure/fd/barrel/double/yellow/one
	icon_state = "double_yellow_1"
	unique = TRUE

/obj/structure/fd/barrel/double/yellow/two
	icon_state = "double_yellow_2"
	unique = TRUE

/obj/structure/fd/barrel/double/waste
	icon_state = "double_waste_1"
	icon_type = "double_waste"
	amount = 1

/obj/structure/fd/barrel/triple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."

/obj/structure/fd/barrel/triple/grey
	icon_state = "triple_grey_1"
	icon_type = "triple_grey"

/obj/structure/fd/barrel/triple/grey/one
	icon_state = "triple_grey_1"
	unique = TRUE

/obj/structure/fd/barrel/triple/grey/two
	icon_state = "triple_grey_2"
	unique = TRUE

/obj/structure/fd/barrel/triple/grey/three
	icon_state = "triple_grey_3"
	unique = TRUE

/obj/structure/fd/barrel/triple/red
	icon_state = "triple_red_1"
	icon_type = "triple_red"
	amount = 2

/obj/structure/fd/barrel/triple/red/one
	icon_state = "triple_red_1"
	unique = TRUE

/obj/structure/fd/barrel/triple/red/two
	icon_state = "triple_red_2"
	unique = TRUE

/obj/structure/fd/barrel/triple/yellow
	icon_state = "triple_yellow_1"
	icon_type = "triple_yellow"

/obj/structure/fd/barrel/triple/yellow/one
	icon_state = "triple_yellow_1"
	unique = TRUE

/obj/structure/fd/barrel/triple/yellow/two
	icon_state = "triple_yellow_2"
	unique = TRUE

/obj/structure/fd/barrel/triple/yellow/three
	icon_state = "triple_yellow_3"
	unique = TRUE

/obj/structure/fd/barrel/triple/waste
	icon_state = "triple_waste_1"
	icon_type = "triple_waste"
	amount = 2

/obj/structure/fd/barrel/triple/waste/one
	icon_state = "triple_waste_1"
	unique = TRUE

/obj/structure/fd/barrel/triple/waste/two
	icon_state = "triple_waste_2"
	unique = TRUE

/obj/structure/fd/barrel/quadruple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 1

/obj/structure/fd/barrel/quadruple/grey
	icon_state = "quad_grey_1"
	icon_type = "quad_grey"

/obj/structure/fd/barrel/quadruple/grey/one
	icon_state = "quad_grey_1"
	unique = TRUE

/obj/structure/fd/barrel/quadruple/red
	icon_state = "quad_red_1"
	icon_type = "quad_red"
	amount = 2

/obj/structure/fd/barrel/quadruple/red/one
	icon_state = "quad_red_1"
	unique = TRUE

/obj/structure/fd/barrel/quadruple/red/two
	icon_state = "quad_red_2"
	unique = TRUE

/obj/structure/fd/barrel/quadruple/yellow
	icon_state = "quad_yellow_1"
	icon_type = "quad_yellow"

/obj/structure/fd/barrel/quadruple/yellow/one
	icon_state = "quad_yellow_1"
	unique = TRUE

/obj/structure/fd/barrel/quadruple/waste
	icon_state = "quad_waste_1"
	icon_type = "quad_waste"

/obj/structure/fd/barrel/quadruple/waste/one
	icon_state = "quad_waste_1"
	unique = TRUE

// Wooden Pallets //

/obj/structure/fd/pallet
	name = "wooden pallet"
	desc = "A wooden pallet. You could get some good wood off that, probably."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "pallet"
	max_integrity = 100
	anchored = TRUE
	density = FALSE

/obj/structure/fd/pallet/stack
	name = "pallet stack"
	desc = "A stack of wooden pallets. Some good planks in there, still."
	icon_state = "pallet_stack"
	max_integrity = 250
	density = TRUE

// brix.... //

/obj/structure/fd/brickstack
	name = "brick stack"
	desc = "A stack of bricks. They're all stuck together... Great."
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'
	icon_state = "brickpile"
	max_integrity = 600
	density = TRUE
	anchored = TRUE

// TRASH.... //
/obj/structure/fd/trash
	name = "Base type FD TRASH"
	desc = "Who the hell littered this here? Call a mapper!"
	icon = 'fd/icons/mojave_structures/miscellaneous.dmi'

/obj/structure/fd/trash/papers
	name = "scattered pages"
	desc = "Some scattered paper pages. They look mostly ruined."
	icon_state = "scattered_papers"

/obj/structure/fd/trash/papers/one
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_1"

/obj/structure/fd/trash/papers/two
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_2"

/obj/structure/fd/trash/papers/three
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_3"

/obj/structure/fd/trash/books
	name = "ruined stack of books"
	desc = "A small stack of ruined books. A librarian's worst nightmare."
	icon_state = "bookstack_1"

/obj/structure/fd/trash/books/Initialize(mapload)
	. = ..()
	icon_state = pick("bookstack_1","bookstack_2","bookstack_3")

/obj/structure/fd/trash/books/pile
	name = "pile of books"
	desc = "A large, messy pile of ruined books. Would make any intellectual cry."
	icon_state = "bookpile_1"

/obj/structure/fd/trash/books/pile/Initialize(mapload)
	. = ..()
	icon_state = pick("bookpile_1","bookpile_2","bookpile_3")

/obj/structure/fd/trash/books/pile_alt
	name = "pile of books"
	desc = "A large, messy pile of ruined books. Would make any intellectual cry."
	icon_state = "bookpile_5"

/obj/structure/fd/trash/books/pile_alt/Initialize(mapload)
	. = ..()
	icon_state = pick("bookpile_4","bookpile_5","bookpile_6")

/obj/structure/fd/trash/cardboard
	name = "scattered cardboard"
	desc = "Old cardboard boxes... Thrown all over the place. What a mess."
	icon_state = "cardboard"

/obj/structure/fd/trash/bricks
	name = "brick rubble"
	desc = "A bunch of old bricks. Perhaps you can still find a few that will hold up."
	icon_state = "brickrubble"

/obj/structure/fd/trash/wood
	name = "scrap wood"
	desc = "A bunch of scrap wood. You could probably get a few loose pieces."
	icon_state = "woodscrap"

/obj/structure/fd/trash/food
	name = "DO NOT USE ME - base type food trash"
	desc = "I am a base type and if you see me in the map someone made a mistake."
	icon_state = "foodstuff_1"

/obj/structure/fd/trash/food/dinner
	name = "decrepit dinnerware"
	desc = "A small, moldy, and disgusting collection of old silverware, plates, and similar dining utensils. Perhaps the truly desperate could still find some use out of this."
	icon_state = "foodstuff_1"

/obj/structure/fd/trash/food/dinner/Initialize(mapload)
	. = ..()
	icon_state = pick("foodstuff_1","foodstuff_5")

/obj/structure/fd/trash/food/glass
	name = "empty bottle and can"
	desc = "An empty glass bottle and an aluminum can picked clean, with some utensils nearby."
	icon_state = "foodstuff_4"

/obj/structure/fd/trash/food/misc
	name = "old eating utensils"
	desc = "Moldy silverware, empty cans, and similar utensils. The remnants of a feast no doubt."
	icon_state = "foodstuff_6"

/obj/structure/fd/trash/food/misc/Initialize(mapload)
	. = ..()
	icon_state = pick("foodstuff_2","foodstuff_3", "foodstuff_6")

/obj/structure/fd/trash/glass
	name = "DO NOT USE ME - base type glass trash"
	desc = "I am a base type and if you see me in the map someone made a mistake."
	icon_state = "glass_1"

/obj/structure/fd/trash/glass/cans
	name = "empty bottles and cans"
	desc = "Some empty glass bottles and aluminum cans. You just might be able to make something out of this."
	icon_state = "glass_1"

/obj/structure/fd/trash/glass/cans/Initialize(mapload)
	. = ..()
	icon_state = pick("glass_1","glass_2")

/obj/structure/fd/trash/glass/plate
	name = "glass bottles and dinnerware"
	desc = "Some empty glass bottles and a broken dinner plate. You just might be able to make something out of this."
	icon_state = "glass_6"

/obj/structure/fd/trash/glass/basic
	name = "empty glass bottles"
	desc = "A collection of empty glass bottles and broken pieces of some. Someone either had a very good or a very bad time here."
	icon_state = "glass_4"

/obj/structure/fd/trash/glass/basic/Initialize(mapload)
	. = ..()
	icon_state = pick("glass_3","glass_4", "glass_5")

// Cave Decor

/obj/structure/fd/cave_decor
	icon = 'fd/icons/mojave_structures/cave_decor.dmi'

/obj/structure/fd/cave_decor/stalagmite
	name = "stalagmite"
	desc = "A column of rock formed over many years by minerals in water solidifying."
	icon_state = "stalagmite"
	max_integrity = 120
	anchored = TRUE
	density = TRUE

/obj/structure/fd/cave_decor/stalagmite/Initialize()
	. = ..()
	icon_state = pick("stalagmite", "stalagmite1", "stalagmite2", "stalagmite3", "stalagmite4", "stalagmite5")

/obj/structure/fd/cave_decor/minecart
	name = "minecart"
	desc = "Looks like it's been tipped over and left to rust."
	icon_state = "minecart_fallen"
	max_integrity = 160
	anchored = TRUE
	density = TRUE

/obj/structure/fd/cave_decor/sign_left
	name = "sign"
	desc = "A sign, pointing left. But why?"
	icon_state = "sign_left"
	max_integrity = 80
	anchored = TRUE
	density = FALSE

/obj/structure/fd/cave_decor/sign_left/sign_right
	name = "sign"
	desc = "A sign pointing right. Well, it's right, so it must be right."
	icon_state = "sign_right"

// Board walkway bullshit

/obj/structure/fd/cave_decor/boards
	name = "boards"
	desc = "Boards of wood for walking on, how convenient."
	anchored = TRUE
	density = FALSE
	max_integrity = 100
	var/boards = 1

/obj/structure/fd/cave_decor/boards/mammoth/northsouth
	icon_state = "boards_mammoth_ns-1"

/obj/structure/fd/cave_decor/boards/mammoth/northsouth/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_mammoth_ns-[boards]"

/obj/structure/fd/cave_decor/boards/mammoth/westeast
	icon_state = "boards_mammoth_we-1"

/obj/structure/fd/cave_decor/boards/mammoth/westeast/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_mammoth_we-[boards]"

/obj/structure/fd/cave_decor/boards/drought/northsouth
	icon_state = "boards_drought_ns-1"

/obj/structure/fd/cave_decor/boards/drought/northsouth/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_drought_ns-[boards]"

/obj/structure/fd/cave_decor/boards/drought/westeast
	icon_state = "boards_drought_we-1"

/obj/structure/fd/cave_decor/boards/drought/westeast/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_drought_we-[boards]"

// this sucked
// Mineshaft supports

/obj/structure/fd/cave_decor/support
	name = "support beam"
	desc = "A support beam, to stabilize the roof of the mineshaft."
	icon_state = "support"
	anchored = TRUE
	density = FALSE
	pixel_y = 28

/obj/structure/fd/cave_decor/support/beams
	name = "support beams"
	desc = "A couple of upright beams, supporting the roof of the mineshaft."
	icon_state = "support_beams"

/obj/structure/fd/cave_decor/support/wall
	name = "supports and braces"
	desc = "A couple of support beams, and planks inbetween to brace it."
	icon_state = "support_wall"

/obj/structure/fd/cave_decor/support/wall/broken
	name = "supports and braces"
	desc = "It looks like this support didn't stand the test of time, it's falling apart."
	icon_state = "support_wall_broken"

/obj/structure/noticeboard/fd/cork
	name = "cork board"
	desc = "A cork board for pinning notices to."
	icon = 'fd/icons/mojave_structures/cork.dmi'
	pixel_y = 32
