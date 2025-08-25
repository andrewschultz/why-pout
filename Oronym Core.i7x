Version 1/241009 of Oronym Core by Andrew Schultz begins here.

"The Oronym Core file, which calls the spoonerism/oronym core file but also has specific oronym-related stuff."

volume includes

use authorial modesty.

section outside stuff

include Conditional Undo by Jesse McGrew. [for UNDO blocking war pawn]

section my stuff

include Spoonerism and Oronym Core by Andrew Schultz.

include Revealing Passages by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

volume things

a sentient is a kind of thing.

a sentient can be hostile, agreeable, impressable or neutral. a sentient is usually neutral.

rule for deciding whether all includes a sentient when taking: it does not; [disable TAKE ALL]

volume globals

gs-war-pawn-try is a truth state that varies.

gs-eye-note is a truth state that varies.

volume strings in common

to say generic-parser-error: say "That thought/action/observation/request brings up nothing. [this-game] has a limited set of verbs, and the main thing is to guess a two-word phrase. To see what verbs are used, try [b]VERBS[r]"

to general-thanks:
	say "[line break][b]GENERAL THANKS[r]:[paragraph break]";
	say "Thanks to everyone past and future involved in the administration of IFComp.";
	say "Thanks to the I7 board on Intfiction.org for their help, as well as the people in the general topics as we discussed our plans.";

volume I7 standard low-usage default verbs

book verbs to get rid of completely

understand the command "show" as something new.
understand the command "say" as something new.

book eating redefined

understand the command "eat" as something new.
understand the command "eat [thing]" as something new.

understand "eat [thing]" as noteating.

noteating is an action applying to one thing.

book entering

the can't enter what's not enterable rule is not listed in any rulebook.

check entering: say "You don't explicitly need to [b]ENTER[r] anything in [this-game]." instead;

book senses

the block listening rule is not listed in any rulebook.

carry out listening: say "A disembodied voice only you can hear taunts 'Eh? CLUES?! Ache! Lose!'" instead;

the block smelling rule is not listed in any rulebook.

carry out smelling: say "[one of]Nose takes no stakes! (Smelling isn't necessary. But there's another cutesy response, if you want.)[or]No funk, or fun. Cor![stopping]"

the block tasting rule is not listed in any rulebook.

carry out tasting: say "A voice: 'No tastings note. Eh?' Stings!";

the report touching yourself rule is not listed in any rulebook.

carry out touching: say "An internal voice says 'We poke, eh? Weep, okay?'";

understand "touch" as touching.

rule for supplying a missing noun when touching: now the noun is the player.

book misc others

chapter attacking

the block attacking rule is not listed in any rulebook.

carry out attacking:
	say "'[one of]No smack-nose, Mac[or]Punch-out?! Pun-shout[r]Hey, to hate, ooh[or]War may warm, eh[or]Gore? I'd go ride[or]Eh, kill-ache? Ill[in random order],' you think, randomly.";

chapter no / yes

the block saying no rule is not listed in any rulebook.
the block saying yes rule is not listed in any rulebook.

carry out saying yes: say "Black? White? Blah! Quite!" instead;
carry out saying no: try saying yes instead;

chapter singing

the block singing rule is not listed in any rulebook.

carry out singing:
	say "Funny, you feel a taste of icing." instead;

chapter sleeping

the block sleeping rule is not listed in any rulebook.

carry out sleeping: say "'Key? Nap! Keen app!' you mutter to yourself, but you remain wide awake." instead;

chapter swearing

the block swearing obscenely rule is not listed in any rulebook.
the block swearing mildly rule is not listed in any rulebook.

check swearing mildly: try swearing obscenely instead;

carry out swearing obscenely:
	say "'Cur! Say curse, eh?' I scold, ice-cold!";

book honorary default verb

[swearing is different between WP, which has its own dedicated section, and US.]

volume i7 common (but not core) meta verbs defined

chapter hinthelping

book hinting

volume talking

understand the command "ask" as something new.

