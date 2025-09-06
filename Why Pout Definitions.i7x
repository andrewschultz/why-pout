Version 1/240816 of Why Pout Definitions by Andrew Schultz begins here.

"Definitions for Why Pout"

volume includes

volume game specific definitions

definition: a rule (called ru) is thinknoteblocking:
	if ru is pre-wide-vision rule, yes;
	no;

volume cheat item stuff

a room can be bonuspointy or needpointy. a room is usually needpointy.

to say eye-with:
	if current action is eyering:
		say "with the general area, though specific things may provide a clue";
	else if noun is a follower:
		say "to make friends with [the noun]";
	else if noun is a sentient:
		say "to [if noun is hostile]neutralize[else if noun is agreeable]aid[else]improve[end if] [the noun]";
	else:
		say "with [the noun]";

chapter room specific rule(s)

check eyeing (this is the time to wipe out rule):
	if player is in doom ending and sco-cease-cull is true and sco-wipe-out is false:
		say "The eyes look around frantically. It feels like quite a moment, where you need a big moment or action. They show four dots, then three dots." instead;

check eyering when player is in brew swears and sco-weak-us is false:
	say "It's not the room so much as the 'we cuss' vibes the eyes seem to be picking up.";

check eyering:
	abide by the time to wipe out rule;
	if player is in brew swears and number of swearblobs in brew swears is 1:
		let RSB be random swearblob in brew swears;
		try eyeing RSB instead;

volume new types

book sentient

a sentient can be prefollowing. a sentient is usually not prefollowing. [defined in the core: this is for things you can talk to but they take lower priority than followers]

book followers (defined in global file)

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

definition: a follower (called f) is usefully-chatted:
	if f is unneeded, no;
	if f is chatted, yes;
	no;

to befriend (f - a follower):
	now f is friendly;
	move f to location of player;
	if f is not shrewd orc:
		add f to followers-as-joined;
	if number of friendly followers is 8, add shrewd orc to followers-as-joined;
	if f is mice or f is elf:
		if mice are friendly and elf is friendly:
			say "[line break]'Mice, elf, myself,' you muse to yourself. Not aloud, of course. Anyone who sits around all day thinking up stuff like that just isn't fit for leadership.";
	if number of friendly followers is 1:
		say "[line break]It looks like [the f] will be following you around. All that silence might get awkward, so you may wish to [b]T[r] or [b]TALK[r] ([b]TO[r]) them.";
	else if number of friendly followers is 3:
		say "[line break][i][bracket][b]NOTE:[r][i] in order to simplify things now you've grown your party, you can type [b]UH PARTY[r][i] or [b]A PARTY[r][i] so everyone is not listed individually. [b]APART EEE[r][i] (or [b]EE[r][i]/[b]EEEE[r][i]) will list them individually again. This is all in [b]VERBS[r][i].[close bracket][r][line break]";
	else if number of still-follow-needed followers is 0:
		if f is orc:
			say "[line break]You thought you didn't need anyone else, and maybe you don't, but you're glad to have the orc along, all the same.";
		else:
			say "[line break]You look at your group of new friends. You really couldn't ask for any more[if number of unfriendly followers > 0 and bruise wares is not moot], though maybe there's one behind [wares][end if].";
	else if (number of friendly followers >= 4) and (pals-made - number of chatted followers > 2):
		say "[line break]Hmm. You have a lot of friends following you around, but you haven't talked to them much. Perhaps you could learn something from them.";

definition: a follower (called fo) is leftbehind:
	unless fo is friendly, no;
	if fo is in location of player, no;
	yes;	

to decide whether can-lump-party:
	if number of friendly followers >= 3, yes;
	no;

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

every turn when block-followers is false (this is the followers follow you rule): [practically, some of this code may not be necessary. It's impossible to get the mice first. But we'd like to be accurate with the code, if we can.]
	if number of leftbehind followers > 0:
		if opt-lump-party is true:
			say "Your [number of leftbehind followers in words] companions follow you[mouse-check].";
		else:
			say "The [list of leftbehind followers] follow[if not say-plural-moving-followers]s[end if] you.";
		follow-you;

to follow-you:
	repeat with X running through leftbehind followers:
		move X to location of player;

to allow-follows:
	now block-followers is false;
	if companions are not off-stage, now player has companions;

to block-follows:
	now block-followers is true;
	if companions are not off-stage, moot companions;

chapter follower chat text

