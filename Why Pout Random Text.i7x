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

final-list-index is a number that varies.
modular-list-index is a number that varies.

chapter shortcuts

to say t1t2: say "[The talker1] and [the talker2]"

volume the actual tables

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

volume testing right now - not for release

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