ting is an action applying to one thing.

understand the command "t" as something new.

understand "t" as ting.
understand "t all" as ting.
understand "t [thing]" as ting.

understand "talk to" as ting.
understand "talk to [thing]" as ting.

understand "talk" as ting.
understand "talk [thing]" as ting.

understand "ask" as ting.
understand "ask [thing]" as ting.

volume right hand status line and scores (could be moved to universal file)

when play begins (this is the score and status tweak rule):
	now the right hand status line is "[current-score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed or max-bonus is 0][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	now the turn count is 1;

to decide which number is doable-hinted:
	let temp be 0;
	repeat through table of main oronyms:
		if think-cue entry is true and idid entry is false and core entry is true, increment temp;
	decide on temp;

volume meta verbs

book meta stuff

check quitting the game:
	say "A voice taunts you 'What? Changing your name to Ike Witt?'";

check restarting the game:
	say "A voice cackles 'Done, ooh? Duh, new!'";

check saving the game:
	say "A voice taunts 'Save?! I'll say, VILE!'";

volume meta rooms

Reap Rest is a room. moot-room is Reap Rest. "You should never get here."

volume drop and take replacement

a hintthing is a kind of thing. a hintthing can be dropwarned. a hintthing is usually not dropwarned. a hintthing has text called drop-poke. a hintthing has text called drop-notify-text.

drop2ing is an action applying to one thing.

understand the command "drop" as something new.
understand "drop [thing]" as drop2ing.
understand "drop" as drop2ing.

understand the command "throw" as something new.
understand the command "discard" as something new.

check drop2ing:
	say "You don't need to [b]DROP[r] anything in [this-game]. Most of what gets in your inventory will disappear when used successfully[if player has war pawn]. However, you may [b]DROP[r] the war pawn to remove the temptation to skip a puzzle[end if]." instead;

rule for supplying a missing noun when drop2ing:
	now noun is the player;

chapter drop2ing a hintthing

a wordtwisting rule (this is the autoreject rule): not-yet;

check drop2ing not dropwarned hintthing:
	say "[drop-poke of noun][line break]";
	now noun is dropwarned;
	if the player switch-consents:
		continue the action;
	else:
		say "Okay, there will be no nag next time you try to drop [the noun].";
	the rule succeeds;

check drop2ing hintthing:
	say "[drop-notify-text of noun][line break]";
	if noun is war pawn and war-pawn-uses is 0, max-down;
	moot noun;
	the rule succeeds;

chapter taking

check taking: if noun is not a hintthing, say "You never need to take anything explicitly in [this-game], though you have the option of taking two hint items. However, trying to take an item may give you a hint as to what you really need to do to acquire or use it." instead;

volume hint items and properties

a thing has a number called eyes-number. a thing has a rule called eyes-rule. eyes-rule of a thing is usually autoreject rule. eyes-number of a thing is usually 0.

a room has a number called eyes-number. a room has a rule called eyes-rule. eyes-rule of a room is usually autoreject rule. eyes-number of a room is usually 0.

check noteating a hintthing:
	if noun is eyes, say "This is not an EctoComp entry." instead;
	if noun is pawn, say "Eating pawns can help win the endgame in chess, but not here." instead;

book war pawn

the war pawn is a hintthing. description is "It's a grey chess pawn. It's currently [pawn-pose].[paragraph break]Looking at it from many different angles gets you all sorts of weird ideas. Perhaps it could help you when you run out of them on your quest. You may wish to wait until you really need to use it, though of course, you don't want to wait too late.". eyes-number of war pawn is -42. drop-poke of war pawn is "The war pawn can get you past up to three tough puzzles of your choosing. Drop it anyway to resist the temptation to jump ahead?". eyes-rule of war pawn is trivially true rule.

to say pawn-pose:
	if war-pawn-available-charges is 0:
		say "sleeping from previous use";
	else:
		say "[if war-pawn-available-charges is 2]very [else if war-pawn-available-charges > 2]extremely [end if]alert, with a frown and mean glare carved in the rounded top. Unlike most pawns, it has fists, doubled up in a fighting posture";

