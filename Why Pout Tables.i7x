Version 1/240717 of Why Pout Tables by Andrew Schultz begins here.

"Tables for Why Pout"

volume the main tables

book very general stuff

table of main oronyms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"an"	"aim"	--	--	false	true	true	false	eh raw air aww	pre-an-aim rule	post-an-aim rule	--	--
"two"	"maps"	--	--	false	true	true	false	eh raw air aww	pre-two-maps rule	post-two-maps rule	--	--
"shore"	"trail"	--	--	false	true	true	false	eh raw air aww	pre-shore-trail rule	post-shore-trail rule	--	--
"nah|naah"	"phase"	--	--	false	true	true	false	naff haze	vc-nah-phase rule	vr-nah-phase rule	--	--
"wipe"	"out"	--	--	false	true	true	false	naff haze	pre-wipe-out rule	post-wipe-out rule	--	--
"known"	"ocean"	--	--	false	true	true	false	NoNotion	pre-known-ocean rule	post-known-ocean rule	--	--
"six"	"quid"	--	--	false	true	true	false	NoNotion	pre-six-quid rule	post-six-quid rule	--	--
"well"	"own"	--	--	false	true	true	false	we loan	pre-well-own rule	post-well-own rule	--	--
"whee"	"lone"	--	--	false	true	true	false	we loan	pre-whee-lone rule	post-whee-lone rule	--	--
"boost"	"role"	--	--	false	true	true	false	--	pre-boost-role rule	post-boost-role rule	--	--

section air aww scoring

a wordtwisting rule (this is the pre-two-maps rule):
	if player is not in air aww or sco-an-aim is false, unavailable;
	ready;

this is the post-two-maps rule:
	now sco-two-maps is true;
	say "You look around for secrets. You find one line that is a hash of horizontal linesand another that is a hash of vertical lines. You put them together ... and you see a passage out of the maze that traps you in!";

section unsorted scoring

a wordtwisting rule (this is the pre-boost-role rule):
	if booze troll is not touchable, unavailable;
	if sco-boost-role is true:
		vcal "You already gave the booze troll a boost!";
		already-done;
	ready;

this is the post-boost-role rule:
	now sco-boost-role is true;
	say "You talk with the booze troll for a bit. They seem not to know who they are, and that gives you something in common with them. You begin chatting with them. You have a friend now.";
	move booze troll to location of player;
	now booze troll is friendly;

section eh raw air aww scoring

a wordtwisting rule (this is the pre-an-aim rule):
	if sco-an-aim is true:
		vcal "You already found a name and an aim!";
		already-done;
	ready;

this is the post-an-aim rule:
	now sco-an-aim is true;
	say "Yes. Now that you realize you want more than just to know your name, that you have bigger goals, you push a bit harder when you initially forget it. You remember patches of the past. You remember people harshly calling you by your last name, then your first.[paragraph break]Your name is Dee Cline.[paragraph break]You look around a bit. You can see more, now.";
	move short rail to Eh Raw Air Aww;

section air aww scoring

a wordtwisting rule (this is the pre-shore-trail rule):
	if short rail is off-stage or player is not in air aww, unavailable;
	if sco-shore-trail is true:
		vcal "But you already replaced the short rail!";
		already-done;
	ready;

this is the post-shore-trail rule:
	now sco-shore-trail is true;
	say "There must be more to the short rail than you see. And you start tracing where it is, where it can be, where it should go. You find something to dig up. It's ... surprisingly malleable. You have nothing else to do, anyway. Soon it feels like pulling cable from a ground. It's tough, since you can't see around, but indeed, the short rail does lead to a shore trail that leads south.";
	moot short rail;
	move shore trail to eh raw air aww;
	now NoNotion is mapped south of Eh Raw Air Aww;
	now Eh Raw Air Aww is mapped north of NoNotion;

a wordtwisting rule (this is the pre-wipe-out rule):
	if player is not in naff haze, unavailable;
	if sco-wipe-out is true:
		vcal "You already wiped out what you needed to!";
		already-done;
	if 1 is 1:
		vcp "You aren't feeling too great, but you don't want or need to wipe yourself out, yet. Perhaps you can find the root of your problems and wipe it out one day, though.";
		not-yet;
	if 1 is 1:
		vcp "You have nothing you need to wipe out right now.";
		not-yet;
	ready;

this is the post-wipe-out rule:
	now sco-wipe-out is true;
	say "Well that does it! You win the game!";

section naff haze testing

a wordtwisting rule (this is the vc-nah-phase rule):
	if player is not in naff haze, unavailable;
	if sco-nah-phase is true:
		vcal "You already dispelled the haze!";
		already-done;
	ready;

