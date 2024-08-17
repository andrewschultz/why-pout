Version 1/240816 of Why Pout Tests by Andrew Schultz begins here.

"This is a bunch of tests for Why Pout."

volume IDE tests

test w1 with "an aim/two maps/pry stalk/high plain"

test we with "nah phase/pole east/e/low bend/n/store mile/mice tall/s/w".

test wn with "grow star/n/hide out/d/boost role/u/s".

test ws with "shore trail/s/known ocean/six quid/war file/grove isle".

test wc with "gonear worm eaten/af/were meetin/my corps/d/cease cull/wipe out/wl/do mend".

test a with "test w1/test we/test wn/test ws/test wc".

test misc with "the file/wipe out".

volume cheats

chapter afing

afing is an action out of world.

understand the command "af" as something new.

understand "af" as afing.

carry out afing:
	now all followers are friendly;
	now all followers are in location of player;
	the rule succeeds;

volume diagnostics

chapter wling

wling is an action out of world.

understand the command "wl" as something new.

understand "wl" as wling.

to say critopt of (ts - a truth state):
	if ts is true:
		say "critical";
	else:
		say "optional";

to track-criticals (ts - a truth state):
	let any-yet be false;
	repeat through table of main oronyms:
		if core entry is not ts, continue the action;
		if idid entry is false:
			if any-yet is false:
				now any-yet is true;
				say "Missing [critopt of ts] points:[line break]";
			say "Still need to try: [b][w1 entry in upper case] [w2 entry in upper case][r].";
	if any-yet is false:
		say "Got all [critopt of ts] points."

carry out wling:
	track-criticals true;
	track-criticals false;
	the rule succeeds;


Why Pout Tests ends here.

---- DOCUMENTATION ----
