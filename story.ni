"Why Pout" by Mick Stupp

volume top level stuff

the release number is 1.

release along with a website.

release along with cover art.

release along with the "Parchment" interpreter.

the story description is "Ow! Trot out rot?!".

the story headline is "My IFComp 2024 entry. Wordplay.".

book includes

section general

include Trivial Niceties by Andrew Schultz.

include Punctuation Stripper by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

include Old School Verb Total Carnage by Andrew Schultz.

include Versioning and Extensions Tweak by Andrew Schultz.

section beta testing - not for release

include Why Pout Beta Testing by Andrew Schultz.

section semi-general

include Spoonerism and Oronym Core by Andrew Schultz.

section game-specific

include Why Pout Tables by Andrew Schultz.

include Why Pout Definitions by Andrew Schultz.

include Why Pout Globals by Andrew Schultz.

include Why Pout Mistakes by Andrew Schultz.

include Why Pout I6 Replacements by Andrew Schultz.

section not for release

include Why Pout Tests by Andrew Schultz.

chapter may be changed

to game-specific-cleanup: do nothing;

chapter move to global

when play begins:
	say "You forget why your captors took you here, or how, or when. You just remember, every day, they regale you with 'Find a fine day.'[paragraph break]It's sort of hard to, when you're trapped like this. But this time -- you're trapped a little differently. Somewhere new. You overheard something about how they were bored watching over you, and it was your fault for not being very interesting. Maybe you can escape from your prison and your mental fog.";
	now left hand status line is "[location of player][if sco-an-aim is false and gs-examined-self is true] (needing a name)[end if]";

after printing the locale description of air aww when air aww is unvisited:
	say "[i][bracket][b]NOTE[r][i]: to see general information about [this-game][i], type [b]ABOUT[r][i]. To see the verbs used, type [b]VERBS[r][i]. If you have trouble with the first few moves, there will be hints.[close bracket][r][line break]";
	continue the action;

universal is a region.

to decide which region is mrlp: decide on map region of location of player.
cur-bonus is a number that varies.

a region has a number called curregscore.

volume you

Mike Orr is a privately-named person. the player is Mike Orr. description is "You are Mike Orr. You know that now. [if sco-my-corps is true]You're glad of your name now, after giving that pep talk[else]Kind of pedestrian, you always thought. But you hoped it might have some greater meaning[end if]."

understand "mike orr" and "mike/orr" as Mike Orr when sco-an-aim is true.

check examining Mike Orr when sco-an-aim is false:
	now gs-examined-self is true;
	say "You think you have a name. Most people do, if you remember things correctly. For better or worse, you can't be special.[paragraph break]You'd really like to have a purpose, too.[paragraph break]The weird thing is, you feel the two must be inter-related in some simple way. A way that will feel dumb once you figure it out. But you haven't, yet.[paragraph break]Hmm. A name. A name. You're focused on finding [b]A NAME[r], and yet, if you just shook up this focus a bit, you might get something else... something that could kick-start you, no matter what your name is." instead;

section temporary code to test remembering oneself

the can't search unless container or supporter rule is not listed in any rulebook.

check searching:
	if gs-search-warn is false:
		say "(One-time note: searching is functionally equivalent to examining in [this-game]. So [b]X THING[r] may be quicker in the future.)[paragraph break]";
	now gs-search-warn is true;
	try examining noun instead;

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
					say "[first-of-ors of w1 entry] [first-of-ors of w2 entry] is something you tried before it was perfectly ready. I should write in more details later.";
	if got-think is false:
		say "Nothing comes to mind."

volume verbs

the block saying no rule is not listed in any rulebook.
the block saying yes rule is not listed in any rulebook.

carry out saying yes: say "Black? White? Blah! Quite!" instead;

carry out saying no: try saying yes instead;

the block attacking rule is not listed in any rulebook.

the block singing rule is not listed in any rulebook.

check singing: say "Funny, you feel a taste of icing." instead;

check attacking:
	say "'Gore? I'd go ride,' you think, randomly. You aren't built for that[if pals-made > 0], but maybe you can lead companions to a big victory[end if]." instead;

the block swearing obscenely rule is not listed in any rulebook.
the block swearing mildly rule is not listed in any rulebook.

check swearing obscenely:
	if player is in Brew Swears, say "Yes. You're in the right place for that." instead;
	if Brew Swears is visited, say "You had enough of that." instead;
	say "There's an area for that[if bruise wares is moot], but you can't go back to visit it now.[else if bruise wares is off-stage], but it hasn't appeared yet.[else if player is in naff haze]. Why, you can just walk in once you know what to call it![else]. Look around.[end if]" instead;

check swearing mildly: try swearing obscenely instead;

book other regular verbs to zap

understand the command "pull" as something new.
understand the command "push" as something new.
understand the command "show" as something new.

book taking and dropping

Rule for deciding whether all includes something: it does not.

rule for printing a parser error when the latest parser error is the nothing to do error:
	if action-to-be is the ting action:
		say "You can't talk to more than one companion at once. To get an overview of whom you haven't talked to yet, try [b]T[r].";
	else:
		say "It looks like you tried to act on multiple things. You don't need to act on more than one thing at a time in [this-game].";

drop2ing is an action applying to one thing.

understand the command "drop" as something new.
understand "drop [thing]" as drop2ing.
understand "drop" as drop2ing.

check drop2ing:
	if noun is war pawn:
		moot war pawn;
		say "It blows away violently. It must've been in Zugzwang or something." instead;
	say "You don't need to [b]DROP[r] anything in [this-game]. Most of what gets in your inventory will disappear when used successfully[if player has war pawn]. However, you may [b]DROP[r] the war pawn to remove the temptation to skip a puzzle[end if]." instead;

rule for supplying a missing noun when drop2ing:
	now noun is the player;

rule for supplying a missing noun when taking:
	now noun is the player;

