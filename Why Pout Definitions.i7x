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
		let plurals be whether or not number of leftbehind followers > 1;
		if plurals is false:
			let rf be a random leftbehind follower;
			if rf is plural-named, now plurals is true;
		say "The [list of leftbehind followers] follow[if plurals is false]s[end if] you.";
		repeat with X running through leftbehind followers:
			move X to location of player;

volume stubs

to open-psg (di - a direction) and (rm - a room): [from PPRR. Maybe we can put this in the core?]
	let lp be location of player;
	change di exit of lp to rm;
	change (opposite of di) exit of rm to lp;

[to open-psg (rm - a room) and (di - a direction):
	open-psg di and rm;]

volume definitions

definition: a direction (called d) is viable:
	if the room d of location of player is nowhere, no;
	yes;

volume combo numbers

to decide which number is init-exits:
	decide on (boolval of sco-shore-trail);

to decide which number is flier-isle-score:
	decide on (boolval of sco-grow-vial) + (boolval of sco-the-file) + (boolval of sco-war-file);

Why Pout Definitions ends here.

---- DOCUMENTATION ----