to post-pawn-charge:
	say "[line break]";
	if war-pawn-uses >= war-pawn-max-uses:
		say "The war pawn shrugs its shoulders, holds up the number three, waves, and runs off, making occasional diagonal jumps at unseen prey.";
		moot war pawn;
	else if war-pawn-available-charges <= 0:
		say "The war pawn curls up and goes to sleep after all that excitement. It needs some time to recover.";
	else:
		say "The war pawn looks slightly less awake after its exertions but still ready if needed."

report examining war pawn when war pawn is unexamined:
	say "IF you wish to understand the mechanics of the war pawn, [b]KNOW PAWN[r]. (This command will be in [b]VERBS[r] if you forget.)";
	continue the action;

report examining war pawn:
	if war-pawn-uses is 0:
		say "Oh, yes, you can't just [b]USE[r] the war pawn. You need a specific command, one in the spirit of [this-game].";
	else:
		say "You've used it [war-pawn-uses in words] time[if war-pawn-uses > 1]s[end if].";
	continue the action;

war-pawn-uses is a number that varies.
war-pawn-max-uses is a number that varies. war-pawn-max-uses is 3.

to decide what number is war-pawn-available-charges:
	let temp be (core-score * war-pawn-max-uses) - (war-pawn-uses * (core-max + 1));
	decide on (temp + core-max) / core-max;

drop-notify-text of war pawn is "It blows away violently. It must've been in Zugzwang or something.".

after examining war pawn for the first time:
	say "If you want to resist the temptation of this cheat item, [b]DROP[r] it. There is no penalty for using it.";
	continue the action;

check eyeing war pawn:
	if war-pawn-uses > 0, say "You already know to [b]WARP ON[r]." instead;
	say "You reflect on the irony of using a hint item on a hint item, but then, you see a result!";

check ting war pawn:
	if war-pawn-available-charges is 0, say "Shh! It's (still) sleeping!" instead;
	say "The war pawn is all about action, not talking. Say the command and it will help you if it can." instead;

check ting eyes: say "They have a lot to show you, but they can't say a thing." instead;

to check-run-rules: do nothing;

rule for printing a parser error when player has war pawn:
	if the player's command includes "pawn":
		if gs-war-pawn-try is true:
			say "[b]WARP ON[r], which you tried earlier, is the way to use the pawn.";
		else:
			say "There's a special command to use the pawn, in the spirit of [this-game].";
	continue the action;

chapter knowpawning

knowpawn-table-row is a number that varies.

knowpawning is an action out of world.

understand the command "know pawn" as something new.

understand "know pawn" as knowpawning when player has war pawn.

carry out knowpawning:
	increment knowpawn-table-row;
	choose row knowpawn-table-row in table of knowpawn chat;
	say "[kp-chat entry] ([knowpawn-table-row]/[number of rows in table of knowpawn chat])";
	if knowpawn-table-row is number of rows in table of knowpawn chat:
		say "[one of] (end of pawn advice. It will now loop)[or][stopping]";
		now knowpawn-table-row is 0;
	say "[line break]";

table of knowpawn chat
kp-chat
"The pawn requires a special command to use. There is no penalty for trying to use it when it can't help you."
"The pawn tries to determine if any puzzles are solvable right now. If they are, it picks the first one in the game's internal table. I've tried to sort these so you solve the trickiest available."
"The pawn may also try and fail. This means there's something you can guess but aren't ready to solve--you need other materials."
"The pawn has three uses throughout [this-game], though they are spaced out. It doesn't recharge until you've gotten 1/3 of the points on your own, then 2/3."
"You can store up pawn charges for the endgame."

chapter nopeoning

gs-nope-on-warn is a truth state that varies.
gs-nope-on is a truth state that varies.

nopeoning is an action out of world.

understand the command "nope on" as something new.

understand "nope on" as nopeoning.

