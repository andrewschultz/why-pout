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

current-random-table is a table name that varies. current-random-table is table of initial dialogues.

chapter variables

final-list-index is a number that varies.
modular-list-index is a number that varies.

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

to decide whether can-forward-dialogue:
	if opt-chat-on is false, no;
	if dialogue-row >= number of rows in current-random-table, no;
	if block-followers is true, no;
	if current action is ting, no;
	let my-nff be number of friendly followers;
	if my-nff < 8 and orc is friendly, decrement my-nff;
	if dialogue-row >= (my-nff * (my-nff - 1)) / 2, no;
	say "[my-nff], [(my-nff * (my-nff - 1)) / 2].";
	yes;

to decide which follower is talker1: decide on entry t1 of followers-as-joined;
to decide which follower is talker2: decide on entry t2 of followers-as-joined;

to say t1t2: say "[The talker1] and [the talker2]"

volume printing stuff out

every turn when can-forward-dialogue:
	increment dialogue-row;
	choose row dialogue-row in current-random-table;
	now t1 is mynum entry / 10;
	now t2 is remainder after dividing mynum entry by 10;
	if number of friendly followers < 8 and a random chance of 1 in 2 succeeds:
		let t0 be t1;
		now t1 is t2;
		now t2 is t0;
	if debug-state is true, say "[mynum entry] ... ";
	say "[mytext entry][line break]";
	if dialogue-row is number of rows in current-random-table:
		if current-random-table is table of initial dialogues:
			say "[line break][i][bracket][b]NOTE[r][i]: you've made it through the initial random dialogues, where the orc's dialogue is last. There are more random ones ahead. If you want to read them all without hitting [b]L[r][i] a lot, read the tables file.[close bracket][r]";
			now current-random-table is table of further dialogues;
			now dialogue-row is 0;
		else:
			say "[line break][i][bracket][b]NOTE[r][i]: you've made it through all the random dialogues. There are no more. I hope you found them entertaining.[close bracket][r]";

volume the actual tables

table of initial dialogues [this should have 28 entries. Runoff will have its own randomness.]
mynum	mytext
0	"[t1t2] sing the hit ballad 'Mile of My Love' together."
0	"[t1t2] pump each other up with 'Weep? Rep! We prep!'"
0	"[The talker1] reacts to [the talker2]'s terrible puns with 'Aw, flow off, lo!'"
0	"[t1t2] berate science fiction. More specifically, they start ripping star tripping."
0	"[The talker1] remarks 'Sun god sung? Odd!' to [the talker2]."
0	"[t1t2] briefly inspire each other to seem, or see, more."
0	"[t1t2] discuss the artsy book [i]Glow, Bland Globe Land[r]."
0	"[t1t2] discuss aesthetics: 'White owls? Why, towels?'"
0	"In a fit of bravado, [the talker1] snarks 'Bah! Scum boss, come!' [The talker2] soberly remarks, 'Uh, prepare up, repair.'"
0	"[t1t2] rib each other: 'Sane? Oh, say, NO!'"
0	"[t1t2] butter you up: 'See leadin['] seal Eden!'"
0	"[t1t2] nudge you: 'Uh, plots up?' 'Lots,' you reply."
0	"[t1t2] play 'Eyes, peek, I speak' to pass the time."
0	"[t1t2] cross-motivate: 'Key? Prepare, keep, repair.'"
0	"[t1t2] discuss the opulence of Go-True-GOAT Rue."
0	"[t1t2] discuss vacations at the Nice-Trip-Nigh Strip."
0	"[t1t2] discuss a moral dilemma: 'Lie for life, or...?'"
0	"[t1t2] bemoan the loss-fear law sphere enveloping a good chunk of the world."
0	"[The talker1], after jokey banter from [the talker2], says 'A score, ace! Cor[']!'"
0	"[t1t2] shudder at the twin villains Scarf Ace and Scar Face."
0	"[The talker1] defeats [the talker2] in rock-paper-scissors. 'My twin might win,' gripes [the talker2]."
80	"You hear the orc's voice: 'Grow now? Groan! Ow!' Then laughter from the orc and [the talker2]."
80	"[The talker2] playfully chides the orc 'Nuke id, new kid.'"
80	"The orc makes an impressive observation. 'Why so wise, oh?' needles [the talker2]."
80	"[The talker2] consoles the orc over a recalled 'Nice kid? Nigh, SKID.'"
80	"'Run time!' yells [the talker2], chasing the orc, who taunts 'Runt? I'm...'"
80	"Advice from [the talker2] to the orc: 'Wean [']Oh, we KNOW[']!'"
80	"'Wan adage? Wanna DODGE,' the orc complains to [the talker2]. It's restated better next time."

table of further dialogues
mynum	mytext
0	"[The talker1] informs [the talker2] of the healing powers of the Wall Cough-Walk-Off."
0	"[t1t2] discuss famous landmarks. 'Soap Lane? So plain!'"
0	"[The talker1] recounts a harrowing period of life to [the talker2]: 'Hell, dawn, held on!'"
0	"[The talker1] looks around at the scenery. 'You seek yews? Eek,' says [the talker2]."
0	"[t1t2] hang tough, looking like a spare ace pair."
0	"[The talker1] rebukes [the talker2]'s pessimism: 'Block a [']blah['], [']K?'"
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
0	"[The talker1] cuts in on [the talker2]: 'Who's ED, who said...'"
0	"[t1t2] vow never to whine 'Ow, why now?'"
0	"[t1t2] discuss separate harrowing trips to Walk Old-Wall-Cold."
0	"[t1t2], after sharing a clever joke, agree: 'We quit weak wit.'"
0	"[t1t2] argue over whether 'Beef it up! Be fit, up!' is proper motivation."
0	"[t1t2] discuss con artists: 'Get sold? Gets old!'"
0	"[t1t2] beef, ere 'Be fair!' from you. They apologize and makeup. You didn't know you had that leadership within you!"
0	"[t1t2] discuss the touching drama [i]Her, too, Hurt? Ooh[r]."
0	"[t1t2] have a technical discussion: 'Keen apps['] key? Naps!'"
0	"[t1t2] reject the shallow self-help of [i]I Learn, I'll Earn[r]."
0	"[t1t2] recall separate visits to the Dumb Pledge-Dump-Ledge."

volume testing without random shuffling - not for release

when play begins:
	sort quasirand-init-list in random order;
	repeat with QL running through quasirand-init-list:
		sort QL in random order;
		add QL to quasirand-final-list;
	say "[quasirand-final-list].";
	now followers-as-joined is list of followers;
	repeat through table of further dialogues:
		increment final-list-index;
		increment modular-list-index;
		if modular-list-index > 28:
			now modular-list-index is 1;
		if final-list-index > 28:
			now final-list-index is 1;
		now mynum entry is entry modular-list-index in quasirand-final-list;
		let QLE be entry final-list-index in quasirand-final-list;
		now t1 is QLE / 10;
		now t2 is remainder after dividing QLE by 10;
		say "[mytext entry][line break]";
	now followers-as-joined is {};

Why Pout Random Text ends here.

---- DOCUMENTATION ----
