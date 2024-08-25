Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume includes

include Revealing Passages by Andrew Schultz.

volume new types

book followers

a follower is a kind of thing.

a follower can be unfriendly, friendly or donewith. a follower is usually unfriendly.

a follower can be needed or unneeded. a follower is usually needed.

a follower can be unchatted or chatted. a follower is usually unchatted.

a follower has text called help-chat.

definition: a follower (called f) is still-needed:
	if f is unneeded, no;
	if f is friendly, no;
	yes;

definition: a follower (called f) is still-chat-needed:
	if f is unneeded, no;
	if f is still-needed, yes;
	no;

to befriend (f - a follower):
	now f is friendly;
	move f to location of player;
	if number of friendly followers is 1:
		say "It looks like [the f] will be following you around. All that silence might get awkward, so you may wish to [b]T[r] or [b]TALK[r] ([b]TO[r]) them.";
	else if number of still-needed followers is 0:
		say "[line break]Wow! You've got quite a group here. You can't imagine needing a bigger one[if number of unfriendly followers > 0], though there's BRUISE-WARES[end if].";
	else if pals-made - number of chatted followers > 2:
		say "[line break]Hmm. You have a lot of friends following you around, but you haven't talked to them much. Perhaps you could learn something from them."

definition: a follower (called fo) is leftbehind:
	unless fo is friendly, no;
	if fo is in location of player, no;
	yes;	

every turn when block-followers is false (this is the followers follow you rule):
	if number of leftbehind followers > 0:
		let plurals be whether or not number of leftbehind followers > 1;
		if plurals is false:
			let rf be a random leftbehind follower;
			if rf is plural-named, now plurals is true;
		if number of leftbehind followers > 2:
			say "Your [number of leftbehind followers in words] companions follow you.";
		else:
			say "The [list of leftbehind followers] follow[if plurals is false]s[end if] you.";
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

volume begin play

when play begins:
	sort table of zero point taunts in random order;
	sort table of zero point taunts in sortval order;

Why Pout Definitions ends here.

---- DOCUMENTATION ----
