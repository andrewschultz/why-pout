"Why Pout" by Mick Stupp

volume includes

section general

include Trivial Niceties by Andrew Schultz.

include Punctuation Stripper by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

include Old School Verb Total Carnage by Andrew Schultz.

section semi-general

include Spoonerism and Oronym Core by Andrew Schultz.

section game-specific

include Why Pout Tables by Andrew Schultz.

include Why Pout Definitions by Andrew Schultz.

include Why Pout Globals by Andrew Schultz.

include Why Pout I6 Replacements by Andrew Schultz.

section not for release

include Why Pout Tests by Andrew Schultz.

chapter may be changed

to game-specific-cleanup: do nothing;

chapter move to global

when play begins:
	say "'You forget why your captors took you here, or how, or when. You just remember, every day, they regale you with 'Find a fine day.'[paragraph break]It's sort of hard to, when you're trapped like this. But this time -- you're trapped a little differently. Somewhere new. Maybe you can escape from your prison and your mental fog."

universal is a region.

to up-min: do nothing;

core-score is a number that varies.

to decide which region is mrlp: decide on map region of location of player.
cur-bonus is a number that varies.

a region has a number called curregscore.

volume you

Mike Orr is a privately-named person. the player is Mike Orr. description is "You are Mike Orr. You know that now. [if sco-my-corps is true]You're glad of your name now, after giving that pep talk[else]Kind of pedestrian, you always thought. But you hoped it might have some greater meaning[end if]."

understand "mike orr" and "mike/orr" as Mike Orr when sco-an-aim is true.

check examining Mike Orr when sco-an-aim is false:
	say "You think you have a name. You're not sure.[paragraph break]You'd really like to have a purpose, too.[paragraph break]The weird thing is, you feel the two must be inter-related in some simple way. A way that will feel dumb once you figure it out. But you haven't, yet.[paragraph break]Hmm. A name. A name." instead;

section temporary code to test remembering oneself

understand the command "wipe" as something new.

the block thinking rule is not listed in any rulebook.

check thinking:
	let got-think be false;
	say "You try and think of stuff you tried, but the time wasn't quite right.[paragraph break]";
	repeat through table of main oronyms:
		if think-cue entry is true:
			now got-think is true;
			if idid entry is true:
				say "Oops, forgot to reset [w1 entry] [w2 entry]. Trivial bug--but please let me know!";
			else:
				if there is a think-advice entry:
					say "[think-advice entry][line break]";
				else:
					say "[w1 entry] [w2 entry] is something you tried before it was perfectly ready. I should write in more details later.";
	if got-think is false:
		say "Nothing comes to mind."

volume verbs

check taking:
	say "You don't need to take anything in [this-game]. Everything you need will be taken implicitly." instead;

volume rooms

book Eh Raw Air Aww

Eh Raw Air Aww is a room in universal. printed name is "[if sco-an-aim is false]Eh, Raw Air, Aww[else]Tomb Apse[end if]". description is "[if sco-an-aim is false]The air chokes you a bit. It's too thick to see far beyond yourself. You barely know who you are, even. Ugh.[else]It's a bit clearer now. You still seem trapped. But there must be secrets hidden, and maybe one or more can get you out of here.[end if]"

book Hype Lane

Hype Lane is a room in universal. "You feel you must be pretty far underground. People chatter all around about the adventure you find here."

chapter prize talk

prize talk is a thing in hype lane. "Prize talk reverberates all about ... about treasure, fame, and so forth.". description is "The prize talk also discusses things that aren't so worth it, like -- well, plants and stuff. BORING."

chapter Naff Haze

NaffHaze is a privately-named room in universal. "[if sco-nah-phase is false]A naff haze surrounds you. It's naff because you can't go anywhere, and it also just makes you feel naff, and it seems so universal, like there's no escaping from it[else]Things have opened up a bit now, with the naff haze lifted[end if][if sco-pole-east is true]. You feel less policed, too, and you found a path east[end if][if sco-grow-star is true].[paragraph break]You got rid of the gross tar blocking your way north[end if].". printed name is "[if sco-nah-phase is false]Naff Haze[else]High Plain[end if]".

after printing the locale description for NaffHaze when sco-nah-phase is true and sco-pole-east is false:
	say "[run paragraph on]You feel policed here. Where and what is this feeling coming from?";
	continue the action;

the naff haze is scenery in NaffHaze. "You can't look very far though it. Just looking at it makes you feel hopeless you'll always be trapped in the fog."

check going a viable direction in NaffHaze when sco-pole-east is false:
	say "You'd like to, but you feel, well, policed." instead;

