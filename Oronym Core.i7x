Version 1/241009 of Oronym Core by Andrew Schultz begins here.

"The Oronym Core file, which calls the spoonerism/oronym core file but also has specific oronym-related stuff."

volume includes

use authorial modesty.

include Spoonerism and Oronym Core by Andrew Schultz.

include Revealing Passages by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

volume things

a sentient is a kind of thing.

volume I7 standard low-usage default verbs

book senses

the block listening rule is not listed in any rulebook.

carry out listening: say "You hear only a taunting 'Eh? CLUES?! Ache! Lose!'";

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
	say "'Cur! Say curse, eh?'";

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

volume drop replacement

a hintthing is a kind of thing. a hintthing can be dropwarned. a hintthing is usually not dropwarned. a hintthing has text called drop-poke.

drop2ing is an action applying to one thing.

understand the command "drop" as something new.
understand "drop [thing]" as drop2ing.
understand "drop" as drop2ing.

check drop2ing war pawn:
	if noun is war pawn:
		moot war pawn;
		say "It blows away violently. It must've been in Zugzwang or something." instead;

check drop2ing:
	if noun is eyes:
		moot eyes;
		say "They eyes roll away. 'Ire, ol['] eye roll!', you think to yourself." instead;
	say "You don't need to [b]DROP[r] anything in [this-game]. Most of what gets in your inventory will disappear when used successfully.[if player has war pawn]. However, you may [b]DROP[r] the war pawn to remove the temptation to skip a puzzle[end if]." instead;

rule for supplying a missing noun when drop2ing:
	now noun is the player;

chapter drop2ing a hintthing

a wordtwisting rule (this is the autoreject rule): not-yet;

check drop2ing hintthing:
	if noun is dropwarned, continue the action;
	now noun is dropwarned;
	say "[drop-poke of noun]";
	if the player switch-consents:
		say "Okay.";
		moot noun;
	else:
		say "Okay, there will be no nag next time you try to drop [the noun].";
	the rule succeeds;

volume hint items and properties

a thing has a number called eyes-number. a thing has a rule called eyes-rule. eyes-rule of a thing is usually autoreject rule.

a room has a number called eyes-number. a room has a rule called eyes-rule. eyes-rule of a room is usually autoreject rule.

book war pawn

the war pawn is a hintthing. description is "It's a grey chess pawn with a frown and mean glare carved in the rounded top. If it had fists, you are pretty sure they'd be doubled up in a fighting posture, but it doesn't even have arms.[paragraph break]Looking at it from many different angles gets you all sorts of weird ideas. Perhaps it could help you when you run out of them on your quest. You may wish to wait until you really need to use it, though of course, you don't want to wait too late.". eyes-number of war pawn is -42. drop-poke of war pawn is "The war pawn can get you past a tough puzzle of your choosing. Drop it anyway to resist the temptation to jump ahead?". eyes-rule of war pawn is trivially true rule.

after examining war pawn for the first time:
	say "If you want to resist the temptation of this cheat item, [b]DROP[r] it. There is no penalty for using it.";
	continue the action;

check eyeing war pawn: say "You reflect on the irony of using a hint item on a hint item, but then, you see a result!";

book sly size slice eyes

the sly size slice eyes are a plural-named hintthing. eyes-number of sly size slice eyes is 1. printed name is "sly size-slice eyes". drop-poke of slice eyes is "Are you sure you wish to drop [the noun]? They give a clue as to the length of any solution.". description is "The eyes shift around a lot, looking for stuff normal human eyes can't see. If you wish them to look at something, [b]EYE[r] it, or just [b]EYE[r] the room. You can even [b]EYE[r] the eyes themselves to spell out precisely how they work.". understand "eye" as eyes.

chapter eyeing

eyering is an action out of world.

understand the command "eye" as something new.
understand the command "eyes" as something new.

understand "eye" as eyering when player has slice eyes.
understand "eyes" as eyering when player has slice eyes.

eyeing is an action out of world applying to one thing.

understand "eye [thing]" as eyeing when player has slice eyes.
understand "eyes [thing]" as eyeing when player has slice eyes.

check eyeing eyes:
	say "[one of]The eyes will light up two sets of dots if there is something relevant to clue. (+)[or]The numbers of dots correspond to the number of letters in each word. (+)[or]The dots also have two binary settings: green or yellow, and dimly glowing or glowing. (+)[or]Green dots mean something you can move forward with now. (+)[or]Yellow dots mean something you can guess, but you don't have the right items or assistance to move forward. (+)[or]Finally, a dimly glowing reading is something that is optional for completing [this-game]. (End of hints. Next [b]EYE EYES[r] starts the hint cycle again)[cycling][line break]" instead;

chapter eyeguessing

eyeguessing is a number based rulebook.

eyeguessing a number (called n):
	if sly size slice eyes are moot, say "But you ditched [the eyes], so you can't [b]EYE[r] any more." instead;
	if player does not have sly size slice eyes, say "But you don't have what you need to [b]EYE[r] anything." instead;
	if n is -1:
		say "The eyes show nothing. You've done everything you need to [eye-with]." instead;
	else if n is 0 or n is 1:
		say "The eyes show nothing. Probably don't need to do anything [eye-with]." instead;
	else if n is 2:
		say "The eyes almost seem to light up. Perhaps you need to do something later [eye-with], when things are noticeably different." instead;
	let dimly be whether or not n < 0;
	if n < 0:
		now n is 0 - n;
	let this-rule be eyes-rule of location of player;
	if current action is eyeing:
		now this-rule is eyes-rule of noun;
	now verb-dont-print is true;
	process this-rule;
	now verb-dont-print is false;
	let rb-out be outcome of the rulebook;
	say "The eyes ";
	if rb-out is the not-yet outcome:
		say "light up [if dimly is true]a dim [end if]yellow";
	else if dimly is true:
		say "glow dimly";
	else:
		say "light up green";
	say " and show [(n / 10) in words] dots, then [(remainder after dividing n by 10) in words] dots.";

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
		say "[i][bracket][b]NOTE[r][i]: the eyes have two binary settings: green or yellow, and glowing or dimly glowing. This, along with the hints, may be intuitive, but if it is not, [b]EYE EYES[r][i] will spell things out.[close bracket][line break]";

to declue-here: now eyes-number of location of player is -1

to declue (th - a thing): now eyes-number of th is -1

book report / verbs rules

report verbsing when player has eyes:
	say "With [the eyes], you can [b]EYE[r] the area to see if it can be changed, or you can [b]EYE[r] any object.";
	continue the action;

report verbsing when player has war pawn:
	say "With [the war pawn], [if gs-war-pawn-try is true][b]WARP ON[r][else]there must be a way[end if] to gain insight to pass a tricky puzzle.";
	continue the action;

Oronym Core ends here.

---- DOCUMENTATION ----