check nopeoning when gs-nope-on-warn is false:
	now gs-nope-on-warn is true;
	say "Ah! Good job! You've found the secret command to REALLY get rid of the war pawn. [if war-pawn-uses > 0]Sadly, this won't get you a bonus point, since you already used the pawn[else]This will get you a bonus point[end if]. Of course, you won't be able to use the pawn after this. Ditch the pawn?";
	if the player no-consents:
		say "Okay.";
		continue the action;
	say "Okay. No warning next time.";

carry out nopeoning:
	say "The war pawn jumps out of your hand and down to the ground with a perfect feet-first landing. It salutes you and then runs off, taking occasional diagonal jumps to gobble up vulnerable ants and insects.";
	now gs-nope-on is true;
	if war-pawn-uses is 0:
		up-min;
		follow the score and thinking changes rule;
	moot war pawn;
	the rule succeeds;

to nope-check: if gs-nope-on is false, say "You had a way to dismiss the war pawn other than [b]DROP[r] to get a bonus point. NB: to do so you need not to actually use it."

chapter warponing

warponing is an action out of world.

understand the command "warp on" as something new.

understand "warp on" as warponing when war pawn is not off-stage or debug-state is true.

check warponing:
	if war pawn is moot, say "You dream of having the war pawn help you at your current impasse. Alas, it is gone. You then picture it cheering all 'I knew you could do it' once you figure what to do, and that makes you feel better." instead;
	if war-pawn-available-charges < 0:
		say "The war pawn is still sleeping from previous use. Get further in your quest, and the pawn will re-awaken[one of]. I promise![or].[stopping]" instead;

our-run-rule is a rule that varies.

carry out warponing:
	let flag-almost-cheat be false;
	let flag-this-room be false;
	now gs-war-pawn-try is true;
	now verb-dont-print is true;
	repeat through table of main oronyms:
		unless there is a core entry, next;
		if core entry is false, next;
		if idid entry is true, next;
		process the check-rule entry;
		let vr be the outcome of the rulebook;
		if vr is the ready outcome:
			if think-cue entry is true or (first-exact entry is true and second-exact entry is true):
				say "[one of]The war pawn glows hot in your hand, then taps its head several times. You feel slightly insulted. Why didn't it give a hint?[paragraph break]As you [b]THINK[r] a bit, you [if think-cue entry is false]realize you had figured something by halves and never put it together--perhaps you can [b]THINK[r] to see what[else]wonder if some things you tried, things that seemed like they should work, might work now[end if]. Perhaps the war pawn is just making sure its help is not wasted![or]The war pawn glows hot in your hand and taps its head again. You must've made more progress than you assumed--if you [b]THINK[r], you might realize what you can do now.[stopping]";
				the rule succeeds;
			say "After some thought, the war pawn vibrates and gestures wildly! You suddenly have insight into a good way forward: ";
			say "[b][first-of-ors of w1 entry]";
			if there is a w2 entry, say " [first-of-ors of w2 entry]";
			say "[r]...";
			if idid entry is false, up-reg;
			if war-pawn-uses is 0, max-down; [because you lose the chance for the NOPE ON bonus]
			now our-run-rule is run-rule entry;
			check-run-rules;
			now idid entry is true;
			now think-cue entry is false;
			process the run-rule entry;
			now gs-war-pawn-used is true;
			post-pawn-charge;
			if debug-state is true:
				say "[line break]Remember, to keep the war pawn/reset the charges, use WP.";
			follow the score and thinking changes rule;
			game-specific-cleanup;
			game-specific-post-point-debugging-check;
			if undo-okayed is false, prevent undo;
			the rule succeeds;
		else if there is a best-room entry and best-room entry is location of player:
			if vr is the not-yet outcome:
				now flag-almost-cheat is true;
			else:
				now flag-this-room is true;
	if flag-almost-cheat is true:
		say "The war pawn rattles briefly in your hand, like it means to do something, but it's not ready. Or maybe you aren't. Yet.";
	else if flag-this-room is true:
		say "The war pawn seems to warm up very briefly. Perhaps there's a bit left to do here, but that may be a way down the road.";
	else:
		say "The war pawn stays still and even feels a bit cold. Perhaps there's nothing that specifically needs doing here.";
	now verb-dont-print is false;
	the rule succeeds;

