Version 1/241021 of Why Pout Random Text by Andrew Schultz begins here.

"This is Why Pout's file for random NPC dialogue, including the quasi-randomization functions."

volume initialization

chapter lists

quasirand-init-list is a list of lists of numbers variable. quasirand-init-list is {
 { 81, 72, 63, 54 },
 { 82, 71, 64, 53 },
 { 83, 74, 61, 52 },
 { 84, 73, 62, 51 },
 { 85, 76, 41, 32 },
 { 86, 75, 42, 31 },
 { 87, 65, 43, 21 }
}.

quasirand-final-list is a list of numbers variable. quasirand-final-list is {}.

chapter variables

chapter start of game prep

when play begins:
	sort table of initial dialogues in random order;
	sort table of initial dialogues in mynum order;
	let tens be 2;
	let ones be 1;
	let numlist be { 1 };
	repeat through table of initial dialogues:
		now mynum entry is (tens * 10);
		increase mynum entry by (entry ones in numlist);
		increment ones;
		if ones is tens:
			add tens to numlist;
			increment tens;
			now ones is 1;
			sort numlist in random order;

chapter shortcuts and definitions

to decide whether basic-chat-block:
	if opt-chat-on is false, yes;
	if block-followers is true, yes;
	if current action is ting, yes;
	if player is in doom ending and skull is in doom ending, yes;
	no;

to decide whether init-table-done:
	if init-dialogue-row is number of rows in table of initial dialogues, yes;
	if init-dialogue-row is 21 and orc is not friendly, yes; [ this is hardcoded but unlikely to change ]
	no;

to decide which number is first-table-followers:
	let nu be number of friendly followers;
	if nu < 8 and orc is friendly, decrement nu;
	decide on nu;

to decide which number is max-init-dialogue:
	let X be (first-table-followers) * (first-table-followers - 1);
	decide on X / 2;

to decide whether can-init-dialogue:
	if basic-chat-block, no;
	if init-table-done, no;
	if init-dialogue-row >= max-init-dialogue, no;
	yes;

to decide whether can-second-dialogue:
	if basic-chat-block, no;
	unless init-table-done, no;
	yes;

to decide which follower is talker1: decide on entry t1 of followers-as-joined;
to decide which follower is talker2: decide on entry t2 of followers-as-joined;

to say t1t2: say "[The talker1] and [the talker2]"

to say nosplur1: say "[nosplur of talker1]";

to say nosplur2: say "[nosplur of talker2]";

to say nosplur of (th - a thing): unless th is plural-named, say "s";

volume printing stuff out

to reassign-t1-t2 (nu - a number):
	now t1 is nu / 10;
	now t2 is remainder after dividing nu by 10;

the initial table random dialogue rule is listed last in the every turn rules.
the further table random dialogue rule is listed before the initial table random dialogue rule in the every turn rules.

every turn when can-init-dialogue (this is the initial table random dialogue rule):
	increment init-dialogue-row;
	choose row init-dialogue-row in table of initial dialogues;
	reassign-t1-t2 mynum entry;
	if number of friendly followers < 8 and a random chance of 1 in 2 succeeds:
		let t0 be t1;
		now t1 is t2;
		now t2 is t0;
	if debug-state is true, say "first-npc ([init-dialogue-row]) [mynum entry] ... ";
	say "[mytext entry][line break]";
	if init-dialogue-row is number of rows in table of initial dialogues:
		say "[line break][i][bracket][b]NOTE[r][i]: you've made it through the initial random dialogues, where the orc's dialogue is last. There are more random ones ahead. If you want to read them all without hitting [b]L[r][i] a lot, read the tables file.[close bracket][r]";
	else if init-dialogue-row is 21 and orc is not friendly:
		say "[line break][i][bracket][b]NOTE[r][i]: you've made it through all the random dialogues you can with necessary companions. You're missing an optional one, who is not critical to the game. There will be more random ones after this.[close bracket][r][line break]";
	if gs-note-chatopt is false:
		now gs-note-chatopt is true;
		say "[line break][b]NOTE[r][i]: this is random dialogue you can shut off with [b]SCORCH AT[r] or turn back on with [b]SCORE CHAT[r][i].[close bracket][r][line break]";