chapter short rail

the short rail is a thing. "A short rail leads -- well, not very far. You get the sense it should lead somewhere more.". description is "It's just ... not aligned right. Maybe if it were, it could lead somewhere, or make sense of this place, here.".

section shore trail

the shore trail is a thing. "The shore trail you discovered leads south.". description is "There are no secret passages hidden in it."

chapter gross tar

the gross tar is a thing. "Gross tar blocks the way north into darkness.". description is "Maybe there's a way through, but it's a bit too dark now. At least it's not foggy any more."

chapter keep iller

the keep iller is a thing. "A keep, iller, rises to the west[if sco-key-pillar is false], but you see no way in[else], and you figured how to enter it[end if]."

book Keep Iller

KeepIller is a room in Universal. printed name is "Keep (Iller)". "This keep has seen better days. You can go back east. You also sense something fearsome from a passage south."

check going south in KeepIller:
	if sco-knife-right is true, say "You don't need or want to go back there." instead;
	if number of friendly followers is 0:
		say "You try to go west, but with no support, you're just too scared." instead;
	else if number of friendly followers is 1:
		say "Even with [the random friendly follower]'s support, you are still terrified of what is west. You may need just a bit more." instead;
	else:
		say "You get over your fears with a little help from your friends.";

chapter no mold

there is a thing called no mold. It is in Keep Iller.

section gnome old

the gnome old is a follower. printed name is "gnome (old)".

chapter row gold

there is a thing called row gold. printed name is "row (gold)".

section rogue old

the rogue old is a follower. printed name is "rogue (old)".

chapter manic herb

the manic herb is a thing in KeepIller. "There's a bunch of manic herb here[if sco-manna-curb is true] the mensch elf sifted through[else]. You don't know a lot about it, other than that some is really poisonous and some is okay. There's so much, perhaps it's hiding something[end if]. "

section manna

some manna is a singular-named thing. description is "Apparently, manna is supposed to be tasty. It looks sort of dull. Maybe it can be made into something cool. You don't know what.". indefinite article of manna is "some".

chapter plant racker

the plant racker is a thing in KeepIller. "A plant racker lies here, pretty much useless.". description is "It seems papery, broken beyond repair.".

chapter plan tracker

the plan tracker is a thing. description is "[if sco-war-file is true]You have notes for combat written in here[else]The plan tracker is currently blank, but maybe you can find plans for it[end if]."

after printing the name of plan tracker when taking inventory: say " ([if sco-war-file is false]empty[else]full[end if] of ideas)"

book Nigh Fright

Nigh Fright is a room in Universal. it is south of KeepIller. "The only way back is east. You're lucky you have friends here to support you, or you'd be running away like crazy. You sense you'd better get what you want here, then get out."

chapter knife right

the knife right is a thing. printed name is "knife (right)".

book Wolf Rock

Wolf Rock is a room in universal. "A big rock in the shape of a wolf looms impressively, blocking all passages except back south. [if sco-hide-out is true]You can also go [b]DOWN[r] into the hideout you found[else]You feel high doubt here you can go anywhere else[end if].[paragraph break]There's a huge pile of lode ore here, too, [if sco-low-door is true]and you found a low door in it that leads [b]INSIDE[r][else]and perhaps there's something in it[end if].".

chapter wool frock

the wool frock is a thing. description is "It's a bit too small for you."

chapter lode ore

the lode ore is scenery in Wolf Rock. "[if sco-low-door is true]You doubt there is anything more to find[else]Maybe it is hiding something[end if]."

section low door

the low door is scenery. "You can just barely fit through it, now the tall mice helped you to find and clear it."

book Hideout

Hideout is a room in universal. "You can only go back [b]UP[r]. It wouldn't be a very good hideout if you had too many places to sneak around."

chapter Booze Troll

the booze troll is a follower in Hideout. "A booze troll sulks sullenly here."

chapter base ale

the Base Ale is a thing. description is "Uck. It's a nasty color, really. But perhaps it will be useful."

book We Loan

We Loan is a room in universal. printed name is "[if sco-well-own is false]We Loan[else if sco-whee-lone is false]We'll Own[else if sco-oh-flyer is false]Whee, Lone?[else]Whee! [']Lone![end if]". "[if sco-oh-flyer is false]This area feels replete with the sort of double-talk all salesmen use. It will be tough to hang with all the way through, but if you do, maybe you'll get something out of it. [else]You've managed to navigte negotiations and wind up with ... a shiny new flyer! [end if]You can only go back [b]OUT[r] here."

chapter some merchant