rule for deciding whether to allow undo:
	if undo is prevented, say "Allowing you to undo using the war pawn is a bit too much of a loophole. There's a walkthrough. Or you can save and restore a lot before warping."

to game-specific-cleanup: do nothing;

to game-specific-post-point-debugging-check: do nothing;

section warpon debug check(s) - not for release

check warponing when debug-state is true:
	if the player's command includes "wp":
		say "Resetting war pawn uses.";
		now war-pawn-uses is 0;
	if war pawn is off-stage and debug-state is true:
		say "(Grabbing war pawn for testing)";
		now player has war pawn;

book sly size slice eyes

the sly size slice eyes are a plural-named hintthing. eyes-number of sly size slice eyes is 1. printed name is "sly size-slice eyes". drop-poke of slice eyes is "Are you sure you wish to drop [the noun]? They give a clue as to the length of any solution.". description is "The eyes shift around a lot, looking for stuff normal human eyes can't see.[paragraph break]To have them analyze the room, [b]EYE[r] with no argument. To have them analyze something, [b]EYE[r] it. You can also [b]EYE[r] the eyes themselves to spell out precisely how they work.". understand "eye" as eyes.

drop-notify-text of sly size slice eyes is "'Ire, ol['] eye. Roll!' you mutter. The eyes roll away.[paragraph break]'A dumb aid, umm,' you think to yourself."

to eyes-rebuke: if player has eyes, say "[line break]You also swear [the eyes] stared at you, as if to say, we could've told you that was well off the mark. (They're not big on creativity, alas.)";

chapter eyeing

eye-the-room is a truth state that varies.

understand the command "eye" as something new.
understand the command "eyes" as something new.

eyeing is an action out of world applying to one thing.

understand "eye [thing]" as eyeing when eyes are touchable.
understand "eyes [thing]" as eyeing when eyes are touchable.

check eyeing eyes when player does not have eyes and eyes are touchable:
	say "(taking the eyes first)[paragraph break]";
	now player has eyes;

eye-table-num is a number that varies.

check eyeing eyes:
	increment eye-table-num;
	choose row eye-table-num in table of eye help;
	say "[eye-info entry] ([eye-table-num]/[number of rows in table of eye help])[line break]";
	if eye-table-num is number of rows in table of eye help, now eye-table-num is 0;
	the rule succeeds;

table of eye help
eye-info
"The eyes will light up two sets of dots if there is something you still need to do in the area."
"The numbers of dots correspond to the number of letters in the first and second words to type, respectively."
"The dots also have two different types of appearances that clue you to the puzzle nature: green or yellow, and dimly glowing or glowing."
"Green dots mean the suggested action can score a point right now."
"Yellow dots mean you have something to guess, but you won't get a point, as you haven't found the right items or assistance from other puzzles to make things work. It will be kept in [b]THINK[r]."
"Finally, a dimly glowing reading indicates something you can change for a bonus point. It's not critical to complete [this-game][one of]. (End of hints. Next [b]EYE EYES[r] starts the hint cycle again)[or].[stopping]"

definition: a thing (called th) is wortheyeing:
	if eyes-number of th is 0 or eyes-number of th is -1, no;
	let this-rule be eyes-rule of th;
	process this-rule;
	let rb-out be outcome of the rulebook;
	if rb-out is the ready outcome, yes;
	no;

the see if EYE is in THINK rule is listed first in the report eyeing rulebook.

report eyeing (this is the see if EYE is in THINK rule):
	let rule-to-look be eyes-rule of location of player;
	if eye-the-room is false:
		let rule-to-look be eyes-rule of noun;
	repeat through table of main oronyms:
		if check-rule entry is not rule-to-look, next;
		if think-cue entry is true or (first-exact entry is true and second-exact entry is true):
			say "Hmm. After using the eyes, you realize you may've already worked things out. Maybe [b]THINK[r] and revisit what you tried.";
			now eye-the-room is true;
			the rule succeeds;
	now eye-the-room is false;
	continue the action;

