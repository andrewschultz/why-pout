Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume includes

volume game specific definitions

definition: a rule (called ru) is thinknoteblocking:
	if ru is pre-wide-vision rule, yes;
	no;

volume cheat item stuff

a thing has a number called eyes-number.

a room has a number called eyes-number.

chapter eyeing

the sly size slice eyes are a plural-named thing. eyes-number of sly size slice eyes is 1. printed name is "sly size-slice eyes".

eyering is an action out of world.

understand the command "eye" as something new.
understand the command "eyes" as something new.

understand "eye" as eyering.
understand "eyes" as eyering.

eyeing is an action out of world applying to one thing.

understand "eye [thing]" as eyeing.
understand "eyes [thing]" as eyeing.

to say eye-with: say "[if current action is eyering]here[else]with [the noun]";

eyeguessing a number (called n):
	if sly size slice eyes are moot, say "But you ditched [the eyes], so you can't [b]EYE[r] any more." instead;
	if player does not have sly size slice eyes, say "But you don't have what you need to [b]EYE[r] anything." instead;
	if n is -1:
		say "The eyes show nothing. You've done everything you need to [eye-with]." instead;
	else if n is 0 or n is 1:
		say "The eyes show nothing. Probably don't need to do anything [eye-with]." instead;
	else if n is 2:
		say "The eyes almost seem to light up. Perhaps you need to do something later [eye-with]." instead;
	say "The eyes show [n / 10] dots, then [remainder after dividing n by 10] dots.";

eyeguessing is a number based rulebook.

carry out eyeing:
	abide by the eyeguessing rulebook for eyes-number of noun;
	the rule succeeds;

carry out eyering:
	abide by the eyeguessing rulebook for eyes-number of location of player;
	the rule succeeds;

report eyeing:
	note-not-now;
	continue the action;

report eyering:
	note-not-now;
	continue the action;

to note-not-now:
	if gs-eye-note is false:
		now gs-eye-note is true;
		say "[i][bracket][b]NOTE[r][i]: the eyes do not tell you whether or not you can currently perform the action they are hinting at, only that you can at some time.[close bracket]";

to declue-here: now eyes-number of location of player is -1

to declue (th - a thing): now eyes-number of th is -1

volume new types

book sentient

a sentient can be prefollowing. a sentient is usually not prefollowing. [defined in the core: this is for things you can talk to but they take lower priority than followers]

section get eyes - not for release

when play begins: now player has eyes;

book followers

a follower is a kind of thing.

a follower can be unfriendly, friendly or donewith. a follower is usually unfriendly.

a follower can be needed or unneeded. a follower is usually needed.

a follower can be unchatted or chatted. a follower is usually unchatted.

a follower has text called help-chat.

definition: a follower (called f) is still-follow-needed:
	if f is unneeded, no;
	if f is friendly, no;
	yes;

definition: a follower (called f) is still-chat-needed:
	if f is chatted, no;
	if f is unneeded, no;
	yes;

to befriend (f - a follower):
	now f is friendly;
	move f to location of player;
	if number of friendly followers is 1:
		say "[line break]It looks like [the f] will be following you around. All that silence might get awkward, so you may wish to [b]T[r] or [b]TALK[r] ([b]TO[r]) them.";
	else if number of friendly followers is 3:
		say "[line break][i][bracket][b]NOTE:[r][i] in order to simplify things now you've grown your party, you can type [b]UH PARTY[r][i] or [b]A PARTY[r][i] so everyone is not listed individually. [b]APART EEE[r][i] will list them individually again. This is all in [b]VERBS[r][i].[close bracket][r][line break]";
	else if number of still-follow-needed followers is 0:
		say "[line break]Wow! You've got quite a group here. You can't imagine needing a bigger one[if number of unfriendly followers > 0], though there's BRUISE-WARES[end if].";
	else if (number of friendly followers >= 4) and (pals-made - number of chatted followers > 2):
		say "[line break]Hmm. You have a lot of friends following you around, but you haven't talked to them much. Perhaps you could learn something from them.";

definition: a follower (called fo) is leftbehind:
	unless fo is friendly, no;
	if fo is in location of player, no;
	yes;	

to decide whether say-plural-moving-followers:
	if number of leftbehind followers > 1, yes;
	let rf be a random leftbehind follower;
	if rf is plural-named, yes;
	no;

to decide whether say-plural-stationary-followers:
	if number of friendly followers in location of player > 1, yes;
	let rf be a random friendly follower;
	if rf is plural-named, yes;
	no;

every turn when block-followers is false (this is the followers follow you rule):
	if number of leftbehind followers > 0:
		if opt-lump-party is true:
			say "Your [number of leftbehind followers in words] companions follow you.";
		else:
			say "The [list of leftbehind followers] follow[if not say-plural-moving-followers]s[end if] you.";
		follow-you;

to follow-you:
	repeat with X running through leftbehind followers:
		move X to location of player;

book statuses

