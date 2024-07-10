//Flags specfically for PM13 content; no more dealing with upstream flags
//To be used with the fd_flags_1 variable; kinda equivalent to the TG flags_1
//WILL NOT WORK OUTSIDE OF THIS FOLDER

//from base of atom/set_density(): (new_value)
#define COMSIG_ATOM_SET_DENSITY "atom_set_density"

///from base of atom/set_smoothed_icon_state(): (new_junction)
#define COMSIG_ATOM_SET_SMOOTHED_ICON_STATE "set_smoothed_icon_state"

//do_after flags
#define DOAFTER_SOURCE_DOORS "doafter_doors"
#define DOAFTER_SOURCE_BREAKICE "doafter_breakice"

//planes
#define UNDER_FRILL_PLANE -12
#define UNDER_FRILL_RENDER_TARGET "*UNDER_RENDER_TARGET"
#define FRILL_PLANE -11
#define OVER_FRILL_PLANE -10

#define OVER_TILE_PLANE -51
#define WALL_PLANE -50

#define ABOVE_GAME_PLANE -20

#define FRILL_MASK_PLANE 95
#define FRILL_MASK_RENDER_TARGET "*FRILL_MASK_RENDER_TARGET"

#define RENDER_PLANE_GAME 990
#define RENDER_PLANE_NON_GAME 995
#define RENDER_PLANE_MASTER 999
