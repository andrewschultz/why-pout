Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume new types

a follower is a kind of thing.

a follower can be unfriendly, friendly or donewith. a follower is usually unfriendly.

definition: a follower (called fo) is leftbehind:
	unless fo is friendly, no;
	if fo is in location of player, no;
	yes;	

every turn (this is the followers follow you rule):
	if number of leftbehind followers > 0:
		say "The [list of leftbehind followers] follow[if number of leftbehind followers is 1]s[end if] you.";
		repeat with X running through leftbehind followers:
			move X to location of player;

volume stubs

to open-psg (di - a direction) and (rm - a room): [from PPRR. Maybe we can put this in the core?]
	let lp be location of player;
	change di exit of lp to rm;
	change (opposite of di) exit of rm to lp;

volume definitions

definition: a direction (called d) is viable:
	if the room d of location of player is nowhere, no;
	yes;

volume combo numbers

to decide which number is init-exits:
	decide on (boolval of sco-shore-trail);

Why Pout Definitions ends here.

---- DOCUMENTATION ----