to decide whether talk-default-to-player:
	if player is in Eh Raw Air Aww, yes;
	if being-policed, yes;
	no;

to decide whether being-policed:
	if player is in NaffHaze and sco-nah-phase is true and sco-pole-east is false, yes;
	no;

book swearblobs

a swearblob is a kind of thing. a swearblob is usually privately-named. a swearblob is usually scenery. a swearblob has a swearblob called prev-swear. a swearblob has a swearblob called next-swear.

most-recent-swear is a swearblob that varies.

swears-order is a list of things variable.

when play begins:
	now swears-order is the list of swearblobs;
	sort swears-order in random order;
	swear-prev-next-from-order;

to swear-prev-next-from-order: [ make a linked list from the sorted list. This could have been done right away, but the code still would've been tricky. We'd need "a swear-blob can be linked-yet" then "let first-swear be (random swear)" then let next-swear be a random not linked-yet swear" and add prev/next. Then when none are linked, let prev-swear of first be last. That seemed trickier than this. ]
	now prev-swear of (entry 1 in swears-order) is entry (number of swearblobs) in swears-order;
	now next-swear of entry (number of swearblobs) in swears-order is (entry 1 in swears-order);
	repeat with X running from 2 to number of swearblobs:
		now prev-swear of (entry X in swears-order) is (entry (X - 1) in swears-order);
		now next-swear of (entry (X - 1) in swears-order) is (entry X in swears-order);
	now most-recent-swear is entry (number of swearblobs) of swears-order;
[	if debug-state is true:
		repeat with X running through swearblobs:
			say "[x] [prev-swear of x] [next-swear of x].";]

every turn when player is in brew swears and sco-weak-us is true and number of not moot swearblobs > 0 (this is the cycle swears rule):
	now most-recent-swear is next-swear of most-recent-swear;
	if most-recent-swear is not in brew and most-recent-swear is not moot, move most-recent-swear to brew;
	say "[one of]Your observation has caused something to 'righteously' snap in the [grinch]. And boy, are they going to firehose you with their 'best!'[paragraph break][or][stopping][description of most-recent-swear][line break]";

chapter alphorder - not for release

a swearblob has a number called alphorder.

volume stubs

volume definitions

definition: a direction (called d) is viable:
	if the room d of location of player is nowhere, no;
	yes;

volume combo numbers

to decide which number is pals-made: decide on number of friendly followers;

to decide which number is pals-needed: decide on number of needed followers;

to decide which number is flier-isle-score:
	decide on (boolval of sco-grow-vial) + (boolval of sco-the-file) + (boolval of sco-war-file);

to decide which number is plane-dir-score:
	decide on (boolval of sco-pole-east) + (boolval of sco-grow-star) + (boolval of sco-shore-trail) + (boolval of sco-key-pillar);

to decide which number is keep-score:
	decide on (boolval of sco-gnome-old) + (boolval of sco-rogue-old) + (boolval of sco-manna-curb) + (boolval of sco-plan-tracker) + (boolval of sco-see-design) + (boolval of sco-knife-right);

to decide which number is orc-score:
	decide on (boolval of sco-weak-us) + (boolval of sco-crew-dork);

to decide which number is brew-swears-score:
	decide on (boolval of sco-brew-swears) + (boolval of sco-weak-us) + (boolval of sco-grin-churls) + (boolval of sco-crew-dork) + (boolval of sco-huh-shit) + (boolval of sco-lie-fuckers) + (boolval of sco-heckle-ass) + (boolval of sco-were-dicks) + (boolval of sco-bastard-eee) [yes, it's possible we could define a function called boolsum of brew-swears but this does the job for now]

book meta scoring

definition: a rule (called ru) is vision-missable:
	if ru is pre-wide-vision rule, yes;
	if ru is pre-crew-dork rule, yes;
	no;
	
to decide which number is pre-acts:
	let return-value be 0;
	repeat through table of main oronyms:
		if check-rule entry is vision-missable, next;
		if everfail entry is true, increment return-value;
	decide on return-value;

to decide which number is thinkcue-index:
	let WVRE be number of entries in wide-vision-rejects;
	if pre-acts is 0, decide on 1;
	if pre-acts is pre-max - 1, decide on WVRE;
	[say "[pre-acts - 1] * [WVRE - 2] / [pre-max - 2] = ";]
	decide on 2 + (((pre-acts - 1) * (WVRE - 2)) / (pre-max - 2)); [the arithmetic here is, 1 THINK cue starts you at 2, while 19 THINK cues of 20 end you at exactly 11 = # of WVR. 1->2, 19->11.]

when play begins:
	repeat through table of main oronyms:
		if there is a think-advice entry:
			if check-rule entry is vision-missable, next;
			increment pre-max;
			[say "[check-rule entry] [pre-max].";]

volume begin play

when play begins:
	sort table of zero point taunts in random order;
	sort table of zero point taunts in sortval order;

Why Pout Definitions ends here.

---- DOCUMENTATION ----
