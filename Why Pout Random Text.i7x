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

chapter start of game dialogue shuffling

when play begins (this is the initial dialogue table seeding rule):
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
			sort numlist in random order; [ reshuffle so we have 5 4 6 2 1 3 or whatever for 7 to pick from ]
		if there is no flipnpcs entry:
			now flipnpcs entry is whether or not a random chance of 1 in 2 succeeds;

when play begins (this is the further dialogue table seeding rule):
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
		if there is no flipnpcs entry:
			now flipnpcs entry is whether or not a random chance of 1 in 2 succeeds;
	now followers-as-joined is {};

chapter shortcuts and definitions

to decide whether basic-chat-block:
	if opt-chat-on is false, yes;
	if block-followers is true, yes;
	if current action is ting or current action is thinking, yes;
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

volume printing stuff out

to reassign-t1-t2 (nu - a number) and (ts - a truth state):
	now t1 is nu / 10;
	now t2 is remainder after dividing nu by 10;
	if ts is true:
		let t0 be t1;
		now t1 is t2;
		now t2 is t0;

the initial table random dialogue rule is listed last in the every turn rules.
the further table random dialogue rule is listed before the initial table random dialogue rule in the every turn rules.

every turn when can-init-dialogue (this is the initial table random dialogue rule):
	increment init-dialogue-row;
	choose row init-dialogue-row in table of initial dialogues;
	reassign-t1-t2 mynum entry and flipnpcs entry;
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
	if (remainder after dividing mynum entry by 100) > 80 and orc is not friendly:
		increment missed-this-cycle;
		if debug-state is true, say "passed on [mynum entry] since this needs the orc and we don't have the orc ...";
	else:
		reassign-t1-t2 mynum entry and flipnpcs entry;
		if debug-state is true, say "second-npc [mynum entry] ... ";
		say "[mytext entry][line break]";
	if second-dialogue-row < number of rows in table of further dialogues, continue the action;
	now second-dialogue-row is 0;
	if gs-full-chat-notify is true, continue the action;
	now gs-full-chat-notify is true;
	if missed-this-cycle > 0:
		say "[i][bracket][b]NOTE[r][i]: you [if shrewd orc is friendly]missed [missed-this-cycle][else]saw about three-quarters of the[end if] random additional chat[if missed-this-cycle > 1]s[end if], because you didn't [if orc is friendly]have the orc along for it all[else]find an additional optional companion[end if]. If you want to see the rest, it's in the source code on my GitHub site.[close bracket][r][line break]";
		now missed-this-cycle is 0;
	else:
		say "[i][bracket][b]NOTE[r][i]: you've seen all the random dialogues.[close bracket][r][line break]";

volume the actual tables

table of initial dialogues [this should have 28 entries. Runoff will have its own randomness.]
mynum	flipnpcs	mytext
0	--	"[t1t2] sing the hit ballad 'Mile of My Love' together."
0	--	"[t1t2] pump each other up with 'Weep? Rep! We prep!'"
0	--	"[The talker1] react[nosplur1] to [the talker2]'s terrible puns with 'Aw, flow off, lo!'"
0	--	"[t1t2] berate science fiction. More specifically, they start ripping star tripping." [e]
0	--	"[The talker1] remark[nosplur1] 'Sun god sung? Odd!' to [the talker2]."
0	--	"[t1t2] briefly go in for cynicism: 'High pay? Hype, eh?'"
0	--	"[t1t2] discuss the artsy book [i]Glow, Bland Globe Land[r]."
0	--	"[t1t2] discuss aesthetics: 'White owls? Why, towels?'"
0	--	"In a fit of bravado, [the talker1] snark[nosplur1] 'Bah! Scum boss, come!' [The talker2] soberly remark[nosplur2], 'Uh, prepare up, repair.'"
0	--	"[t1t2] rib each other: 'Sane? Oh, say, NO!'"
0	--	"[t1t2] butter you up: 'See leadin['] seal Eden!'"
0	--	"[t1t2] nudge you: 'Uh, plots up?' 'Lots,' you reply."
0	--	"[t1t2] play 'Eyes, peek, I speak' to pass the time."
0	--	"[t1t2] cross-motivate: 'Key? Prepare, keep, repair.'"
0	--	"[t1t2] discuss the opulence of Go-True-GOAT Rue." [e]
0	--	"[t1t2] discuss vacations at the Nice-Trip-Nigh Strip." [e]
0	--	"[t1t2] discuss a moral dilemma: 'Lie for life, or...?'"
0	--	"[t1t2] bemoan the loss-fear law sphere enveloping a good chunk of the world." [^loss]
0	--	"[The talker1], after jokey banter from [the talker2], say[nosplur of talker1] 'A score, ace! Cor[']!'"
0	--	"[t1t2] shudder at the twin villains: 'Scarf Ace! Scar Face!'"
0	--	"[The talker1] defeat[nosplur of talker1] [the talker2] in rock-paper-scissors. 'My twin might win,' gripe[nosplur2] [the talker2]."
80	false	"You hear the orc's voice: 'Grow now? Groan! Ow!' Then laughter from the orc and [the talker2]."
80	false	"[The talker2] playfully chide[nosplur2] the orc 'Nuke id, new kid.'"
80	false	"The orc makes an impressive observation. 'Why so wise, oh?' needle[nosplur2] [the talker2]."
80	false	"[The talker2] console[nosplur2] the orc over a recalled 'Nice kid? Nigh, SKID.'"
80	false	"'Run time!' yell[nosplur2] [the talker2], chasing the orc, who taunts 'Runt? I'm...'" [~run time runt im]
80	false	"Advice from [the talker2] to the orc: 'You learn, you'll earn!'"
80	false	"'Wan adage? Wanna DODGE,' the orc complains to [the talker2]. It's restated better next time."