carry out eyeing:
	if eye-the-room is true:
		if eyes-number of location of player >= -1 and eyes-number of location of player <= 1:
			now verb-dont-print is true;
			let mylist be the list of touchable wortheyeing things;
			now verb-dont-print is false;
			if number of entries in mylist is 0, say "Nothing for the general area, and [the eyes] don't point to any individual item." instead;
			if number of entries in mylist is 1:
				say "The eyes see nothing in the general area but seem to be wandering to [the entry 1 in mylist]." instead;
			now verb-dont-print is true;
			say "Nothing for the general area, though [the eyes] seem to wander between [the list of touchable wortheyeing things].";
			now verb-dont-print is false;
			the rule succeeds;
		abide by the eyeguessing rulebook for eyes-number of location of player;
	else:
		abide by the eyeguessing rulebook for eyes-number of noun;
	the rule succeeds;

carry out eyering:
	now eye-the-room is true;
	try eyeing the player;
	the rule succeeds;

eyering is an action out of world.

understand "eye" as eyering when player has slice eyes or slice eyes are examined.
understand "eyes" as eyering when player has slice eyes or slice eyes are examined.

section first time yellow/dim

gs-ever-dim-note is a truth state that varies.
gs-this-dim-note is a truth state that varies.

gs-ever-yellow-note is a truth state that varies.
gs-this-yellow-note is a truth state that varies.

chapter report eyeing rules

report eyeing when gs-ever-dim-note is false and gs-this-dim-note is true:
	now gs-ever-dim-note is true;
	say "[i][bracket][b]NOTE[r][i]: the dim dots mean something. You can [b]EYE EYES[r][i] to pin down what, if you don't want to guess.[close bracket][r][line break]";
	continue the action;

report eyeing when gs-ever-yellow-note is false and gs-this-yellow-note is true:
	now gs-ever-yellow-note is true;
	say "[i][bracket][b]NOTE[r][i]: the yellow dots mean something unusual. You can [b]EYE EYES[r][i] to pin down what, if you don't want to guess.[close bracket][r][line break]";
	continue the action;

the note first time using eyes rule is listed first in the report eyeing rules.

report eyeing (this is the note first time using eyes rule):
	if gs-eye-note is false:
		now gs-eye-note is true;
		say "[i][bracket][b]NOTE[r][i]: while the number of dots on the eyes is the main thing, they also have two binary settings: green or yellow, and glowing or dimly glowing. [b]EYE EYES[r][i] will walk you through what the eyes['] different outputs mean.[close bracket][r][line break]";
	continue the action;

chapter eyeguessing

eyeguessing is a number based rulebook.

eyeguessing a number (called n):
	now gs-this-yellow-note is false;
	now gs-this-dim-note is false;
	if sly size slice eyes are moot, say "But you ditched [the eyes], so you can't [b]EYE[r] any more." instead;
	if player does not have sly size slice eyes, say "But you don't have what you need to [b]EYE[r] anything." instead;
	if n is -1:
		say "The eyes show nothing. You've changed up everything you need [eye-with]." instead;
	else if n is 0 or n is 1:
		say "The eyes show nothing. Probably don't need to change up anything [eye-with]." instead;
	else if n is 2:
		say "The eyes almost seem to light up. Perhaps you need to do something later [eye-with], when things are noticeably different." instead;
	if n < 0, now gs-this-dim-note is true;
	if n < 0:
		now n is 0 - n;
	let this-rule be eyes-rule of location of player;
	if eye-the-room is true:
		now this-rule is eyes-rule of location of player;
	else:
		now this-rule is eyes-rule of noun;
	now verb-dont-print is true;
	process this-rule;
	now verb-dont-print is false;
	let rb-out be outcome of the rulebook;
	say "The eyes ";
	if rb-out is the not-yet outcome or rb-out is the not-ever outcome:
		now gs-this-yellow-note is true;
		say "light up [if gs-this-dim-note is true]a dim [end if]yellow";
	else if gs-this-dim-note is true:
		say "glow dimly green";
	else:
		say "light up green";
	say " and show [(n / 10) in words] dots, then [(remainder after dividing n by 10) in words] dots.";

