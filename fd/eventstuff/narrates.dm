//
#define SPAN_STYLE(style, X) "<span style=\"[style]\">[X]</span>"

#define SPAN_SIZE(size, text) SPAN_STYLE("font-size: [size]", "[text]")

#define span_occult(str) ("<span class='occult'>" + str + "</span>")

#define FONT_SMALL(X) SPAN_SIZE("10px", "[X]")

#define FONT_NORMAL(X) SPAN_SIZE("13px", "[X]")

#define FONT_LARGE(X) SPAN_SIZE("16px", "[X]")

#define FONT_HUGE(X) SPAN_SIZE("18px", "[X]")

#define FONT_GIANT(X) SPAN_SIZE("24px", "[X]")


/*
#define FONT_SMALL(X) ("<font size=10px>" + str + "</font>")

#define FONT_NORMAL(X) ("")

#define span_suicide(str) ("<span class='suicide'>" + str + "</span>")
*/

// Мне РЕАЛЬНО лень просто дважды писать log_admin и message_stuff...
// Я буду проклят за это, но я готов пойти на эти жертвы!
// 		- Maximum
/proc/log_and_message_staff(message as text, mob/user = usr, turf/location)
	log_admin(user ? "[key_name(user)] [message]" : "EVENT [message]")
	message_admins(user ? "[key_name_admin(user)] [message]" : "EVENT [message]")

//



/proc/cmd_admin_narrate_helper(user, style, size, message)
	if (!style)
		style = input("Pick a text style:", "Text Style") as null|anything in list(
			"default",
			"italic",
			"bold",
			"subtle",
			"notice",
			"warning",
			"danger",
			"occult"
		)
	if (!style)
		return

	if (!size)
		size = input("Pick a text size:", "Text Size") as null|anything in list(
			"normal",
			"small",
			"large",
			"huge",
			"giant"
		)
	if (!size)
		return

	if (!message)
		message = input("Message:", text("Enter the text you wish to appear to your target:")) as null|text
	if (!message)
		return

	var/result = message
	switch (style)
		if ("italic")  result = "<i>[result]</i>"
		if ("bold")    result = "<b>[result]</b>"
		if ("subtle")  result = "<b>You hear a voice in your head... [result]</b>"
		if ("notice")  result = span_notice(result)
		if ("warning") result = span_warning(result)
		if ("danger")  result = span_danger(result)
		if ("occult")  result = span_cultboldtalic(result)
	switch (size)
		if ("small")  result = FONT_SMALL(result)
		if ("large")  result = FONT_LARGE(result)
		if ("huge")   result = FONT_HUGE(result)
		if ("giant")  result = FONT_GIANT(result)

	return list(result, style, size, message)


//Condenced version of the mob targeting narrates
/client/proc/cmd_admin_narrate(atom/A)
	set category = "Admin.Events"
	set name = "Narrate"
	set desc = "Selection of narrates targeting a mob."

	if(!check_rights(R_ADMIN))
		return

	var/options = list("Direct Narrate", "Local Narrate")

	var/result = input("What type of narrate?") as null | anything in options
	switch(result)
		if (null)
			return
		if ("Direct Narrate")
			cmd_admin_direct_narrate(A)
		if ("Local Narrate")
			cmd_admin_local_narrate(A)


// Targetted narrate: will narrate to one specific mob
/client/proc/cmd_admin_direct_narrate(mob/M)
	set popup_menu = FALSE
	set category = null
	set name = "Direct Narrate"
	set desc = "Narrate to a specific mob."

	if(!check_rights(R_ADMIN))
		return

	if (!M)
		M = input("Direct narrate to who?", "Active Players") as null|anything in GLOB.player_list
	if (!M)
		return

	var/style
	var/size

	var/result = cmd_admin_narrate_helper(src, style, size)
	if (!result || !M)
		return

	to_chat(M, result[1])
	log_and_message_staff(" - DirectNarrate [result[2]]/[result[3]] to ([M.name]/[M.key]): [result[4]]")

// Local narrate, narrates to everyone who can see where you are regardless of whether they are blind or deaf.
/client/proc/cmd_admin_local_narrate(atom/A)
	set popup_menu = FALSE
	set category = null
	set name = "Local Narrate"
	set desc = "Narrate to everyone who can see the turf your mob is on."

	if(!check_rights(R_ADMIN))
		return

	var/result = cmd_admin_narrate_helper(src)
	if (!result)
		return


	for(var/mob/M in view(7, A))
		to_chat(M, result[1])
	log_and_message_staff(" - LocalNarrate [result[2]]/[result[3]]: [result[4]]")
