Version 1/240816 of Why Pout Tests by Andrew Schultz begins here.

"This is a bunch of tests for Why Pout."

volume spoiler includes

include Why Pout Spoiler Tests by Andrew Schultz. [not in source control right away]

volume IDE tests

chapter warp unit tests

test warpthink with "wo/wo/wo/wo/wo/wo/wo/wo/wo/wo/w/gnome old/e/n/wo/wo/wo/s/w/wo/wo".

chapter brew test starter

test brew with "wo/wo/wo/wo/wo/wo/wo/wo/wo/wo/ao/gonear brew/weak us/crew dork".

chapter in IFComp tests

test comp1 with "test w1/test w2/test w3/test w4/l/d/were meetin/think". [A DiBianca: THINK hosed We're Meeting. (Also, TALL CAKE but that's harder to test!)]

chapter bonus point test(s)

test wb with "brew swears/in/weak us/grin churls/crew dork/out".

test wall with "brew swears/in/weak us/grin churls/crew dork/z/z/z/z/z/z/z/z/ass low/bastardy/lie fuckers/huh shit/heckle ass/were dicks/gah wanker/out".

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

test w12 with "d/were meetin/my corps/d".

test w13 with "cease cull/wipe out/do mending/pm".

chapter longer tests

test bo with "test w1/test w2/test w3/test w4/test wb".

test minalm with "test w1/test w2/test w3/test w4/test w5/test w6/test w7/test w8/test w9/test w10/test w11/test w12".

test min with "test almost/test w13".

test maxalm with "test w1/test w2/test w3/test w4/test w5/test w6/test wall/test w7/test w8/test w9/test w10/test w11/test w12".

test max with "test maxalm/test w13".

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