to declue-here: now eyes-number of location of player is -1

to declue (th - a thing): now eyes-number of th is -1

volume report (metaverb) rules in common

report abouting:
	say "[line break][b]CREDITS[r] lists people who helped make [this-game] a reality, or at the very least, a better version than it would've been without them. [b]EXT[r] lists the extensions used, and [b]VERSION[r]/[b]VERSIONS[r] shows version information. [b]VERBS[r] describes what actions are best used with this stripped-down parser.";
	continue the action;

report verbsing when player has eyes:
	say "Since you have [the eyes], [b]EYE[r] can be used on any item or person. Without an argument, it looks at the whole surrounding area. If you don't need to act on the room, it will flag specific items you can change.";
	continue the action;

report verbsing when player has pawn: say "A special command is required to use the war pawn. [if core-score > 4]Now[else]Once[end if]you've got a few points, you shouldn't have much trouble figuring it[if core-score < core-max / 5], though you may wish to save it for later[end if][if war pawn is examined]. You can [b]KNOW PAWN[r] to see its mechanics[end if].";

volume requesting the score

gs-score-range-note is a truth state that varies.

the announce the score rule is not listed in any rulebook.

carry out requesting the score:
	say "You have scored [core-score] of [core-max] necessary points";
	if cur-bonus > 0:
		say " and [cur-bonus] of a possible [max-bonus] bonus point[if max-bonus is not 1]s[end if]";
	else:
		say ", though you haven't found any of the [max-bonus] bonus points yet";
	say ".";
	if gs-score-range-note is false:
		say "[line break]The upper right status line provides a range of possible final scores, based on bonus points gained and available.";
		now gs-score-range-note is true;
	if doable-hinted > 0, say "[line break]You also figured [doable-hinted in words] thing[if doable-hinted > 1]s[end if] you weren't ready for yet. Revisit [if doable-hinted is 1]it[else]them[end if] with [b]THINK[r].";
	the rule succeeds;

volume thinking

got-think is a truth state that varies.

carry out thinking (this is the right phrase wrong time rule):
	now got-think is false;
	say "You try and think of stuff you tried, but the time wasn't quite right, or maybe you only figured it half-way.[paragraph break]";
	repeat through table of main oronyms:
		if think-cue entry is true:
			now got-think is true;
			if idid entry is true:
				say "Oops, I somehow forgot to reset the think-cue entry for [w1 entry] [w2 entry]. This is a trivial bug in under-the-hood code that won't cause an unwinnable state or anything--but still, I'd like to know so I can fix it!";
				now think-cue entry is false;
			else:
				if there is a think-advice entry:
					say "[think-advice entry][line break]";
				else:
					say "[first-of-ors of w1 entry] [first-of-ors of w2 entry] is something you tried before it was perfectly ready. That I can offer no further details is a BUG I need to fix--I need to add a think-advice entry.";
	process the partial-oronym-check rule;

report thinking:
	if got-think is false:
		say "Nothing comes to mind.";
	continue the action;

this is the partial-oronym-check rule:
	repeat through table of main oronyms:
		if think-cue entry is true or idid entry is true, next;
		if first-exact entry is false and first-close entry is false and second-exact entry is false and second-close entry is false, next;
		let rights be (boolval of first-exact entry + boolval of second-exact entry);
		let almosts be 0;
		if first-close entry is true and first-exact entry is false, increment almosts;
		if second-close entry is true and second-exact entry is false, increment almosts;
		if rights is 2:
			say "You feel you've got the words right on separate occasions for ";
		else if rights is 1:
			say "You must have one word right[if almosts is 1] and one word close[end if] for ";
		else if rights is 0:
			say "You must be close with [if almosts is 1]one word[else]both words[end if] for ";
		say "[part-explain entry].";
		now got-think is true;