every turn when can-second-dialogue (this is the further table random dialogue rule):
	increment second-dialogue-row;
	choose row second-dialogue-row in table of further dialogues;
	if mynum entry > 80 and orc is not friendly:
		increment missed-this-cycle;
		if debug-state is true, say "passed on [mynum entry] ...";
	else:
		reassign-t1-t2 mynum entry;
		if number of friendly followers < 8 and a random chance of 1 in 2 succeeds:
			let t0 be t1;
			now t1 is t2;
			now t2 is t0;
		if debug-state is true, say "second-npc [mynum entry] ... ";
		say "[mytext entry][line break]";
	if second-dialogue-row < number of rows in table of further dialogues, continue the action;
	now second-dialogue-row is 0;
	if gs-full-chat-notify is true, continue the action;
	now gs-full-chat-notify is true;
	if missed-this-cycle > 0:
		say "[i][bracket][b]NOTE[r][i]: you [if orc is friendly]missed [missed-this-cycle][else]saw about three-quarters of the[end if] random additional chat[if missed-this-cycle > 1]s[end if], because you didn't [if orc is friendly]have the orc along for it all[else]find an additional optional companion[end if]. If you want to see the rest, it's in the source code on my GitHub site.[close bracket][r][line break]";
		now missed-this-cycle is 0;
	else:
		say "[i][bracket][b]NOTE[r][i]: you've seen all the random dialogues.[close bracket][r][line break]";

volume the actual tables

table of initial dialogues [this should have 28 entries. Runoff will have its own randomness.]
mynum	mytext
0	"[t1t2] sing the hit ballad 'Mile of My Love' together."
0	"[t1t2] pump each other up with 'Weep? Rep! We prep!'"
0	"[The talker1] react[nosplur1] to [the talker2]'s terrible puns with 'Aw, flow off, lo!'"
0	"[t1t2] berate science fiction. More specifically, they start ripping star tripping."
0	"[The talker1] remark[nosplur1] 'Sun god sung? Odd!' to [the talker2]."
0	"[t1t2] briefly go in for cynicism: 'High pay? Hype, eh?'"
0	"[t1t2] discuss the artsy book [i]Glow, Bland Globe Land[r]."
0	"[t1t2] discuss aesthetics: 'White owls? Why, towels?'"
0	"In a fit of bravado, [the talker1] snark[nosplur1] 'Bah! Scum boss, come!' [The talker2] soberly remark[nosplur2], 'Uh, prepare up, repair.'"
0	"[t1t2] rib each other: 'Sane? Oh, say, NO!'"
0	"[t1t2] butter you up: 'See leadin['] seal Eden!'"
0	"[t1t2] nudge you: 'Uh, plots up?' 'Lots,' you reply."
0	"[t1t2] play 'Eyes, peek, I speak' to pass the time."
0	"[t1t2] cross-motivate: 'Key? Prepare, keep, repair.'"
0	"[t1t2] discuss the opulence of Go-True-GOAT Rue."
0	"[t1t2] discuss vacations at the Nice-Trip-Nigh Strip."
0	"[t1t2] discuss a moral dilemma: 'Lie for life, or...?'"
0	"[t1t2] bemoan the loss-fear law sphere enveloping a good chunk of the world."
0	"[The talker1], after jokey banter from [the talker2], say[nosplur of talker1] 'A score, ace! Cor[']!'"
0	"[t1t2] shudder at the twin villains Scarf Ace and Scar Face."
0	"[The talker1] defeat[nosplur of talker1] [the talker2] in rock-paper-scissors. 'My twin might win,' gripe[nosplur2] [the talker2]."
80	"You hear the orc's voice: 'Grow now? Groan! Ow!' Then laughter from the orc and [the talker2]."
80	"[The talker2] playfully chide[nosplur2] the orc 'Nuke id, new kid.'"
80	"The orc makes an impressive observation. 'Why so wise, oh?' needle[nosplur2] [the talker2]."
80	"[The talker2] console[nosplur2] the orc over a recalled 'Nice kid? Nigh, SKID.'"
80	"'Run time!' yell[nosplur2] [the talker2], chasing the orc, who taunts 'Runt? I'm...'"
80	"Advice from [the talker2] to the orc: 'Wean [']Oh, we KNOW[']!'"
80	"'Wan adage? Wanna DODGE,' the orc complains to [the talker2]. It's restated better next time."

