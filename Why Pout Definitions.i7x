Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume includes

include Revealing Passages by Andrew Schultz.

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

eyeguessing a number (called n):
	if sly size slice eyes are moot, say "But you ditched [the eyes], so you can't [b]EYE[r] any more." instead;
	if player does not have sly size slice eyes, say "But you don't have what you need to [b]EYE[r] anything." instead;
	let thing-grammar be whether or not current action is eyering;
	if n is -1:
		say "The eyes show nothing. You've done everything you need to [if thing-grammar is true]here[else]with [the noun]." instead;
	else if n is 0 or n is 1:
		say "The eyes show nothing. Probably don't need to do anything [if thing-grammar is true]here[else]with [the noun]." instead;
	say "The eyes show [n / 10] dots, then [remainder after dividing n by 10] dots.";

eyeguessing is a number based rulebook.

carry out eyeing:
	abide by the eyeguessing rulebook for eyes-number of noun;
	the rule succeeds;

carry out eyering:
	abide by the eyeguessing rulebook for eyes-number of location of player;
	the rule succeeds;

to declue-here: now eyes-number of location of player is -1

to declue (th - a thing): now eyes-number of th is -1

volume new types

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
		say "It looks like [the f] will be following you around. All that silence might get awkward, so you may wish to [b]T[r] or [b]TALK[r] ([b]TO[r]) them.";
	else if number of still-follow-needed followers is 0:
		say "[line break]Wow! You've got quite a group here. You can't imagine needing a bigger one[if number of unfriendly followers > 0], though there's BRUISE-WARES[end if].";
	else if pals-made - number of chatted followers > 2:
		say "[line break]Hmm. You have a lot of friends following you around, but you haven't talked to them much. Perhaps you could learn something from them."

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
	if number of friendly followers > 1, yes;
	let rf be a random friendly follower;
	if rf is plural-named, yes;
	no;

every turn when block-followers is false (this is the followers follow you rule):
	if number of leftbehind followers > 0:
		if number of leftbehind followers > 2:
			say "Your [number of leftbehind followers in words] companions follow you.";
		else:
			say "The [list of leftbehind followers] follow[if not say-plural-moving-followers]s[end if] you.";
		follow-you;

to follow-you:
	repeat with X running through leftbehind followers:
		move X to location of player;

book swearblobs

a swearblob is a kind of thing. a swearblob is usually privately-named. a swearblob is usually scenery. a swearblob has text called swear-indicate-text.

swear-index is a number variable. swear-index is 0.

x is a list of things variable.

when play begins:
	now x is the list of swearblobs;
	sort x in random order;

every turn when player is in brew swears and sco-weak-us is true and number of entries in x > 0:
	increment swear-index;
	if swear-index > number of entries in x, now swear-index is 1;
	let my-swear be entry swear-index in x;
	if my-swear is not in brew, move my-swear to brew;
	say "[description of my-swear][line break]";

volume stubs

to say here-in of (rm - a room): say "[if rm is location of player]here[else]in [rm][end if]"

to say once-now of (ts - a truth state): say "[if ts is true]now[else]once[end if]"

volume definitions

definition: a direction (called d) is viable:
	if the room d of location of player is nowhere, no;
	yes;

volume combo numbers

to decide which number is pals-made: decide on number of friendly followers;

to decide which number is flier-isle-score:
	decide on (boolval of sco-grow-vial) + (boolval of sco-the-file) + (boolval of sco-war-file);

to decide which number is plane-dir-score:
	decide on (boolval of sco-pole-east) + (boolval of sco-grow-star) + (boolval of sco-shore-trail) + (boolval of sco-key-pillar);

to decide which number is keep-score:
	decide on (boolval of sco-gnome-old) + (boolval of sco-rogue-old) + (boolval of sco-manna-curb) + (boolval of sco-plan-tracker) + (boolval of sco-see-design) + (boolval of sco-knife-right);

to decide which number is brew-swears-score:
	decide on (boolval of sco-brew-swears) + (boolval of sco-weak-us) + (boolval of sco-grin-churls) + (boolval of sco-crew-dork) + (boolval of sco-huh-shit) + (boolval of sco-lie-fuckers) + (boolval of sco-heckle-ass) + (boolval of sco-were-dicks) + (boolval of sco-bastard-eee) [yes, it's possible we could define a function called boolsum of brew-swears but this does the job for now]

book meta scoring

to decide which number is pre-acts:
	let return-value be 0;
	repeat through table of main oronyms:
		if everfail entry is true, increment return-value;
	decide on return-value;

when play begins:
	repeat through table of main oronyms:
		if there is a think-advice entry and check-rule entry is not pre-wide-vision rule, increment pre-max;

volume begin play

when play begins:
	sort table of zero point taunts in random order;
	sort table of zero point taunts in sortval order;

Why Pout Definitions ends here.

---- DOCUMENTATION ----
