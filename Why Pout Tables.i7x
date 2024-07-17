Version 1/240717 of Why Pout Tables by Andrew Schultz begins here.

"Tables for Why Pout"

volume the main tables

book very general stuff

table of main oronyms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"nah"	"phase"	--	--	false	true	true	false	naff haze	vc-nah-phase rule	vr-nah-phase rule	--	--

section naff haze scoring

a wordtwisting rule (this is the vc-nah-phase rule):
	if player is not in naff haze, unavailable;
	if sco-nah-phase is true:
		vcal "You already dispelled the haze!";
		already-done;
	ready;

this is the vr-nah-phase rule:
	now sco-nah-phase is true;
	say "Hooray! You figured what to do! You get a point!";

sco-nah-phase is a truth state that varies.

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