this is the vr-nah-phase rule:
	now sco-nah-phase is true;
	say "The haze seemed too thick at first. But you recognize it doesn't have to be there.";

section no notion scoring

a wordtwisting rule (this is the pre-known-ocean rule):
	if player is not in NoNotion, unavailable;
	if sco-known-ocean is true:
		vcal "But you already got a notion for the ocean. And you didn't even need a potion!";
		already-done;
	ready;

this is the post-known-ocean rule:
	now sco-known-ocean is true;
	say "Ah, yes. Things clear up a bit now. There we go ... you see where an ocean should be, and ... yes, you dip your toe in some wetness. Things clear up. You even see a sick squid! Maybe you can help it.";
	move sick squid to NoNotion;

a wordtwisting rule (this is the pre-six-quid rule):
	if player is not in nonotion, unavailable;
	if sco-six-quid is true:
		vcal "You don't need any more money, and the squid doesn't need any more help.";
		already-done;
	ready;

this is the post-six-quid rule:
	now sco-six-quid is true;
	say "You have an idea what is bothering the squid. Yes, a few coins stuck. Surprisingly, it lets you help out.";
	now player has quid;

[to check-squid-flyer:
	if player has maps:
		say "[line break]The squid gestures towards the two maps, as if it can take you wherever you need to on the maps. But it does look a little exhausted. So you don't just want to summon it for a joyride.";]

section we loan scoring

a wordtwisting rule (this is the pre-well-own rule):
	if player is not in we loan, unavailable;
	if sco-well-own is true:
		vcal "You already exposed the shady side here.";
		already-done;
	ready;

this is the post-well-own rule:
	now sco-well-own is true;
	say "Yes. There's a definite shady side.";

a wordtwisting rule (this is the pre-whee-lone rule):
	if player is not in we loan, unavailable;
	if sco-whee-lone is false:
		vcp "Well, maybe later...";
		not-yet;
	if sco-whee-lone is true:
		vcal "You already got this place to yourself!";
		already-done;
	ready;

this is the post-whee-lone rule:
	now sco-whee-lone is true;
	say "You get rid of the predatory loaners.";

volume command parsing

the check forks rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check forks rule):
	now partial-row is 0;
	now got-partial-done is false;
	abide by the main-wordtwisting-checker rule for table of main oronyms;
	[if mrlp is valid, abide by the main-wordtwisting-checker rule for spoontable of mrlp;]
	if partial-row > 0:
		say "Hmm. You are on the right track, there.";
		the rule succeeds;
	if got-partial-done is true:
		say "Hmm, no, you already did that, or something like that. You'll know if and when you need to flip between things.";
		the rule succeeds;
	continue the action;

volume can't go that way

table of noways
noway-rm	noway-txt
Eh Raw Air Aww	"[if sco-an-aim is false]You can't see anywhere. You know almost nothing. I mean, you don't even have a name. What would you do even if there was a passage?[else if number of viable directions is 0]You still can't find anywhere to go, yet. But there seem to be clues where to go, and how, if you look around.[else]You haven't made passage [noun] yet, though you can go [list of viable directions].[end if]"

volume scoring to move [see RoL Defs if I add bonus points]

the score and thinking changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.

to say went-by (nu - a number): say "just went [if nu > 0]up[else]down[end if] by [nu in words] point[unless nu is 1 or nu is -1]s[end if]";

this is the score and thinking changes rule:
	let sco-delt be current-score - last-current-score;
	if sco-delt is 0, continue the action;
	say "[line break]Your score just went up by [if sco-delt is 1]a point[else][sco-delt in words] points[end if]!";
	now last-current-score is current-score;

section copied from PRPR globals

core-max is a number that varies. core-max is 1.

max-bonus is a number that varies. max-bonus is 0.

core-score is a number that varies.

cur-bonus is a number that varies.

last-cur-bonus is a number that varies.

last-current-score is a number that varies.

cur-max-bonus is a number that varies. [ what is achievable in the current game state? ]

to decide which number is bonus-locked-out: decide on max-bonus - cur-max-bonus;

when play begins (this is the set current max points to max points rule): now cur-max-bonus is max-bonus;

to decide which number is current-score: decide on core-score + cur-bonus;

to decide which number is min-needed: decide on core-max + cur-bonus.

to decide which number is max-available: decide on core-max + cur-max-bonus.

to decide which number is max-overall: decide on core-max + max-bonus.

Why Pout Tables ends here.

---- DOCUMENTATION ----