the can't drop yourself rule is not listed in any rulebook.
[the very unlikely to mean dropping what's already carried rule is not listed in any rulebook.]
the very unlikely to mean taking what's already carried rule is not listed in any rulebook.

volume rooms

book Eh Raw Air Aww

Eh Raw Air Aww is a room in universal. printed name is "[if sco-an-aim is false]Eh, Raw Air, Aww[else]Tomb Apse[end if]". description is "[if sco-an-aim is false]The air chokes you a bit. It's too thick to see far beyond yourself. You barely know who you are, even. Ugh. You can't see much beyond yourself, really, so that'd be somewhere to start.[else]It's a bit clearer now. You still seem trapped. But there must be secrets hidden, and maybe one or more can get you out of here.[end if]"

book Hype Lane

Hype Lane is a room in universal. "It's still pretty dark here. You must still be underground.[paragraph break]Around you, [if sco-self-owns is false]cell phones, cell phones everywhere. Such confident chatter. Or it seems confident. It distracts you and your bearings, trying to figure who you really are and get somewhere less dark[else]a prize talk booms from unseen speakers, exhorting you to do, or at least earn, more. The heck with being above ground, with boring old nature that distracts you from being all you can be. Well, for the economy, at least[end if]."

chapter cell phones

the cell phones are a plural-named thing in hype lane. understand "phone" and "cell phone" as cell phones. "You don't remember everything about your former self, but you remember you hated cell phones and how they distracted you. Maybe if the people yacking into them were taken down a peg, you could focus a bit more. Dang cell phones.". description is "Whether or not the cell phones are the latest models, you don't want to pay attention to them too much. Just figure out a way for a harmless calamity that may make their users quiet down a bit."

chapter prize talk

prize talk is a thing. "You'd like to DO something about the prize talk. Or seek out something that would give you passage away from it.". description is "The prize talk also discusses things that aren't so worth it, like -- well, plants and stuff. BORING."

book Naff Haze

NaffHaze is a privately-named room in universal. "[if sco-nah-phase is false]You're surrounded by some really naff haze. It's naff because you can't go anywhere, and it also just makes you feel naff, and it seems so universal, like there's no escaping from it[else]Things have opened up a bit now, with the naff haze lifted[end if][if sco-pole-east is true]. You feel less policed, too, and you found a path [b]EAST[r][end if][if sco-grow-star is true].[paragraph break]You got rid of the gross tar blocking your way [b]NORTH[r][end if].". printed name is "[if sco-nah-phase is false]Naff Haze[else]High Plain[end if]".

after printing the locale description for NaffHaze when sco-nah-phase is true and sco-pole-east is false:
	say "You feel policed here. And it's the mean American gung-ho militarized sort of policed, not the (usually) kinder UK brand. Where and what is this policed feeling coming from?";
	continue the action;

after printing the locale description for NaffHaze when Bruise Wares is off-stage and current-score >= 20 (this is the show-bruise-wares rule):
	say "An ominous new construction appears here. It's called BRUISE WARES. Perhaps you should ignore it. Often one doesn't want to engage that sort of thing. But you may feel that much more accomplished doing so.";
	move Bruise Wares to NaffHaze;
	continue the action;

after going to NaffHaze when Bruise Wares is in NaffHaze and sco-treat-all is true:
	say "Odd! BRUISE-WARES has vanished. Well, one less dead end to worry about.";
	zap-bruise-wares;
	remove-swear-bonus;
	continue the action;

the naff haze is scenery in NaffHaze. "You can't look very far though it. Just looking at it makes you feel hopeless you'll always be trapped in the fog."

check going a viable direction in NaffHaze when sco-pole-east is false:
	say "You'd like to go [noun], but you feel, well, policed." instead;

check going inside in NaffHaze:
	if sco-nah-phase is false, continue the action;
	if BRUISE WARES is moot and Brew Swears is visited:
		say "(BRUISE WARES is no longer available, so I assume you mean the keep.)[paragraph break]";
		try going west instead;
	if BRUISE WARES is off-stage:
		try entering keep iller instead;
		try going west instead;
	if room gone to is Brew Swears:
		say "Your companions stay behind. They recognize this is a spiritual fight for you and you alone.";
		now block-followers is true;

chapter war pawn

the war pawn is a thing. description is "Looking at it from many different angles gets you all sorts of weird ideas. Perhaps it could help you when you run out of them on your quest. You may wish to wait until you really need to use it, though of course, you don't want to wait too late.".

after examining war pawn for the first time:
	say "If you want to resist the temptation of this cheat item, [b]DROP[r] it. There is no penalty for using it.";
	continue the action;

chapter short rail

the short rail is a thing. "A short rail leads -- well, not very far. You get the sense it should lead somewhere more.". description is "It's just ... not aligned right. Maybe if it were, it could lead somewhere, or make sense of this place, here.".

section shore trail

the shore trail is a thing. "The shore trail you discovered leads [b]SOUTH[r].". description is "There are no secret passages hidden in it."

chapter gross tar

the gross tar is a thing. "Gross tar blocks the way [b]NORTH[r] into darkness.". description is "Maybe there's a way through, but it's a bit too dark now. At least it's not foggy any more."

chapter keep iller

the keep iller is a thing. "A keep, iller, rises to the [b]WEST[r][if sco-key-pillar is false], but you see no way in[else], and you figured how to enter it[end if].". description is "It [if keepiller is visited]wasn't[else]doesn't look[end if] dangerous, but then, it's not exactly a tourist attraction. Still, [if keep-score < 6]there's plenty to do there[else]it helped you a lot[end if]."

check entering keep iller:
	if sco-key-pillar is false, say "You will enter the keep to the west, once you find a way. But you haven't, yet." instead;
	say "Going [b]WEST[r] inside the keep...[paragraph break]";
	try going west instead;

chapter waydown

the waydown is a privately-named thing. description is "You shouldn't see this description, since waydown is privately-named.". "There's also a way [b]DOWN[r] that opened up once you found passages in all cardinal directions.".

chapter Bruise Wares

Bruise Wares is a thing. "BRUISE WARES, some sort of odd disturbing shop, has popped up here. You can probably figure why it's forbidding and such. But perhaps it is only for a certain sort of adventurer.". description is "Looking at BRUISE WARES, it sort of overdoes the whole 'you might not be ready for this' schtick. And, you figure, if you know what's really there, it's not something you will put up with unless you have to.[paragraph break]Seriously, dealing with it is up to you."

rule for choosing notable locale objects (this is the put followers at the bottom rule):
	repeat with item running through things in location of player:
		if item is a follower, set the locale priority of the item to 10;
		if item is Bruise Wares, set the locale priority of the item to 8;
		if item is waydown, set the locale priority of the item to 9;

check entering Bruise Wares:
	if sco-brew-swears is false, say "You probably shouldn't go in there until you divine its true meaning." instead;
	try going inside instead;

book Keep Iller

KeepIller is a room in Universal. printed name is "Keep (Iller)". "This keep has seen better days, but there seems to be a lot in its ruins. You can go back [b]EAST[r]. You also sense something fearsome from a passage south."

check going south in KeepIller:
	if sco-knife-right is true, say "You don't need or want to go back there." instead;
	if pals-made is 0:
		say "You try to go west, but with no support, you're just too scared." instead;
	else if pals-made is 1:
		say "Even with [the random friendly follower]'s support, you are still terrified of what is south. You may need just a bit more." instead;
	else:
		say "You get over your fears with a little help from your friends.";

chapter no mold

there is a thing called no mold. It is in KeepIller. "You are really impressed by how no mold grows here. Someone must be keeping it up well. Who?". description is "You can't see the absence of mold, but you appreciate it nonetheless. Someone must be, ahem, keeping the keep up well. Who?".

section gnome old

the gnome old is a follower. printed name is "gnome (old)". help-chat is "The gnome (old) discusses ways of finding hidden psychic weaknesses in a very tough opponent. You also hear how whatever force there is, it only cares about things looking good on the outside. The gnome had so much mold to protect against and continually scrape away, even outside of the keep.". description is "Still full of vigor, like they don't deserve to be schlepped out in a garden--though keeping mold away as they did is certainly good-gardening-adjacent!"

chapter row gold

there is a thing called row gold. It is in KeepIller. printed name is "row (gold)". "A row (gold) shines in this otherwise forbidding keep.". description is "You're surprised someone hasn't taken it yet. Perhaps it has an unseen guardian."

section rogue old

the rogue old is a follower. printed name is "rogue (old)". help-chat is "The rogue (old) discusses ways to sneak around so vastly overpowered opponents can't blow you away, and you also learn not to feel guilty or shifty about being good at sneaking around, around much more unsavory entities than yourself.". description is "Moves a bit slowly, but also very quietly."

chapter manic herb

the manic herb is a thing in KeepIller. "There's a bunch of manic herb here[if sco-manna-curb is true] the mensch elf sifted through[else]. You don't know a lot about it, other than that some is really poisonous and some is okay. There's so much, perhaps it's hiding something[end if]. ". description is "You're unable to see through it, to determine what's safe[if sco-manna-curb is true], but you don't need to[else], and it'll probably require someone else's knowledge, from times way past, maybe even Biblical, once you know what to look for[end if]."

section manna

some manna is a singular-named thing. description is "Apparently, manna is supposed to be tasty. It looks sort of dull. Maybe it can be made into something cool. You don't know what.". indefinite article of manna is "some".

chapter plant racker

the plant racker is a thing in KeepIller. "A plant racker lies here, pretty much useless.". description is "It seems papery, broken beyond repair, at least in its current state.".

chapter plan tracker

the plan tracker is a thing. description is "[if sco-war-file is true]You have notes for combat written in here[else]The plan tracker is currently blank, but maybe you can find plans for it[end if]."

after printing the name of plan tracker when taking inventory: say " ([if sco-war-file is false]empty[else]full[end if] of ideas)"

chapter seedy sign

the seedy sign is a thing in KeepIller. "[if sco-see-design is false]A seedy sign stands here, advertising somewhere very risky indeed[else]That seedy sign stands off to the side here. It's no longer scary, but you don't wish to bother with it, any more[end if].". description is "[if sco-see-design is false]There are clues in here to figure what it hides, if you look the right way. You might be scared to[else]The design is clearer now--not that you want to go back[end if]."

book Nigh Fright

Nigh Fright is a room in Universal. "Whatever you need to do or find here, you only want to do it once. You don't want to have to come back. You're glad your friends supported you enough to get here, but you don't want to have to rely on them like that again.[paragraph break]So, what do you need to find, before getting out?"

chapter knife right

the knife right is a thing. printed name is "knife (right)". description is "Well, it's sharp. And it's probably, like, sacred and stuff, since you got it in a rite."

book Wolf Rock

Wolf Rock is a room in universal. "A big rock in the shape of a wolf looms impressively, blocking all passages except back [b]SOUTH[r]. [if sco-hide-out is true]You can also go [b]DOWN[r] into the hideout you found[else]You feel high doubt here you can go anywhere else[end if].[paragraph break]There's a huge pile of lode ore here, too, [if sco-low-door is true]and you found a low door in it that leads [b]INSIDE[r][else]and perhaps there's something in it[end if].".

chapter wool frock

the wool frock is a thing. description is "It's a bit too small for you."

chapter lode ore

the pile of lode ore is scenery in Wolf Rock. "[if sco-low-door is true]You doubt there is anything more to find[else]Maybe it is hiding something. If it were a pile of anything else, it might not be so interesting[end if]."

section low door

the low door is scenery. "You can just barely fit through it, now the tall mice helped you to find and clear it."

book Hideout

Hideout is a room in universal. "You can only go back [b]UP[r]. It wouldn't be a very good hideout if you had too many places to sneak around."

chapter Booze Troll

the booze troll is a thing in Hideout. "A booze troll sulks sullenly here.". description is "For all the troll's sulkiness, it doesn't appear evil. Perhaps it's reacted badly to ... well, the same people who stuffed you beneath the tomb apse.".

the new troll is a follower. "A new troll looks around with purpose.". help-chat is "The new troll relates ways to shake oneself free from despair (no! Really! It managed to for a while!) before relating more ways to avoid it in the first place, or help others you care about do the same.". description is "Won't win any beauty contests, but the troll seems to look eagerly towards you for what to do next."

chapter base ale

the Base Ale is a thing. description is "Uck. It's a nasty color, really. But perhaps it will be useful.".  indefinite article of Base Ale is "some".

book We Loan

We Loan is a room in universal. printed name is "[if sco-well-own is false]We Loan[else if sco-whee-lone is false]We'll Own[else if sco-oh-flier is false]Whee, Lone?[else]Whee! [']Lone![end if]". "[loan-starter]You can only go back [b]OUT[r] here[if sco-well-own is false].[paragraph break]You don't really trust the whole 'financial services' vibe here. Maybe there's a double meaning to deduce[end if]."

to say loan-starter:
	if sco-bile-oh is false:
		say "This area feels replete with the sort of double-talk all salesmen use. You can almost hear all the dropped and excess apostrophes. It will be tough to hang with all the way through, but if you do, maybe you'll get something out of it.[line break]";
	 else if sco-whee-lone is false:
		say "It's nice and silent here, and maybe there's a specific way to enjoy that.[line break]";
	else if sco-oh-flier is true:
		say "You've managed to navigate negotiations and wind up with ... a shiny new flier! What more could you ask for?[line break]"

chapter some merchant

some merchant is a singular-named thing. "Some merchant babbles on, all up in your personal space, suggesting you buy low.". description is "Their smile certainly is fake. They're not going to shut up until you get a resolution here."

check going outside in we loan when merchant is in we loan: say "Alas, the merchant's magnetism is too strong." instead;

chapter oaf liar

the oaf liar is a singular-named thing. "An oaf liar blathers away here, with stuff that's likely, but not provably false. They seem quite proud of their salesmanship skill, which is more persistence than anything else.". description is "Smarmy and well-dressed.".

section flier

the flier is a thing. description is "The flier advertises places to go: a wharf isle, a thief isle, and a grove isle, each of which may hold odd treasures. It contains pretty clear directions, too. The only thing it lacks is where the directions start from[if flier-isle-score > 0]. You now know to start [here-in of NoNotion][end if].". understand "flyer" as flier.

report examining the flier:
	if flier-isle-score is 0:
		say "You haven't found a way to get to any of the islands yet.";
	else if flier-isle-score is 1:
		say "So far you've only found [if sco-grow-vial is true]Grove[else if sco-war-file is true]Wharf[else]Thief[end if] Isle.";
	else if flier-isle-score is 2:
		say "You still need to find [if sco-grow-vial is false]Grove[else if sco-war-file is false]Wharf[else]Thief[end if] Isle.";
	continue the action;

book Lobe End

Lobe End is a room in universal. "[if sco-low-bend is false]This lobe of land appears to end in all directions except back west. Maybe you could look for something that might be a hill, even a steep one.[else]The low bend (former lobe end) now bends from west to north, where you see water, too much to cross on foot[raft-clue].[end if]". printed name is "[if sco-low-bend is true]Low Bend[else]Lobe End[end if]".

to say raft-clue:
	if sco-bay-sale is false, say ". Well, nobody's probably going to give you transport north for free. Maybe you can summon or find someone who will"

check going north in lobe end when sco-low-bend is true and sco-bay-sale is false: say "You have no way across the water, yet." instead;

the water north is scenery. "[if sco-bay-sale is true]Easy to cross with the raft[else]You need a vessel to cross the water. The other side is too far away[end if]."

chapter We Craft Weak Raft

the We Craft Weak Raft is a thing. printed name is "We-Craft Weak Raft". description is "Well, it isn't fancy, but [if storm isle is unvisited]it looks sturdy enough[else]it got you across the water with no problem[end if].". "The We-Craft Weak Raft from the bay sale floats here, ready to take you [if player is in storm isle]south[else]north[end if] across the water and back, as many times as needed."

check going:
	if ((room gone from is lobe end) and (room gone to is storm isle)) or ((room gone to is lobe end) and (room gone from is storm isle)):
		say "You[if pals-made is 1] and [the random friendly follower][else if pals-made > 1] and your [pals-made in words] companions[else][end if] make it across the water without incident.";
		move raft to room gone to;
		follow-you;

book Storm Isle

Storm Isle is a room in universal. "[if sco-store-mile is true]Well, you're in a sort of shopping mall now. You can see a passage leading north[else]On this storm isle, it's always rainy. It'd be nice to have some shelter inside[end if].". printed name is "[if sco-store-mile is true]Store Mile[else]Storm Isle[end if]".

chapter my stall

My Stall is a thing. "A stall labeled MY STALL sits here, abandoned, against a wall. You think you hear odd noises from behind it.". description is "As you get closer to My Stall, the odd noises grow a bit louder. You see nothing particularly special, though."

section mice tall

the mice tall are a plural-named followers. printed name is "mice (tall)". description is "Well, they're tall for mice. But they make up enough numbers to be pretty effective in a skirmish, if need be.". help-chat is "[one of]You're surprised how easy it is to understand them and how easily they understand you. [or][stopping]They discuss how much bigger opponents can be brought down by, not just arrogance facing many small opponents, but by dexterity and quick maneuvers. Oh, also a lot about the evil in the land killing or corrupting or mutating animals. So presumably finding or destroying it will put a stop to the very worst bits."

chapter men shelf

the MEN shelf is a thing. "A MEN shelf sits here, barren. Which may be a good thing--there's no appalling stuff to buy. Or a bad thing--everything it displayed was in such high demand.". description is "Empty. Well, it's a system of shelves, really. Perhaps there is something or someone under or behind. Someone too decent to buy anything from such a bold MEN shelf."

section mensch elf

the mensch elf is a follower. description is "Smiling and ready to help.". help-chat is "The mensch elf discusses ways to identify people or situations that just need a bit of help, and how to do so without making them feel hopeless or in need of help, or that they got themselves in this position in the first place."

book Trees Mall

Trees Mall is a room in universal. "This is a withered, run-down former mall that had the ceiling blow off. It's walled with pictures of large, but fake, trees. You can only go back [b]SOUTH[r]."

to grow-the-tree:
	if player has grow vial and tree small is in Trees Mall:
		say "But wait! You can use the grow vial! It makes the tree (small) into a tree (tall)! Then it dissolves once empty.";
		moot tree small;
		moot grow vial;
		move tree tall to Trees Mall;

after printing the locale description for Trees Mall:
	grow-the-tree;
	continue the action;

chapter tree small

the tree small is a thing. "A tree (small) grows here, or tries to, at least. It deserves to be bigger.". description is "It's a nice tree, but it's a bit small."

chapter tree small

the tree tall is a thing. "A tree (tall) has grown here, thanks to you. It feels very welcoming.". description is "It's a nice tree, but it's a bit small."

book no notion

NoNotion is a room in universal. "[if sco-known-ocean is false]You simply have no notion what lies beyond here. Surely the shore trail didn't just lead to a dead end! [else]It looks like there is an ocean, or some large body of water, and maybe some islands in the distance. They are too far to swim to. [end if]You can go back north to where you started.". printed name of nonotion is "[if sco-known-ocean is false]No Notion[else]Known Ocean[end if]".

chapter sick squid

the sick squid is a thing. "A [if sco-six-quid is true]formerly (thanks to you) [end if]sick squid trundles about in the water here.". description is "[if sco-six-quid is false]It seems like it's half choking on something, not enough to strangle it, but enough to make it really uncomfortable[else]It looks back at you. Squids don't smile, but if it could, it would. Perhaps, if you know of an island nearby in the ocean, it will take you there[end if]."

check entering squid: say "It might not have the energy for joyriding. You need to show it where to go, maybe with [if player has flier]that flier of yours[else]a map or something[end if]." instead;

chapter grow vial

the grow vial is a thing. description is "It says it will help something grow, but it's potentially toxic to mammals."

chapter ocean

the ocean is scenery. "Well, you'll need help to cross it."

check entering ocean: try going west instead;

book wand wharf

Wand Wharf is a room in universal. "You rode the squid here, and there are all sorts of magical symbols here. It's a bit intimidating for someone like you who is clueless about magic. Maybe it's intimidating and depressing for someone else."

the wan dwarf is a follower. description is "Short and stocky. It wears glasses from what other dwarves would say was reading too much.". help-chat is "The dwarf provides an impressively nuanced view on how to balance magic skill with physical skill and fighting savvy. But the dwarf also notes how to be a good expert in specific areas if need be, as well as how to get experts and generalists to work together. However, the dwarf also expresses worry that this talk is all great in theory but hard in practice."

book Brew Swears (optional)

Brew Swears is a room in universal. "If you thought Hype Lane was bad, this is even worse.".

check going outside in Brew Swears:
	now block-followers is false;
	if orc is friendly, say "As you lead [the orc] out, BRUISE-WARES crumbles behind you.";
	zap-bruise-wares;
	remove-swear-bonus;

to zap-bruise-wares:
	moot BRUISE WARES;
	now nowhere is mapped inside NaffHaze;

chapter earls

the grinch earls are a plural-named thing in Brew Swears. "Some [earls] parade around here, bragging about how they ruin boring people's fun with their dynamic ways and pointing out that it's easy to be nice if you're boring. They fix you with a 'We parse: weep, arse' gaze[if sco-grin-churls is false], though they're less effective than when they were self-styled earls[end if][if sco-weak-us is true]. You cut their 'we cuss' down to size, so they're now giving examples of how they cuss[else]. They constantly blather 'WE CUSS' and seem quite proud of that[end if].". printed name is "[if sco-grin-churls is true]grin churls[else]grinch earls[end if]". description is "Bleah. They remind you of popular kids (you know, the ones who beat up kids who claimed they weren't popular--it was effective) from back in school, except all grown up."

chapter crude orc

the crude orc is an unneeded follower in Brew Swears. "A crude orc trundles around here[if sco-weak-us is true], trying to impress [the earls][else if number of swearblobs in Brew Swears is 0], ready to follow you, with all the rough language taken care of[else if sco-crew-dork is true], on your side, now[else], looking equally between you and [the earls][end if].". description is "[if sco-weak-us is false]Looking at you like their next target, to show they're tough enough for [the earls][else if sco-crew-dork is false]Unsure of themselves. They might be ready for a hard truth[else if number of swearblobs in Brew Swears > 0]Looking up to you a lot, for setting [the grinch] straight[else]Ready to go along with you on your adventure[end if].". help-chat of crude orc is "The crude orc doesn't have any strategy, per se. It's still young and naive. But it asks the sort of questions you forgot you had. Perhaps others youths have these questions, too, or they would, with -- well, whatever force that kidnapped you -- not pressing on them so much."

chapter swearblobs

hush-it is a swearblob. "The [grinch] laugh and say 'Hush it.'".

life-occurs is a swearblob. "The [grinch] take cheap shots and say 'Life occurs.'".

heh-class is a swearblob. "The [grinch] mock you, or maybe boost themselves, with 'Heh, class!'"

weird-icks is a swearblob. "The [grinch] launch 'Weird! Ick![']s at enmies real and imagined."

bah-sturdy is a swearblob. "The [grinch] shake their heads at you: 'Bah! Sturdy?!'"

volume endgame rooms

book Worm Eaten

Worm Eaten is a room in universal. printed name is "[if sco-were-meetin is false]Worm-Eaten[else]We're Meetin[']![end if]". "[if sco-were-meetin is false]This place seems very run-down. But it feels homey and inspires camaraderie in an odd way[else]Having had your meeting here, there's not much else to do[end if]."

after printing the locale description of Worm Eaten when sco-were-meetin is true and sco-my-corps is false:
	say "You feel like your companions are just about ready to go. But you still need to say something, something that can only come uniquely inside of you, to establish what a great team you are.";
	continue the action;

check going down in Worm Eaten:
	if sco-the-file is false, say "Hmm. You still feel like you're missing some plans, some intelligence, even though you have everything else. The [raider] found it easy to get kicked out, but you need detailed plans how to get back in." instead;
	remove-swear-bonus;

chapter gone trader

The gone traitor is a thing in Worm Eaten. "[one of]Someone comes out from the depths. They introduce themselves as the gone traitor, someone who cozied up to the bad guys and ditched their friends, then ditched the bad guys. And only recently they ran away, but how can they ask for forgiveness? Surely it just doesn't happen like this? Just one small change and you have a new identity? Rubbish![or]The gone traitor continues to mope about here, looking for someone who can help convince them they're not so awful.[stopping]". description is "[if sco-gaunt-raider is true]Still pretty gaunt, but no longer with a look of despair on their face. They're ready to redeem themselves, you imagine[else]Despairing, shaking their head, barely able to look you in the eye. You dare not ask all they did. But they seem sorry for the big stuff[end if]."

section gaunt raider

the gaunt raider is a follower. description is "Tall and imposing. They still look disturbed by who they were.". help-chat is "The gaunt raider discusses regret for their past actions, as well as some possibilities for how to use it to boost yourself to do the right thing, or when to just drop it without being drowned by guilt."

book Doom Ending

Doom Ending is a room in universal. "[if sco-wide-vision is true]This place is much less scary now that you shared your wide vision. But now you need to put it into practice![else if sco-wipe-out is true]Well, it turns out the doom ending was for the sea skull, not for you. But you're still a bit frustrated. How do you go forward from here?[else]The gaunt raider wasn't joking around when they said they came from some place awful! You just hope your companions can help you enough here.[end if]"

after printing the locale description for Doom Ending when Doom Ending is unvisited:
	say "Everyone whispers some variation of 'We're stuck! Worst, UCK!' to each other. But surely there must be a way through.";
	continue the action;

chapter Sea Skull

The Sea Skull is a thing in Doom Ending. "A sea skull [if sco-cease-cull is true] spews rivers of blood at you and your companions, but fortunately, with so many companions, the rivers aren't very deep. Still, you should do something about it[else]gloats evilly, with its back turned to you[end if].". description is "[if sco-cease-cull is true]It looks upset you've disturbed its, err, work[else]You can't see its face, which must be evil. You may need to yell something at it to get the, uh, conversation started[end if]."

chapter why division

the why division is a thing. "Why-division has settled in among your companions. Everyone's done what they can. Why should they do more? They've saved their skin, and a lot of others['], too, and they'll be safe for a while!". description is "It's not something physical. It's more a general mood. You worry you have not experienced enough to dispel it."

volume unsorted

volume verbs

the can't exit when not inside anything rule is not listed in any rulebook.
the convert exit into go out rule is not listed in any rulebook.

check exiting: try going outside instead;

check going outside:
	if outside is not viable:
		if number of viable directions is 1:
			let RVD be random viable direction;
			say "(going [RVD], the only viable direction)[paragraph break]";
			try going RVD instead;
		if number of viable directions > 2:
			say "That's vague, as you can go [list of viable directions]." instead;
[		say "You can't find any viable directions. Perhaps you need to solve a puzzle to get out of here." instead;]

book meta stuff

check quitting the game:
	say "A voice taunts you 'What? Changing your name to Ike Witt?'";

check restarting the game:
	say "A voice cackles 'Done, ooh? Duh, new!'";

check saving the game:
	say "A voice taunts 'Save?! I'll say, VILE!'";

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "[this-game] was written for IFComp 2024. It's something I originally thought about writing for EctoComp, but I never managed to mash enough ideas together.";
	say "[line break]It reuses a lot of code from [i]Roads of Liches[r] and my [i]Prime Pro Rhyme Row[r] games, which have different mechanics but a similar conceit: guess the right two-word phrase. However, it's narrower in scope, and I didn't want to rely on too well-known examples of possible phrases for point scoring.";
	say "[line break]Once I realized bigger projects weren't on the cards for IFComp 2024, I focused on something I could handle. I wound up making forty or so puzzle instead of the usual eighty.";
	say "[line break]While the drip of ideas started February, 2020, according to my notes, I wasn't getting anything really original, or so it seemed. But the idea was always there. In my weekly writing file 20240429.txt, there's the game's title, and that's when significant ideas started appearing. But it wasn't until I registered for IFComp in July that ideas started clicking together. Deadlines are funny like that!";
	say "[line break]Like most of my games, [this-game] rates merciful on the Zarfian cruelty scale. However, in this case, I want the puzzles to be more merciful in terms of general difficulty on the player's psyche than usual."

report abouting:
	if bruise wares is off-stage:
		say "Note that an optional room will appear about midway through the game. It may contain profanity, which I hope is amusing, but I don't blame you if you wish to skip it.[paragraph break]";
	say "[email] is my email, and [ghbase]/why-pout is the github site, where you can report issues. I'm open to transcripts.";
	say "[line break][b]CREDITS[r] lists people who helped make [this-game] a reality, or a better version than it would've been without them.  [b]EXT[r] shows the extensions listed, and [b]VERSION[r] or [b]VERSIONS[r] shows version info.";
	continue the action;

chapter creditsing

creditsing is an action out of world.

understand the command "credit" as something new.
understand the command "credits" as something new.

understand "credit" as creditsing.
understand "credits" as creditsing.

carry out creditsing:
	say "Thanks to Michael Baltes, Clem Bing-Storrs, Wade Clarke, Hanon Ondricek, P. B. Parjeter, Fred Snyder, and Daniel Stelzer for testing. They found stuff I just didn't have the time to find, or stuff I convinced myself I'd checked, honest I did, or even broke down cases for stuff where I was muddled and not sure how to test stuff. Oh and they inspired several ideas, too. It's always hard to ask someone for their time and energy, but I appreciate it so much![paragraph break]Michael, Fred and Daniel have IFComp [']24 entries as well, and I always appreciate being able to trade testing with a fellow competitor, so it doesn't feel cutthroat.";
	say "[line break]The cover art is my fault, and my fault alone.";
	say "[line break]GENERAL THANKS:[paragraph break]";
	say "Thanks to everyone past and future involved in the administration of IFComp.";
	say "Thanks to the I7 board on Intfiction.org for their help, as well as the people in the general topics as we discussed our plans.";
	the rule succeeds;

chapter verbsing

verbsing is an action out of world.

understand the command "verbs" as something new.

understand "verbs" as verbsing.

carry out verbsing:
	say "[this-game] bypasses many of the standard Inform parser verbs, since it is word-puzzle based. Things are taken implicitly, and you don't need to drop anything.";
	say "[line break]The four standard directions ([b]NORTH[r], [b]SOUTH[r], [b]EAST[r] and [b]WEST[r]) work, and some passages lead [b]IN[r], [b]OUT[r], [b]UP[r], and [b]DOWN[r], too.";
	say "[line break]In addition, there are NPCs you may wish to [b]TALK TO[r], which can be shortened to [b]T[r].";
	say "[line break][b]THINK[r] will remind you of things you found, but the time wasn't right.";
	say "[line break]Finally, [b]ABOUT[r] gives basic information about [this-game] and also cues some other meta-commands.";
	if current-score < 3:
		say "[line break]Most point-scoring commands will consist of two words.";
	the rule succeeds;

chapter versioning

carry out versioning:
	say "Version 1 was released to IFComp on August 28, 2024.";
	say "[line break]Version 2 is expected to be released shortly post-IFComp. I had a great idea for a hint device. The only thing not-great was the timing: six hours before the comp deadline!";
	say "[line break]I don't expect much beyond that, since this is a relatively short game.";
	the rule succeeds;

[the text below is added to Versioning and Extensions Tweak]

report exting:
	unless can-show-spoilers, say "One extension has been temporarily removed from the list, as it may cause a spoiler. If you wish to see it, come back after you've scored two points.";
	continue the action;

to decide whether can-show-spoilers:
	if current-score < 2, no;
	yes;

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "You hear a[one of][or]nother[stopping] size-Z 'X! Why's [']e...'";
	say "[one of][line break]No, I don't know whether size Z is super-big or super-small.[or][stopping]";
	the rule succeeds;

book regular verbs, modified

chapter inventory

check taking inventory:
	if sco-wipe-out is false, say "There's that occasional voice ringing in your head asking 'Why pout?' But besides that ...";
	now talk ache is mentioned;

report taking inventory when sco-six-quid is true and current-quid > 0:
	say "You [if current-quid < 6]still [end if]have [current-quid in words] quid left from helping the sick squid.";
	continue the action;

report taking inventory when sco-my-corps is false and sco-an-aim is true:
	say "You have a name, too, now, you remember: Mike Orr.";
	continue the action;

report taking inventory when player has talk ache:
	say "Oh, man. You still have that talk ache, too.";
	continue the action;

chapter sensing

the block listening rule is not listed in any rulebook.

check listening:
	if player is in hype lane:
		if prize talk is in hype lane, try examining prize talk instead;
		if cell phones are in hype lane, try examining cell phones instead;
	if player is in air aww, say "Air, or ... a roar?!" instead;
	say "Nothing that could help you." instead;

the block smelling rule is not listed in any rulebook.

check smelling: say "No funk, or fun. Cor!" instead;

the block tasting rule is not listed in any rulebook.

check tasting: say "A voice: 'No tastings note. Eh?' Stings!" instead;

the report touching yourself rule is not listed in any rulebook.

check touching: say "An internal voice says 'We poke, eh? Weep, okay?'" instead;

understand "touch" as touching.

rule for supplying a missing noun when touching: now the noun is the player.

chapter t talking

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

rule for supplying a missing noun when ting:
	if number of followers in location of player is 1:
		now noun is random follower in location of player;
		continue the action;
	if number of friendly followers in location of player is 1:
		now noun is random friendly follower in location of player;
		continue the action;
	if number of followers in location of player > 1:
		say "That's ambiguous--more than one friend you can chat with.";
		if number of still-chat-needed followers in location of player > 0:
			say "[line break]However, you still haven't talked with [the list of still-chat-needed followers in location of player].";
	else:
		say "Nobody here to talk to.";
	the rule fails;

check ting:
	if noun is skull, say "It's the big fight. You need action, not talk." instead;
	if noun is the player:
		if sco-an-aim is false:
			say "You feel too grumpy for positive self-talk. You mumble 'I molder. I'm older.'" instead;
		say "You motivate yourself with 'Goal: earn? Go learn!'" instead;
	if player is in doom ending:
		if sco-wide-vision is true, say "You've already shared your vision. Now's the time to put it into action." instead;
		if sco-wipe-out is true, say "The only thing left to do is dispel the why-division, if you can." instead;
		say "Now's not the time for chat." instead;
	if noun is squid, say "[if sco-six-quid is true]It seems to be choking a bit[else]The squid can't speak, but you get very good vibes from it. It will understand English when it needs to[end if]." instead;
	if noun is oaf liar, say "The oaf liar is talking over you. Perhaps you can shut them up by buying something really cheap." instead;
	if noun is merchant, say "You want to figure a way to kill conversation, instead." instead;
	if noun is booze troll, say "The booze troll doesn't seem interested in useful conversation, at least not in their present form." instead;
	if noun is not a follower, say "You don't get a response." instead;
	if sco-my-corps is true, say "Motivational talk is through. Time to end this thing." instead;
	if noun is not friendly:
		if noun is orc, say "You'll have to win the argument with [the grinch] before any meaningful conversations." instead;
		say "You haven't gained [the noun]'s trust enough yet for a chat." instead;
	if player has talk ache, say "That talk ache is a bit of a nuisance. You've probably got the information you need from your friends." instead;
	if number of still-chat-needed followers is 0:
		if noun is unchatted:
			say "Sure, why not chat a bit more?";
		else:
			say "You've talked to everyone you needed to, but why not chat again?";

carry out ting:
	say "You chat with [the noun] a bit, [if noun is chatted]recapping[else]learning[end if] more about the history of the area you're exploring and why you're here. It fills in some blanks in your memory.";
	say "[line break][help-chat of noun][line break]";
	the rule succeeds;

report ting:
	if noun is chatted:
		if talk ache is moot, continue the action;
		if number of still-chat-needed followers is 0:
			say "[line break]Ouch! Still got that talk-ache.";
			continue the action;
		say "That was a nice refresher, though ";
		if number of unchatted followers in location of player > 0:
			let RF be random unchatted follower in location of player;
			say "[RF] seem[if rf is not plural-named]s[end if] to want to cut in a bit for their turn some time.";
		else:
			say "it didn't reveal anything new.";
		if gs-t-special-note is false:
			say "[line break][i][bracket][b]NOTE:[r][i] if you want to see whom you haven't talked to yet, [b]T[r][i] by itself will do the trick. If there's only one companion you haven't talked to, you will talk to them[close bracket][r][line break]";
			now gs-t-special-note is true;
	else:
		if number of chatted followers is 0:
			say "Wow! Things are starting to make sense. Maybe talking to others will help make even more sense.";
		else:
			say "Well, that's [one of]even [or][stopping]more useful information worth remembering.";
		now noun is chatted;
		if number of still-chat-needed followers is 0:
			say "[line break]That was a lot of talking. After all that time alone, you're not used to it. You develop a talk-ache.";
			now player has talk ache;
	continue the action;

chapter talk ache

the talk ache is a thing. description is "Not really annoying, but the sort of small nuisance that makes you feel a need to do something.". printed name is "talk-ache".

section tall cake

the tall cake is a thing. description is "Wonderful. Can probably serve six or so. But you need to find the right place."

book taking

check taking:
	if player does not have noun, say "Everything you need will be implicitly taken in [this-game]." instead;

book waiting

check waiting:
	say "Ideally I-D-L-E!" instead;

volume cheating

chapter warponing

warponing is an action out of world.

understand the command "warp on" as something new.

understand "warp on" as warponing.

carry out warponing:
	let say-later be false;
	now verb-dont-print is true;
	repeat through table of main oronyms:
		unless there is a core entry, next;
		if core entry is false, next;
		if idid entry is true, next;
		process the check-rule entry;
		let vr be the outcome of the rulebook;
		if vr is the ready outcome:
			if think-cue entry is true:
				say "[one of]The war pawn glows hot in your hand. You drop it and pick it up. Why didn't it give a hint?[paragraph break]As you [b]THINK[r] a bit, you wonder if some things you tried, things that seemed like they should work, might work now.[or]The war pawn glows hot in your hand again. You must've made more progress than you assumed--good time to [b]THINK[r], again.[stopping]";
				the rule succeeds;
			say "After some thought, the war pawn vibrates and explodes! You suddenly have insight into a good way forward: ";
			say "[b][first-of-ors of w1 entry]";
			if there is a w2 entry, say " [first-of-ors of w2 entry]";
			say "[r]...[paragraph break]";
			if idid entry is false, up-reg;
			if run-rule entry is post-do-due-mend rule, decrement cur-max-bonus;
			now idid entry is true;
			now think-cue entry is false;
			process the run-rule entry;
			if debug-state is true:
				say "[line break]Keeping war pawn.";
			else:
				moot war pawn;
			follow the score and thinking changes rule;
			the rule succeeds;
		else if vr is the not-yet outcome:
			if there is a best-room entry and best-room entry is location of player:
				now say-later is true;
	if say-later is true:
		say "The war pawn grows rattles briefly in your hand, like it means to do something, but it's not ready. Or maybe you aren't. Yet.";
	else:
		say "The war pawn does nothing. There's nothing to do here. Well, at least, at the moment.";
	now verb-dont-print is false;
	the rule succeeds;

volume parser errors

rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "You may have used a word or two too many or made a typo in the final word.";

rule for printing a parser error when the latest parser error is the I beg your pardon error:
	say "'Hum, blank,' you muse. No humble ankh pops into your hands, sadly.";

volume meta rooms

Reap Rest is a room. moot-room is Reap Rest. "You should never get here."

volume appearance

for printing a locale paragraph about a follower (called fo):
	if fo is not friendly, continue the action;
	if fo is mentioned, continue the action;
	say "[The list of friendly followers in location of player] wait[if not say-plural-stationary-followers]s[end if] here for what to do or where to go next.";
	now all friendly followers are mentioned;

volume scores

check requesting the score:
	say "You have scored [core-score] of [core-max] necessary points";
	if cur-bonus > 0:
		say " and [cur-bonus] bonus point[if cur-bonus is not 1]s[end if]";
	if pre-acts > -1:
		say ". You also performed [pre-acts] of [pre-max] actions ahead of time";
	say ".";
	the rule succeeds;

volume painful parser stuff

after reading a command:
	if player is in brew swears and bah-sturdy is in brew swears:
		if the player's command matches "bastardy":
			change the text of the player's command to "bastard eee";

volume score stuff

when play begins (this is the score and status tweak rule):
	now the right hand status line is "[current-score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed or max-bonus is 0][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	now the turn count is 1;

to decide which number is doable-hinted:
	decide on 0;