[get all friends -- this may break the game in standard testing, but it's helpful to test the TALK/T command]

afing is an action out of world.

understand the command "af" as something new.

understand "af" as afing.

carry out afing:
	now all followers are friendly;
	now all followers are in location of player;
	the rule succeeds;

volume diagnostics

chapter whotalking

whotalking is an action out of world.

understand the command "whotalk" as something new.

understand "whotalk" as whotalking.

carry out whotalking:
	repeat with Q running through followers:
		say "[Q]: [if Q is chatted]chatted[else]unchatted[end if].";
	the rule succeeds;

chapter pointsmisseding

[well points missed AND thought commands to still get working]

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
	let unreadies be 0;
	repeat through table of main oronyms:
		if think-cue entry is true and idid entry is false:
			increment unreadies;
			say "Tried [b][w1 entry in upper case] [w2 entry in upper case][r] but wasn't ready yet.";
	if unreadies > 0:
		say "[unreadies] point-scoring command[if unreadies is 1]s[end if] tried before you were ready.";
	else:
		say "No commands in THINK limbo."

carry out pointsmisseding (this is the track missed points rule):
	track-criticals true;
	track-criticals false;
	track-thinks;
	the rule succeeds;

chapter tting

[ think tripping - which commands did we trip? ]

tting is an action out of world.

understand the command "tt" as something new.

understand "tt" as tting.

carry out tting (this is the show tripthinking rule):
	let everfails be 0;
	let possfails be 0;
	repeat through table of main oronyms:
		if check-rule entry is vision-missable, next;
		if everfail entry is true, increment everfails;
		if there is a think-advice entry, increment possfails;
		if everfail entry is false and there is a think-advice entry:
			say "[check-rule entry] has not been tripped yet.";
	repeat through table of main oronyms:
		if everfail entry is true and there is a think-advice entry:
			say "[b][check-rule entry][r] tripped.";
	say "[everfails] fails out of [possfails] possible.";
	the rule succeeds;

chapter swearshowing

swearshowing is an action out of world.

understand the command "swearshow" as something new.

understand "swearshow" as swearshowing.

carry out swearshowing:
	repeat with X running through swearblobs:
		say "[X] [location of X]: next = [next-swear of X]. prev = [prev-swear of X].";
	say "[swears-order] is the order they should appear.";
	the rule succeeds;

chapter aoing

[this sorts the swear list, ao=alphabetical order, so I can run fixed tests]

ever-swear-sorted is a truth state that varies.

aoing is an action out of world.

understand the command "ao" as something new.

understand "ao" as aoing.

carry out aoing:
	if brew swears is visited and sco-weak-us is true, say "You need to activate alphabetical swears before WE CUSS." instead;
	if ever-swear-sorted is true:
		say "You already un-random-sorted the list, but no harm in doing so again.";
	else:
		say "Un-random-sorting the list.";
	now ever-swear-sorted is true;
	sort swears-order in alphorder order;
	swear-prev-next-from-order;
	the rule succeeds;

section swearblob sorting alphabetically - not for release

alphorder of aah-slow is 1. alphorder of bah-sturdy is 2. alphorder of heh-class is 3. alphorder of hush-it is 4. alphorder of life-occurs is 5. alphorder of weird-icks is 6.

chapter taing

taing is an action out of world.

understand the command "ta" as something new.

understand "ta" as taing.

carry out taing:
	let count be 0;
	repeat with X running through friendly unchatted followers:
		increment count;
		try ting X;
	if count is 0:
		say "Nobody to talk to.";
	the rule succeeds;

chapter woing

[because I got too lazy to type PURLOIN WAR and then WARP ON a lot, even with the up-arrow.]

woing is an action out of world.

understand the command "wo" as something new.

understand "wo" as woing.

carry out woing:
	if player does not have war pawn:
		say "Getting war pawn...";
		now player has war pawn;
	try warponing;
	the rule succeeds;

volume final question options for testing only

[A small hook so the test scripts can try diagnostics once the game is won.]

table of final question options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see rules that tripped [b]THINK[r] with [b]TT[r]" 	true	"tt/think"	show tripthinking rule	--
"see points missed with [b]PM[r]/[b]POINT[r]/[b]POINTS[r]" 	true	"pm/point/points"	track missed points rule	--

volume ediaging, to check eyes values at end

ediaging is an action out of world.

understand the command "ediag" as something new.

understand "ediag" as ediaging.

carry out ediaging:
	let count be 0;
	repeat with X running through rooms:
		if player is in doom ending:
			if X is doom ending, next;
			if eyes-number of X > 1 or eyes-number of X < -1:
				increment count;
				say "[count] At the end of the game, [x] should have a value of -1 or 1.";
				next;
		if eyes-number of X is 0:
			increment count;
			say "[count] Assign eyes-number to room [X].";
	if count is 0, say "All rooms fixed!";
	now count is 0;
	repeat with X running through things:
		if player is in doom ending:
			if eyes-number of X > 1 or eyes-number of X < -1:
				if X is not moot:
					increment count;
					say "[count] At the end of the game, [x] should have a value of -1 or 1.";
					next;
		if eyes-number of X is 0:
			increment count;
			say "[count] Assign eyes-number to thing [X].";
	if count is 0, say "All things fixed!";
	the rule succeeds;

chapter untiling

untiling is an action out of world applying to one number.

understand the command "until" as something new.

understand "until [number]" as untiling.

carry out untiling:
	if number understood < 1 or number understood > number of rows in table of further dialogues:
		say "You need a number between 1 and [number of rows in table of further dialogues]. That's how far back from the end of the second group of random dialogues you will be set." instead;
	now second-dialogue-row is (number of rows in table of further dialogues) - number understood;
	say "Acting as if I just wrote row [second-dialogue-row] of [number of rows in table of further dialogues].";
	the rule succeeds;

volume randomizing in debug

shuf2ing is an action out of world.

carry out shuf2ing:
	sort quasirand-init-list in random order;
	sort table of further dialogues in random order;
	now quasirand-final-list is {};
	repeat with QL running through quasirand-init-list:
		sort QL in random order;
		add QL to quasirand-final-list;

volume undo okaying

chapter undoying

undoying is an action out of world.

understand the command "undoy" as something new.

understand "undoy" as undoying.

carry out undoying:
	now undo-okayed is true;
	say "Undo allowed for testing purposes, mostly to test war pawn.";
	the rule succeeds;

chapter undoning

undoning is an action out of world.

understand the command "undon" as something new.

understand "undon" as undoning.

carry out undoning:
	now undo-okayed is false;
	say "Undo disallowed for testing purposes, mostly to test war pawn.";
	the rule succeeds;

volume post parser error stuff

after printing a parser error when found-think-case is true:
	now found-think-case is false;
	say "[line break]Add 1.";

Why Pout Tests ends here.

---- DOCUMENTATION ----