table of further dialogues
mynum	flipnpcs	mytext
0	--	"[The talker1] inform[nosplur1] [the talker2] of the healing powers of the Wall Cough-Walk-Off." [e]
0	--	"[t1t2] seem struck, as if by a vision. 'See plots seep! Lots!'"
0	--	"[The talker1] recount[nosplur1] a harrowing period of life to [the talker2]: 'Hell, dawn, held on!'"
0	--	"[The talker1] look[nosplur1] around at the scenery. 'You seek yews? Eek,' says [the talker2]."
0	--	"[t1t2] hang tough, looking like a spare ace pair." [e]
0	--	"[The talker1] rebuke[nosplur1] [the talker2]'s pessimism: 'Block a [']blah['], [']K?'"
0	--	"[t1t2] discuss fashion: 'Argyle? Argh, I'll ... our guy'll...'" [e]
0	--	"[t1t2] label the Lost Range Law strange." [e]
0	--	"[t1t2] discuss conflicting views on the self-help treatise [i]Grope, Ride, Grow Pride[r]."
0	--	"[t1t2] reject the premise of [i]Ho! Ply hope? LIE![r]"
0	--	"[t1t2] excitedly recount different experiences at the amusement park Whee-Smile-Wheeze Mile." [e]
0	--	"[t1t2] believe in each other! 'Sought out. Saw. Tout!'" [e]
0	--	"[t1t2] look forward to the Star Tower Start Hour." [e]
0	--	"[t1t2], being sports fans, both recount a particularly superb ol['] Super Bowl." [e]
0	--	"[t1t2], being fluent in Pig Latin, discount over-cautious friends all 'isk-ray is cray'" [e]
0	--	"[t1t2] discuss important historical events that occurred in 80 A. D." [untestable]
0	--	"[t1t2] disagree over food: 'Tuna fish? Too naff-ish!'" [e]
0	--	"[t1t2] remind everyone how guiding love is preferable to an iron guidin['] glove. It feels a bit artificial, but sometimes semantics aren't what's important." [~guiding love guidin glove]
0	--	"[The talker1] cut[nosplur1] in on [the talker2]: 'Who's ED, who said...'"
0	--	"[t1t2] vow never to whine 'Ow, why now?'" [e]
0	--	"[t1t2] discuss separate harrowing trips to Walk Old-Wall-Cold." [e]
0	--	"[t1t2] gush over stirring wonders of nature such as the cold ants['] coal dance." [e]
0	--	"[t1t2] argue over whether 'Beef it up! Be fit, up!' is too-simplistic motivation." [~beef it up be fit]
0	--	"[t1t2] discuss con artists: 'Get sold? Gets old!'"
0	--	"[t1t2] dissect how [i]Funk, Id, Fun Kid[r] has cliched lyrics, but the beat and melody? Addictive!"
0	--	"[t1t2] beef, ere 'Be fair!' from you. They apologize and make up. You didn't know you had that leadership within you!" [^beef]
0	--	"[t1t2] discuss the touching drama [i]Her, too, Hurt? Ooh[r]."
0	--	"[t1t2] have a technical discussion: 'Keen apps['] key? Naps!'"
0	--	"[t1t2] reject the shallow fable of the I-Learn, Isle Urn." [e]
0	--	"[t1t2] recall separate visits to the Dumb Pledge-Dump-Ledge." [e]
0	--	"[t1t2] give contrasting literary criticisms of [i]A Tower's Eight Hours[r]."
0	--	"[t1t2] start, but quickly curtail, a wheeze too 'We stew.'" [e]
0	--	"[t1t2] say the same thing, but mean something different, about a pop singer's talent: 'Indie Niall? In denial!'"
0	--	"[t1t2] mutter they're overwhelmed by the size of the Storm-All-Store Mall." [e]
0	--	"[The talker1] almost cast[nosplur1] an oath at ... 'Oh, THAT?!' [talker2] cut[nosplur2] in." [^oath]
0	--	"[t1t2] discuss car parts and carp-arts. Nonsequiturs!" [~car parts carp arts]
0	--	"[t1t2] have different views on the best wake-your-way cure." [e]
0	--	"[t1t2] vow to wean 'Oh, we know' from their talk. And 'Ooh, we knew,' too." [^wean]
0	--	"[t1t2] hope for the clear-headedness of Wayne Eye-Way-Nigh." [e]
0	--	"[t1t2] moralize 'Uh, greed? Ugh! Read!' It feels slightly forced, and you have no time to right now, but you appreciate the sentiment."
0	--	"[t1t2] discuss whether the fatalism in the number-one song [i]I'm Owned, I Moaned[r] is really realistic."
0	--	"[t1t2] recall specific passages from the poignant book [i]You-Threw-Youth Rue[r]."
0	--	"[t1t2] are just joking, really, about 'Co-plots? Cope, lots!'"
0	--	"[t1t2] joke they'll write an account of this titled 'Us: Log a Slog.'"
0	--	"[t1t2] recount that cornerstone of outdoorsmanship, [i]Might, Wine, My Twine[r]."
0	--	"This one takes a while to suss out. [t1t2] might be talking of a meet-rec-me-trek or a meet-wreck-me-trek." [^*meet]
0	--	"[t1t2] commiserate. 'A plod! Up, lawd!'"
0	--	"[t1t2] poke everyone else: 'Group? Ours grew powers!'"
0	--	"[t1t2] look forward to earning, once their work is done here, the relaxation of a long-aim lawn game." [e]
0	--	"[t1t2] discuss might-rust-my-trust actions that, well, [i]did[r], in the past." [^might]
0	--	"[t1t2] jest together: 'Me? Cause meek aws?'"
0	--	"[t1t2] differ on the Sway-Thus Way, that latest dance craze." [^the]
0	--	"[t1t2] get serious a bit. They need to focus. 'Aim! Use a muse!'"
0	--	"[t1t2] bemoan having no Rake-It Ray Kit to take out bad guys." [^rake]
0	--	"[t1t2] assure each other neither belongs on Porch At-Poor-Chat." [e]
0	--	"[t1t2] discuss the civil rights implications of the Save Isle-Say-Vile movement." [^save]
0	--	"[t1t2] look briefly downcast before singing [i]Hold On, Whole Dawn[r]."
0	--	"[t1t2] recall separate harrowing hazing trips to the I-Stank Ice Tank, for a social group much less fun than this." [^i]
0	--	"[t1t2] discuss the best tools for a sly mop-slime op." [e]
0	--	"[t1t2] give you thumbs-ups, saying 'Us: eyed a SIDE!'"
0	--	"[t1t2] express pride they're no I-Loaf Isle-Oaf." [e]
0	--	"[t1t2] commiserate: 'Awful hours? Aww, flowers.'"
0	--	"[t1t2] laugh at the comedy of manners [i]A Creep's Ache-Reaps[r]."
0	--	"[t1t2] ooh and ahh at [i]Go, Staid Ghost, Aid[r] before, oops! Don't want to spoil the ending."
0	--	"[t1t2] strike up a marching chant: 'Hi, call! Hike, all!'"
0	--	"[t1t2] elucidate why Start-Reigning Star Training is too good to be true." [^start]
0	--	"[t1t2] lead a chorus of 'Uh, stuff US?! Tough!'"
0	--	"[t1t2] reaffirm their altruism: 'Gold-after goal? DAFTER!'"
0	--	"[t1t2] exhort their friends: 'Goal, after? Go, laughter!'"
0	--	"[t1t2] cajole 'More fear? Morph [']ere.'"
0	--	"[t1t2] sing the mournfully catchy dirge [i]Isle-O'-Eye-Low[r]. It actually boosts the mood!"
0	--	"[t1t2] recap polar adventures and vacations: 'I saw ice, aww!'"
0	--	"[t1t2] play a scenery-finding game: 'Eh, spry ace, pry!'"
0	--	"[t1t2] share a revelation. 'Whee! Doubt-weed-out!'"
0	--	"[t1t2] whisper behind your back. When you shoot them a glance, they quip 'See no scene, oh!'"
0	--	"[t1t2] compare their 'thought-of-thaw?-tough!' faces."
0	--	"[t1t2] cajole 'Woes mile? Whoa, smile!' before switching to 'Haze mile? Hey, smile!'"
0	--	"[t1t2] provide encouragement for all: 'To-do [']tude, ooh!'"
0	--	"[t1t2] imitate cranky old schoolteachers they knew: 'Loaf, you low few!'"
0	--	"[t1t2] discuss ways to defeat the State-I'd-Stay-Tied mentality." [^state]
0	--	"[t1t2] whisper, giggle and moan playfully. 'Pun to punt, ooh!'"
0	--	"[t1t2] exclaim 'Party-Ville?! Part-evil!'"
0	--	"[t1t2] gush over the bargains you find at So-Plain Soap Lane." [^so]
0	--	"[t1t2] show equanimity: 'High-pressed hype?! Rest.'"
0	--	"[t1t2] spitball why the scan-thus can's mind-reading claims are fraudulent." [^the]
0	--	"[t1t2] gossip '... made out? May doubt...'" [^made]
0	--	"[t1t2] explore pathos and bathos in [i]A Current Acre, Rent[r]."
0	--	"[t1t2] get a little anxious. 'Eyes?! Where?! I swear!'"
0	--	"[t1t2] worry that neither can recall if they'd been to See-Nile-Scene Isle." [e]
0	--	"[t1t2] expound on the dangers of Pass-True-Past Rue's fake nostalgia." [^pass]
0	--	"[t1t2] discuss sightseeings. 'Miss Tile Mist Isle,' they agree. Beautiful, but if you slip and fall..."
0	--	"[t1t2] are surprised to not how much they miss Stale Mist Ale." [e]
0	--	"[t1t2], discussing vacations, consider a pilgrimage to Miss Tower-Mist-Hours." [e]
0	--	"[t1t2] try a general pep talk: 'Ho! Pluck, hope, luck!'"
0	--	"[t1t2] don't mind winter enough to invest in a Make-It-May Kit." [e]
0	--	"[t1t2] disagree on the likability of the unreliable narrator of [i]Eh, Sly Ace, Lie[r]."
0	--	"[t1t2] groan about contacts with bad-jokes-badge oaks." [e]
0	--	"[t1t2] trail off ... 'Made our May dour.'"
0	--	"[t1t2] show appreciation for a flower show, Row Say-Rose-Eh." [e]
0	--	"[t1t2] recount the emotional blackmail of true smirk-truce murk." [e]
0	--	"[t1t2] howl 'Oh, how low,' about some seedy mutual acquaintance." [^howl]
0	--	"[t1t2] appreciate the reverse-psychology advertising of the Messed and Meh Stand. Great bargains, quality and service!" [^messed]
0	--	"[t1t2] share a tale of oppression: 'Might rends my trends...'"
0	--	"[t1t2] share a lone odd low nod, then quickly tell you not to worry." [^lone]
0	--	"[t1t2] chase something imaginary, calling 'Go stew, ghost! Ooh!'"
0	--	"[t1t2] have a breakthrough with a coping method. 'Pow! Tease-pout ease!'"
0	--	"[t1t2], during downtime, engage in itch-at-it chat. (You'd know it if you heard it.)" [^itch]
0	--	"[t1t2] share harrowing tales of ghoul or goo lore." [e] [ectocomp eventually?]
0	--	"[t1t2] sing delightfully nonsensical will-toads-wilt odes." [e]
0	--	"[t1t2] rap out the hit [i]I So Ice, Oh[r]."
0	--	"[t1t2] argue over imagery in [i]Stark Old Star, Cold[r]."
0	--	"[t1t2] note sturdy baits stir debates." [e]

Why Pout Random Text ends here.

---- DOCUMENTATION ----
