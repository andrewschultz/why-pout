Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume includes

include Revealing Passages by Andrew Schultz.

volume new types

a follower is a kind of thing.

a follower can be unfriendly, friendly or donewith. a follower is usually unfriendly.

a follower can be unchatted or chatted. a follower is usually unchatted.

to befriend (f - a follower):
	now f is friendly;
	move f to location of player;

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
		follow-you;

to follow-you:
	repeat with X running through leftbehind followers:
		move X to location of player;

volume stubs

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