dialogue-list is a list of text variable. dialogue-list is {
"It makes sense out of something odd you saw. Perhaps other friends will be able to help similarly.",
"The chat helps reassure you that you've missed nothing big, but you still have more to learn.",
"You throw around some other observations: a few, you should've realized, but no worries. You got it now.",
"Your chat nicely pieces together information from your other companions you talked to.",
"You have a new perspective on something you, with your experience so far, were pretty sure was true. As well as something that would've blown your mind beforehand.",
"You realize the chat has filled in some holes you were curious about but felt sheepish asking.",
"Piecing together your chats with all your companions, you have a cohesive what/why/how. It's a bit confusing to spell out, but you've internalized how things fit together, how your friends will cooperate, and so forth."
}.

book statuses

to decide whether has-quid:
	if sco-six-quid is true and current-quid > 0, yes;
	no;

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

to swear-prev-next-from-order: [ make a linked list from the sorted list. This could have been done right away, but the code still would've been tricky. We'd need "a swear-blob can be linked-yet" then "let first-swear be (random swear)" then "let next-swear be a random not linked-yet swear" and add prev/next. Then when none are linked, let prev-swear of first be last. That seemed trickier than this. ]
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

to say nosplur of (th - a thing): unless th is plural-named, say "s";

to say splur of (nu - a number): if nu > 1, say "s";

volume definitions

definition: a direction (called d) is viable:
	if the room d of location of player is nowhere, no;
	yes;

volume combo numbers

to decide which number is core-pals-made: decide on number of friendly needed followers;

to decide which number is pals-made: decide on number of friendly followers;

to decide which number is pals-overall-needed: decide on number of needed followers;

to decide which number is pals-still-needed: decide on number of needed not friendly followers;

to decide which number is up-for-chat: decide on number of still-chat-needed followers in location of player;

to decide which number is useful-chats: decide on number of usefully-chatted followers in location of player;

to decide which number is flier-isle-score:
	decide on (boolval of sco-grow-vial) + (boolval of sco-the-file) + (boolval of sco-war-file);

to decide which number is plane-dir-score:
	decide on (boolval of sco-pole-east) + (boolval of sco-grow-star) + (boolval of sco-shore-trail) + (boolval of sco-key-pillar);

to decide which number is keep-score:
	decide on (boolval of sco-gnome-old) + (boolval of sco-rogue-old) + (boolval of sco-manna-curb) + (boolval of sco-plan-tracker) + (boolval of sco-see-design) + (boolval of sco-knife-right);

to decide which number is orc-score:
	decide on (boolval of sco-weak-us) + (boolval of sco-crew-dork);

[yes, it's possible we could define a function called boolsum of brew-swears but this does the job for now]

to decide which number is brew-swears-score:
	decide on (boolval of sco-brew-swears) + (boolval of sco-weak-us) + (boolval of sco-crew-dork) + (boolval of sco-grin-churls) + (boolval of sco-ass-low) + (boolval of sco-bastard-eee) + (boolval of sco-damn-peons) + (boolval of sco-heckle-ass) + (boolval of sco-huh-shit) + (boolval of sco-lie-fuckers) + (boolval of sco-were-dicks) + (boolval of sco-gah-wanker)

when play begins (this is the decide-brew-swears-max rule):
	repeat through table of main oronyms:
		if there is a best-room entry and best-room entry is brew swears, increment brew-max;

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

volume internal map

[not very useful since Inform doesn't connect rooms at the beginning, but I do like to make it tidy when I can]

first-rooms is a region.

last-rooms is a region.

chapter intro

index map with Hype Lane mapped east of Eh Raw Air Aww.
index map with NaffHaze mapped northeast of Hype Lane.

chapter midgame

index map with NoNotion mapped south of NaffHaze.
index map with Wand Wharf mapped east of NoNotion.

index map with KeepIller mapped west of NaffHaze.
index map with Nigh Fright mapped west of KeepIller.

index map with Wolf Rock mapped north of NaffHaze.
index map with We Loan mapped northwest of Wolf Rock.
index map with Hideout mapped north of Wolf Rock.

index map with Lobe End mapped east of NaffHaze.
index map with Storm Isle mapped north of Lobe End.
index map with Trees Mall mapped north of Storm Isle.

index map with Brew Swears mapped northwest of NaffHaze.

chapter endgame

index map with Worm Eaten mapped north of Nigh Fright.
index map with Doom Ending mapped north of worm eaten.

Why Pout Definitions ends here.

---- DOCUMENTATION ----
