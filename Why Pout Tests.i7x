Version 1/240816 of Why Pout Tests by Andrew Schultz begins here.

"This is a bunch of tests for Why Pout."

volume IDE tests

chapter warp unit tests

test warpthink with "wo/wo/wo/wo/wo/wo/wo/wo/wo/wo/w/gnome old/e/n/wo/wo/wo/s/w/wo/wo".

chapter bonus point test(s)

test wb with "brew swears/in/weak us/grin churls/crew dork/out".

test wall with "brew swears/in/weak us/grin churls/crew dork/z/z/z/z/z/z/z/z/bastardy/lie fuckers/huh shit/heckle ass/were dicks/out".

chapter building blocks

test tall with "t elf/t raider/t dwarf/t gnome/t rogue/t mice/t troll".

test w1 with "an aim/two maps/self owns/pry stalk/high plain/nah phase"

test w2 with "pole east/shore trail/s/known ocean/six quid/n". [get the money]

test w3 with "grow star/n/wool frock/hide out/d/boost role/u/s".

test w4 with "key pillar/w/gnome old/rogue old/plan tracker/see design/knife right/e".

test w5 with "d/gaunt raider/u".

test w6 with "e/low bend/bay sale/n/store mile/mensch elf/mice tall/s/w".

test w7 with "n/low door/in/well own/summer chant/bile oh/whee lone/oh flyer/out/s".

test w8 with "w/manna curb/e".

[test w9 with "s/grow vial/war file/n/e/n/n/tree small".]
test w9 with "e/n/n/tree small/s/s/w/s/grow vial/war file/wan dwarf/n/e/n/n".

test w10 with "test tall/t orc/tall cake/treat all".

test w11 with "s/s/w/s/the file/n".

test w12 with "d/were meetin/my corps/d/cease cull/wipe out/do mend/pm".

chapter longer tests

test bo with "test w1/test w2/test w3/test w4/test wb".

test a with "test w1/test w2/test w3/test w4/test w5/test w6/test w7/test w8/test w9/test w10/test w11/test w12".

test as with "test w1/test w2/test w3/test w4/test w5/test w6/test wall/test w7/test w8/test w9/test w10/test w11/test w12".

chapter best ending test(s)

test m1 with "an aim/wipe out/my corps/two maps/self owns/high plane/pry stalk/high plain/nah phase".

test m2 with "pole east/grow star/n/low door/hideout/d/boost role/u/s/shore trail/key pillar/w/gnome old/rogue old/see design/manna curb".

test m3 with "e/n/wool frock/s/s/bay sale/known ocean/six quid/n/e/bay sale/low bend/bay sale/n/store mile/mice tall/s/w/w/gnome old/e/e/n/mice tall".

test m4 with "s/w/n/low door/in/well own/whee lone/bile oh/summer chant/bile oh/whee lone/oh flyer".

test m5 with "out/s/w/gnome old/rogue old/see design/knife rite/plan tracker/e".

test m6 with "n/in/oh flier/the file/grow vial/war file/out/s/s/war file/wan dwarf/grow vial/n".

test m7 with "e/n/mensch elf/n/tree small/treat all".

test m8 with "s/s/w/d/gaunt raider/test tall".

test m9 with "tall cake/u/w/manna curb/e/e/n/n/treat all/tall cake/treat all".

test m10 with "s/s/w/s/the file/n/d/were meetin/my corps/d".

test m11 with "do mend/cease cull/wipe out".

test tt with "test m1/test m2/test m3/test m4/test m5/test m6/test m7/test m8/test m9/test m10/test m11/score/wide vision/do mend/tt".

test ttbo with "test m1/test m2/test m3/test m4/test m5/test m6/test wall/test m7/test m8/test m9/test m10/test m11/score/wide vision/do mend/tt".

chapter war pawn

test c1 with "purloin war pawn/warp on/warp on/warp on/warp on/warp on/warp on/warp on/warp on/warp on/warp on".

test c2 with "n/warp on/warp on/d/warp on/u/s/w/warp on/warp on/warp on/warp on/e/s/warp on/warp on"

test c3 with "n/w/warp on/e/e/warp on/warp on/n/warp on/warp on/warp on/n/warp on/s/w/s/w".

test c4 with "n/warp on/in/warp on/warp on/warp on/warp on/warp on/out/s/s/warp on/warp on/warp on/n".

test c5 with "d/warp on/u/w/warp on/e/e/n/test tall/warp on/e/n/warp on/s/s/w/s".

test c6 with "warp on/n/d/warp on/warp on".

test c7 with "d/warp on/warp on/warp on".

test cheat with "test c1/test c2/test c3/test c4/test c5/test c6/test c7".

test cheatbo with "test c1/test c2/test c3/test c4/test wall/test c5/test c6/test c7".

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

chapter pointsmisseding

pointsmisseding is an action out of world.

understand the command "pm" as something new.
understand the command "point" as something new.
understand the command "points" as something new.

understand "pm" as pointsmisseding.
understand "point" as pointsmisseding.
understand "points" as pointsmisseding.

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

carry out pointsmisseding (this is the track missed points rule):
	track-criticals true;
	track-criticals false;
	track-thinks;
	the rule succeeds;

chapter tting

tting is an action out of world.

understand the command "tt" as something new.

understand "tt" as tting.

carry out tting (this is the show tripthinking rule):
	let everfails be 0;
	let possfails be 0;
	repeat through table of main oronyms:
		if check-rule entry is pre-wide-vision rule, next;
		if everfail entry is true, increment everfails;
		if there is a think-advice entry, increment possfails;
		if everfail entry is false and there is a think-advice entry:
			say "[check-rule entry] has not been tripped yet.";
	repeat through table of main oronyms:
		if everfail entry is true and there is a think-advice entry:
			say "[b][check-rule entry][r] tripped.";
	say "[everfails] fails out of [possfails] possible.";
	the rule succeeds;

chapter aoing

ever-swear-sorted is a truth state that varies.

aoing is an action out of world.

understand the command "ao" as something new.

understand "ao" as aoing.

carry out aoing:
	if sco-weak-us is true:
		if player is not in brew swears, say "It's too late to test anything when we re-sort the list count." instead;
		say "Resetting the list counter to 0 as well...[paragraph break]";
		now swear-index is 0;
	if ever-swear-sorted is true:
		say "You already un-random-sorted the list, but no harm in doing so again.";
	else:
		say "Un-random-sorting the list.";
	now ever-swear-sorted is true;
	sort swears-order in alphorder order;
	say "[line break]The new list is [swears-order].";
	the rule succeeds;

chapter woing

woing is an action out of world.

understand the command "wo" as something new.

understand "wo" as woing.

carry out woing:
	if player does not have war pawn:
		say "Getting war pawn...";
		now player has war pawn;
	try warponing;
	the rule succeeds;

volume final question options for debug only

table of final question options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see rules that tripped [b]THINK[r] with [b]TT[r]" 	true	"tt/think"	show tripthinking rule	--
"see points missed with [b]PM[r]/[b]POINT[r]/[b]POINTS[r]" 	true	"pm/point/points"	track missed points rule	--

Why Pout Tests ends here.

---- DOCUMENTATION ----