some merchant is a singular-named thing. "Some merchant babbles on, all up in your personal space, suggesting you buy low.". description is "Their smile certainly is fake. They're not going to shut up until you get a resolution here."

check going outside in we loan when merchant is in we loan: say "Alas, the merchant's magnetism is too strong." instead;

chapter oaf liar

the oaf liar is a singular-named thing.

section flier

the flier is a thing. description is "The flier advertises places to go: a wharf isle, a thief isle, and a grove isle, each of which may hold odd treasures. It contains pretty clear directions, too. The only thing it lacks is where the directions start from.". understand "flyer" as flier.

report examining the flier:
	if flier-isle-score is 0:
		say "You haven't found a way to get to any of the islands yet.";
	else if flier-isle-score is 1:
		say "So far you've only found [if sco-grow-vial is true]Grove[else if sco-war-file is true]Wharf[else]Thief[end if] Isle.";
	else if flier-isle-score is 2:
		say "You still need to find [if sco-grow-vial is false]Grove[else if sco-war-file is false]Wharf[else]Thief[end if] Isle.";
	continue the action;

book Lobe End

Lobe End is a room in universal. "[if sco-low-bend is false]This lobe of land appears to end in all directions. Maybe you could look for something that might be a hill, even a steep one.[else]The low bend (former lobe end) now bends south.[end if]"

chapter We Craft Weak Raft

the We Craft Weak Raft is a thing. printed name is "We-Craft Weak Raft". description is "Well, it isn't fancy, but [if storm isle is unvisited]it looks sturdy enough[else]it got you across the water with no problem[end if]."

check going:
	if ((room gone from is lobe end) and (room gone to is storm isle)) or ((room gone to is lobe end) and (room gone from is storm isle)):
		say "You[if number of friendly followers is 1] and [the random friendly follower][else if number of friendly followers > 1] and your [number of friendly followers in words] companions[else][end if] make it across the water without incident.";
		move raft to room gone to;
		follow-you;

book Storm Isle

Storm Isle is a room in universal. "[if sco-store-mile is true]Well, you're in a sort of shopping mall now. You can see a passage leading north[else]On this storm isle, it's always rainy. It'd be nice to have some shelter inside[end if]."

chapter my stall

My Stall is a thing. "A stall labeled MY STALL sits here, abandoned, against a wall. You think you hear odd noises from behind it.". description is "As you get closer to My Stall, the odd noises grow a bit louder. You see nothing particularly special, though."

section mice tall

the mice tall are a plural-named followers. printed name is "mice (tall)". description is "Well, they're tall for mice. But they make up enough numbers to be pretty effective in a skirmish, if need be.".

chapter men shelf

the MEN shelf is a thing. "A MEN shelf sits here, barren. Which may be a good thing--there's no appalling stuff to buy. Or a bad thing--everything is in high demand."

section mensch elf

the mensch elf is a follower. description is "Smiling and ready to help."

book Trees Mall

Trees Mall is a room in universal. "This is a withered, run-down former mall that had the ceiling blow off. It's walled with pictures of large, but fake, trees. You can only go back [b]SOUTH[r]."

to grow-the-tree:
	if player has grow vial and tree small is in Trees Mall:
		say "[line break]But wait! You can use the grow vial! It makes the tree (small) into a tree (tall)! Then it dissolves once empty.";
		moot tree small;
		move tree tall to Trees Mall;

after printing the locale description for Trees Mall:
	grow-the-tree;
	continue the action;

chapter tree small

the tree small is a thing. "A tree (small) grows here, or tries to, at least. It deserves to be bigger.". description is "It's a nice tree, but it's a bit small."

chapter tree small

the tree tall is a thing. "A tree (tall) has grown here, thanks to you. It feels very welcoming.". description is "It's a nice tree, but it's a bit small."

book no notion

NoNotion is a room in universal. "[if sco-known-ocean is false]You simply have no notion what lies beyond here[else]It looks like there is an ocean, or some large body of water, and maybe some islands in the distance. They are too far to swim to[end if]. You can go back north to where you started.". printed name of nonotion is "[if sco-known-ocean is false]No Notion[else]Known Ocean[end if]".

chapter sick squid

the sick squid is a thing. "A [if sco-six-quid is true]formerly (thanks to you) [end if]sick squid trundles about in the water here.". description is "[if sco-six-quid is false]It seems like it's half choking on something, not enough to strangle it, but enough to make it really uncomfortable[else]It looks back at you. Squids don't smile, but if it could, it would[end if]."

chapter grow vial

the grow vial is a thing. description is "It says it will help something grow, but it's potentially toxic to mammals."

volume endgame