volume waiting and empty commands

go-dot-known is a truth state that varies.

check waiting:
	now go-dot-known is true;
	say "You sense a goad-ought-go dot creeping up on you. Okay, a dot can't do much harm, but it [i]is[r] a hint you don't need to stand around." instead;

understand "godot" as a mistake ("You wait for [this-game] to move beyond English colloquialisms to abusing French pronunciation. You wait a while. You're sure the decision will come soon!") when go-dot-known is true.

rule for printing a parser error when the latest parser error is the I beg your pardon error (this is the Oronym pardon begging rule):
	say "Ideally I-D-L-E!";
	the rule succeeds;

volume command to eye everything you can - not for release

eyeall-test is a truth state that varies.

test e with "how so/ea".

eaing is an action out of world.

understand the command "ea" as something new.

understand "ea" as eaing when debug-state is true.

carry out eaing:
	if eyeall-test is false, follow the eyeall rule;
	now eyeall-test is true;

this is the eyeall rule:
	if player does not have eyes, now player has eyes;
	say "ROOM:[line break]";
	try eyering;
	say "[line break]THINGS:[line break]";
	repeat with X running through eyeable things:
		say "[X]...";
		try eyeing X;
	the rule succeeds;

definition: a thing (called th) is eyeable: [this can and should be changed by game, so there is less of a text dump]
	if th is touchable, yes;
	no;

volume THINK 1/2

the check forks rule is listed first in the for printing a parser error rulebook.

gs-ever-partial-noted is a truth state that varies.

rule for printing a parser error (this is the check forks rule):
	now partial-row is 0;
	now got-partial-done is false;
	abide by the main-wordtwisting-checker rule for table of main oronyms;
	[if mrlp is valid, abide by the main-wordtwisting-checker rule for spoontable of mrlp;]
	if partial-row > 0:
		if partial-now is true:
			say "A voice in your head encourages you: 'Seem, or see, more!' You've got SOMETHING right, here.";
			if gs-ever-partial-noted is false:
				say "[line break][i][bracket][b]NOTE[r][i]: this and other half-right guesses will be tracked in [b]THINK[r][i] until you figure the right phrase.[close bracket][line break]";
				now gs-ever-partial-noted is true;
		else:
			if debug-state is true:
				choose row partial-row in table of main oronyms;
				say "(DEBUG: [check-rule entry] tripped) ";
			say "Not much happens, but you feel like that might help, at least halfway, some time later. Much later, or just a little, you can't tell.";
		if partial-but-got-before is true:
			say "[line break][i][bracket][b]NOTE[r][i]: you've actually already figured both words before. [b]THINK[r][i] may refresh your memory.[close bracket][i][line break]";
		the rule succeeds;
	if got-partial-done is true:
		if debug-state is true, say "[partial-row] row ...";
		if number of words in the player's command < 4:
			say "Hmm, no, you already did that, or something like that. You'll know if and when you need to flip between things.";
			the rule succeeds;
	continue the action;

volume generalizable parser errors

rule for printing a parser error when the latest parser error is the only understood as far as error:
	if action-to-be is the ting action:
		say "It looks like you tried to ask about a subject. [this-game] doesn't support detailed conversation like [b]ASK THEM ABOUT THAT[r]. Only [b]ASK THEM[r] or [b]T[r]/[b]TALK THEM[r].";
		the rule succeeds;
	say "The first word was a valid command that could stand on its own. The second may be unnecessary, or a typo.";

to say suggested-cantsee-command:
	if action-to-be is the eyeing action:
		say "[b]EYE[r] without a subject for the room, or to see what needs changing in the room";
	else:
		say "[b]L[r] or [b]LOOK[r]"

Oronym Core ends here.

---- DOCUMENTATION ----
