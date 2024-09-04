Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume includes

include Revealing Passages by Andrew Schultz.

volume game specific definitions

definition: a rule (called ru) is thinkblocking:
	if ru is pre-wide-vision rule, yes;
	no;

volume new types

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

most-recent-swear is a swearblob that varies.

swear-index is a number variable. swear-index is 0.

swears-order is a list of things variable.

when play begins:
	now swears-order is the list of swearblobs;
	sort swears-order in random order;

most-recent-swear is a swearblob that varies.

every turn when player is in brew swears and sco-weak-us is true and number of entries in swears-order > 0 (this is the cycle swears randomly rule):
	increment swear-index;
	if swear-index > number of entries in swears-order, now swear-index is 1;
	now most-recent-swear is entry swear-index in swears-order;
	if most-recent-swear is not in brew, move most-recent-swear to brew;
	say "[one of]Your observation has caused something to 'righteously' snap in the [grinch]. And boy, are they going to firehose you with their 'best!'[paragraph break][or][stopping][description of most-recent-swear][line break]";

chapter alphorder - not for release

a swearblob has a number called alphorder.

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

to decide which number is orc-score:
	decide on (boolval of sco-weak-us) + (boolval of sco-crew-dork);

to decide which number is brew-swears-score:
	decide on (boolval of sco-brew-swears) + (boolval of sco-weak-us) + (boolval of sco-grin-churls) + (boolval of sco-crew-dork) + (boolval of sco-huh-shit) + (boolval of sco-lie-fuckers) + (boolval of sco-heckle-ass) + (boolval of sco-were-dicks) + (boolval of sco-bastard-eee) [yes, it's possible we could define a function called boolsum of brew-swears but this does the job for now]

book meta scoring

to decide which number is pre-acts:
	let return-value be 0;
	repeat through table of main oronyms:
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
			if check-rule entry is not pre-wide-vision rule and check-rule entry is not pre-crew-dork rule, increment pre-max;

volume begin play

when play begins:
	sort table of zero point taunts in random order;
	sort table of zero point taunts in sortval order;

Why Pout Definitions ends here.

---- DOCUMENTATION ----