book Worm Eaten

Worm Eaten is a room in universal. printed name is "[if sco-were-meetin is false]Worm-Eaten[else]We're Meetin[']![end if]". "[if sco-were-meetin is false]This place seems very run-down. But it feels homey and inspires camaraderie in an odd way[else]Having had your meeting here, there's not much else to do[end if]."

after printing the locale description of Worm Eaten when sco-were-meetin is true and sco-my-corps is false:
	say "You feel like your companions are just about ready to go. But you still need to say something, something that can only come uniquely inside of you, to establish what a great team you are.";
	continue the action;

chapter gone trader

The gone traitor is a thing in Worm Eaten. "[one of]Someone comes out from the depths. They introduce themselves as the gone traitor, someone who cozied up to the bad guys and ditched their friends, then ditched the bad guys. And only recently they ran away, but how can they ask for forgiveness? Surely it just doesn't happen like this? Just one small change and you have a new identity? Rubbish![or]The gone traitor continues to mope about here, looking for someone who can help convince them they're not so awful.[stopping]"

section gaunt raider

the gaunt raider is a follower. description is "They still look disturbed by who they were."

book Doom End

Doom End is a room in universal. "Doom doom doom!"

chapter Sea Skull

The Sea Skull is a thing in Doom End. "A sea skull [if sco-cease-cull is true] spews rivers of blood at you and your companions, but fortunately, you have so many companions, it's only a trickle. Still, you should do something about it[else]gloats evilly, with its back turned to you[end if]."

volume unsorted

volume verbs

book inventory

report taking inventory when sco-six-quid is true and current-quid > 0:
	say "You [if current-quid < 6]still [end if]have [current-quid in words] quid left from helping the sick squid.";
	continue the action;

book t talking

ting is an action applying to one thing.

understand the command "t" as something new.

understand "t" as ting.
understand "t [thing]" as ting.

rule for supplying a missing noun when ting:
	if number of followers in location of player is 1:
		now noun is random follower in location of player;
		continue the action;
	if number of friendly followers in location of player is 1:
		now noun is random follower in location of player;
		continue the action;
	if number of followers in location of player > 1:
		say "That's ambiguous--more than one you can chat with.";
	else:
		say "Nobody here to talk to.";
	the rule fails;

check ting:
	if noun is skull, say "It's the big fight. You need action, not talk." instead;
	if noun is the player:
		if sco-an-aim is false:
			say "You feel too grumpy for positive self-talk. You mumble 'I molder. I'm older.'" instead;
		say "You motivate yourself with 'Goal: earn? Go learn!'" instead;
	if noun is not a follower, say "You don't get a response." instead;
	if player has talk ache, say "That talk ache is a bit of a nuisance." instead;
	if number of unchatted followers is 0, say "You've talked to everyone, but why not chat again?";

carry out ting:
	say "You chat with [the noun] a bit, learning more about the game's history and why you're here.";
	the rule succeeds;

report ting:
	if noun is unchatted:
		say "More useful information worth remembering.";
		now noun is chatted;
		if number of unchatted followers is 0:
			say "That was a lot of talking. After all that time alone, you're not used to it. You develop a talk-ache.";
			now player has talk ache;
	continue the action;

chapter talk ache

the talk ache is a thing. description is "Not really annoying, but the sort of small nuisance that makes you feel a need to do something."

section tall cake

the tall cake is a thing. description is "Wonderful. Can probably serve six or so. But you need to find the right place."

book taking

check taking:
	if player does not have noun, say "Everything you need will be implicitly taken in [this-game]." instead;

book waiting

check waiting:
	say "Ideally I-D-L-E!" instead;

volume parser errors

rule for printing a parser error when the latest parser error is the I beg your pardon error:
	say "'Hum, blank,' you muse. No humble ankh pops into your hands, sadly.";

volume meta rooms

Reap Rest is a room. moot-room is Reap Rest.

volume appearance

for printing a locale paragraph about a follower (called fo):
	if fo is not friendly, continue the action;
	if fo is mentioned, continue the action;
	say "You see [the list of friendly followers in location of player] tagging along.";
	now all friendly followers are mentioned;

volume scores

check requesting the score:
	say "You have scored [core-score] of [core-max] necessary points";
	if cur-bonus > 0:
		say " and [cur-bonus] bonus point[if cur-bonus is not 1]s[end if]";
	say ".";
	the rule succeeds;

volume score stuff

when play begins (this is the score and status tweak rule):
	now the right hand status line is "[current-score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed or max-bonus is 0][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	now the turn count is 1;

to decide which number is doable-hinted:
	decide on 0;
