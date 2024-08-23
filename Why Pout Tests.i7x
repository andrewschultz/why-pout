Version 1/240816 of Why Pout Tests by Andrew Schultz begins here.

"This is a bunch of tests for Why Pout."

volume IDE tests

chapter building blocks

test w1 with "an aim/two maps/self owns/pry stalk/high plain/nah phase"

test w2 with "pole east/shore trail/s/known ocean/six quid/n". [get the money]

test w3 with "grow star/n/wool frock/hide out/d/boost role/u/s".

test w4 with "key pillar/w/gnome old/rogue old/plan tracker/see design/knife right/e".

test wb with "brew swears/in/weak us/out".

test w5 with "d/gaunt raider/u".

test w6 with "e/low bend/bay sale/n/store mile/mensch elf/mice tall/s/w".

test w7 with "n/low door/in/well own/summer chant/bile oh/whee lone/oh flyer/out/s".

test w8 with "w/manna curb/e".

[test w9 with "s/grow vial/war file/n/e/n/n/tree small".]
test w9 with "e/n/n/tree small/s/s/w/s/grow vial/war file/wan dwarf/n/e/n/n".

test w10 with "t elf/t mice/t gnome/t rogue/t troll/t raider/t dwarf/tall cake/treat all".

test w11 with "s/s/w/s/the file/n".

test w12 with "d/were meetin/my corps/d/cease cull/wipe out/wl/do mend".

chapter longer tests

test bo with "test w1/test w2/test w3/test w4/test wb".

test a with "test w1/test w2/test w3/test w4/test w5/test w6/test w7/test w8/test w9/test w10/test w11/test w12".

chapter old-tests

test we with "pole east/e/low bend/n/store mile/mice tall/s/w".

test ww with "key pillar/w/rogue old/gnome old/e".

test wn with "grow star/n/hide out/d/boost role/u/low door/in/well own/summer chant/bile oh/whee lone/oh flyer/out/s".

test ws with "shore trail/s/known ocean/six quid/war file/grow vial/the file".

test wc with "gonear worm eaten/af/were meetin/my corps/d/cease cull/wipe out/wl/do mend".

test o with "test w1/test we/test ww/test wn/test ws/test wc".

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

to track-thinks:
	repeat through table of main oronyms:
		if think-cue entry is true and idid entry is false:
			say "Tried [b][w1 entry in upper case] [w2 entry in upper case][r] but wasn't ready yet.";

carry out wling:
	track-criticals true;
	track-criticals false;
	track-thinks;
	the rule succeeds;


Why Pout Tests ends here.

---- DOCUMENTATION ----
