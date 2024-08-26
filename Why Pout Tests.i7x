Version 1/240816 of Why Pout Tests by Andrew Schultz begins here.

"This is a bunch of tests for Why Pout."

volume IDE tests

chapter building blocks

test w1 with "an aim/two maps/self owns/pry stalk/high plain/nah phase"

test w2 with "pole east/shore trail/s/known ocean/six quid/n". [get the money]

test w3 with "grow star/n/wool frock/hide out/d/boost role/u/s".

test w4 with "key pillar/w/gnome old/rogue old/plan tracker/see design/knife right/e".

test wb with "brew swears/in/weak us/grin churls/crew dork/out".

test w5 with "d/gaunt raider/u".

test w6 with "e/low bend/bay sale/n/store mile/mensch elf/mice tall/s/w".

test w7 with "n/low door/in/well own/summer chant/bile oh/whee lone/oh flyer/out/s".

test w8 with "w/manna curb/e".

[test w9 with "s/grow vial/war file/n/e/n/n/tree small".]
test w9 with "e/n/n/tree small/s/s/w/s/grow vial/war file/wan dwarf/n/e/n/n".

test w10 with "t elf/t mice/t gnome/t rogue/t troll/t raider/t dwarf/t orc/tall cake/treat all".

test w11 with "s/s/w/s/the file/n".

test w12 with "d/were meetin/my corps/d/cease cull/wipe out/wl/do mend".

chapter longer tests

test bo with "test w1/test w2/test w3/test w4/test wb".

test a with "test w1/test w2/test w3/test w4/test w5/test w6/test w7/test w8/test w9/test w10/test w11/test w12".

chapter best ending test(s)

test m1 with "an aim/wipe out/my corps/two maps/self owns/high plane/pry stalk/high plain/nah phase".

test m2 with "pole east/grow star/n/low door/hideout/d/boost role/u/s/shore trail/key pillar/w/gnome old/rogue old/see design/manna curb".

test m3 with "e/n/wool frock/s/s/bay sale/known ocean/six quid/n/e/bay sale/low bend/bay sale/n/store mile/mice tall/s/w/w/gnome old/e/e/n/mice tall".

test m4 with "s/w/n/low door/in/well own/whee lone/bile oh/summer chant/bile oh/whee lone/oh flyer".

test m5 with "out/s/w/gnome old/rogue old/see design/knife rite/plan tracker/e".

test m6 with "n/in/oh flier/the file/grow vial/war file/out/s/s/war file/wan dwarf/grow vial/n".

test m7 with "e/n/mensch elf/n/tree small/treat all".

test m8 with "s/s/w/d/gaunt raider/t elf/t raider/t dwarf/t gnome/t rogue/t mice/t troll".

test m9 with "tall cake/u/w/manna curb/e/e/n/n/treat all/tall cake/treat all".

test m10 with "s/s/w/s/the file/n/d/were meetin/my corps/d".

test m11 with "do mend/cease cull/wipe out".

test mis with "test m1/test m2/test m3/test m4/test m5/test m6/test m7/test m8/test m9/test m10/test m11/score/mis/do mend".

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
		if core entry is not ts, next;
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

chapter mising

mising is an action out of world.

understand the command "mis" as something new.

understand "mis" as mising.

carry out mising:
	let everfails be 0;
	let possfails be 0;
	repeat through table of main oronyms:
		if everfail entry is true, increment everfails;
		if there is a think-advice entry, increment possfails;
		if everfail entry is false and there is a think-advice entry:
			say "[check-rule entry] has not been tripped yet.";
	repeat through table of main oronyms:
		if everfail entry is true and there is a think-advice entry:
			say "[b][check-rule entry][r] tripped.";
	say "[everfails] fails out of [possfails] possible.";
	the rule succeeds;

Why Pout Tests ends here.

---- DOCUMENTATION ----