table of further dialogues
mynum	mytext
0	"[The talker1] inform[nosplur1] [the talker2] of the healing powers of the Wall Cough-Walk-Off."
0	"[t1t2] discuss famous landmarks. 'Soap Lane? So plain!'"
0	"[The talker1] recount[nosplur1] a harrowing period of life to [the talker2]: 'Hell, dawn, held on!'"
0	"[The talker1] look[nosplur1] around at the scenery. 'You seek yews? Eek,' says [the talker2]."
0	"[t1t2] hang tough, looking like a spare ace pair."
0	"[The talker1] rebuke[nosplur1] [the talker2]'s pessimism: 'Block a [']blah['], [']K?'"
0	"[t1t2] discuss fashion: 'Argyle? Argh, I'll ... our guy'll...'"
0	"[t1t2] label the Lost Range Law strange."
0	"[t1t2] discuss conflicting views on the self-help treatise [i]Grope, Ride, Grow Pride[r]."
0	"[t1t2] reject the premise of [i]Ho! Ply hope? LIE![r]"
0	"[t1t2] excitedly recount different experiences at the amusment park Whee-Smile-Wheeze Mile."
0	"[t1t2] believe in each other! 'Sought out. Saw. Tout!'"
0	"[t1t2] look forward to the Star Tower Start Hour."
0	"[t1t2], being sports fans, both recount a particularly superb ol['] Super Bowl."
0	"[t1t2], being fluent in Pig Latin, discount over-cautious friends all 'isk-ray is cray'"
0	"[t1t2] discuss important historical events that occurred in 80 A. D."
0	"[t1t2] disagree over food: 'Tuna fish? Too naff-ish!'"
0	"[t1t2] remind everyone how guiding love is preferable to an iron guidin['] glove. It feels a bit artificial, but sometimes semantics aren't what's important."
0	"[The talker1] cut[nosplur1] in on [the talker2]: 'Who's ED, who said...'"
0	"[t1t2] vow never to whine 'Ow, why now?'"
0	"[t1t2] discuss separate harrowing trips to Walk Old-Wall-Cold."
0	"[t1t2], after sharing a clever joke, agree: 'We quit weak wit.'"
0	"[t1t2] argue over whether 'Beef it up! Be fit, up!' is proper motivation."
0	"[t1t2] discuss con artists: 'Get sold? Gets old!'"
0	"[t1t2] beef, ere 'Be fair!' from you. They apologize and make up. You didn't know you had that leadership within you!"
0	"[t1t2] discuss the touching drama [i]Her, too, Hurt? Ooh[r]."
0	"[t1t2] have a technical discussion: 'Keen apps['] key? Naps!'"
0	"[t1t2] reject the shallow self-help of [i]I Learn, I'll Earn[r]."
0	"[t1t2] recall separate visits to the Dumb Pledge-Dump-Ledge."
0	"[t1t2] give contrasting literary criticisms of [i]A Tower's Eight Hours[r]."
0	"[t1t2] start, but quickly curtail, a wheeze too 'We stew.'"
0	"[t1t2] say the same thing, but mean something different, about a pop singer's talent: 'Indie Niall? In denial!'"
0	"[t1t2] mutter they're overwhelmed by the size of the Storm-All-Store Mall."
0	"[The talker1] almost cast[nosplur1] an oath at ... 'Oh, THAT?!' [talker2] cut[nosplur2] in."
0	"[t1t2] discuss car parts and carp-arts. Nonsequiturs!"
0	"[t1t2] have different views on the best wake-your-way cure."

volume testing without random shuffling

when play begins (this is the seed random final dialogues rule):
	let modular-list-index be 0;
	let final-list-index be 0;
	if debug-state is false:
		sort quasirand-init-list in random order;
		sort table of further dialogues in random order;
	repeat with QL running through quasirand-init-list:
		if debug-state is false, sort QL in random order;
		add QL to quasirand-final-list;
	now followers-as-joined is list of followers;
	repeat through table of further dialogues:
		increment modular-list-index;
		if modular-list-index > 28:
			now modular-list-index is 1;
		let QLE be entry modular-list-index in quasirand-final-list;
		now mynum entry is QLE;
		now t1 is QLE / 10;
		now t2 is remainder after dividing QLE by 10;
		if debug-state is true, say "[mytext entry][line break]";
	now followers-as-joined is {};
	if debug-state is false, continue the action;
	say "Quasirandom / unsorted list: [quasirand-final-list].";

Why Pout Random Text ends here.

---- DOCUMENTATION ----
