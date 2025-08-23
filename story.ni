"Why Pout" by Mick Stupp

volume top level stuff

the release number is 6.

release along with a website.

release along with cover art.

release along with the "Parchment" interpreter.

the story description is "Ow! Trot out rot?!".

the story headline is "A farce-too-far stew".

book includes

section my general stuff

include Trivial Niceties by Andrew Schultz.

include Punctuation Stripper by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

include Old School Verb Total Carnage by Andrew Schultz.

include Versioning and Extensions Tweak by Andrew Schultz.

include Standard Helping Metaverbs by Andrew Schultz.

section beta testing - not for release

include Why Pout Beta Testing by Andrew Schultz.

section semi-general

include Oronym Core by Andrew Schultz.

section game-specific

include Why Pout Globals by Andrew Schultz.

include Why Pout Tables by Andrew Schultz.

include Why Pout Definitions by Andrew Schultz.

include Why Pout Mistakes by Andrew Schultz.

include Why Pout Random Text by Andrew Schultz.

include Why Pout I6 Replacements by Andrew Schultz.

section not for release

include Why Pout Tests by Andrew Schultz.

chapter may be changed

main-table is table of main oronyms.

to game-specific-cleanup: do nothing;

section debug version

include Inventory Checking Each Turn by Andrew Schultz.

chapter move to global

when play begins:
	say "You forget why your captors took you here, or how, or when. You just remember, every day, they regale you with 'Find a fine day.'[paragraph break]It's sort of hard to, when you're trapped like this. But this time -- you're trapped a little differently. Somewhere new. You overheard something about how they were bored watching over you, and it was your fault for not being very interesting. Maybe you can escape from your prison and your mental fog.";
	now left hand status line is "[location of player][if sco-an-aim is false and Mike Orr is examined] (needing a name)[end if]";

after printing the locale description of air aww when air aww is unvisited:
	say "[i][bracket][b]NOTE[r][i]: to see general information about [this-game][i], type [b]ABOUT[r][i]. To see the verbs used, type [b]VERBS[r][i]. If you have trouble with the first few moves, there will be hints.[close bracket][r][line break]";
	continue the action;

universal is a region.

a region has a number called curregscore.

section temporary code to test remembering oneself

the can't search unless container or supporter rule is not listed in any rulebook.

check searching:
	if gs-search-warn is false:
		say "(One-time note: searching is functionally equivalent to examining in [this-game]. So [b]X THING[r] may be quicker in the future.)[paragraph break]";
	now gs-search-warn is true;
	try examining noun instead;

understand the command "wipe" as something new.

volume more meaningful standard verbs

book other regular verbs to zap

understand the command "pull" as something new.
understand the command "push" as something new.

book taking and dropping

Rule for deciding whether all includes something: it does not.

rule for printing a parser error when the latest parser error is the nothing to do error:
	if action-to-be is the ting action:
		say "You can't talk to more than one companion at once. To get an overview of whom you haven't talked to yet, try [b]I[r] for inventory.";
	else:
		say "It looks like you tried to act on multiple things. You don't need to act on more than one thing at a time in [this-game].";

rule for supplying a missing noun when taking:
	now noun is the player;

the can't drop yourself rule is not listed in any rulebook.
[the very unlikely to mean dropping what's already carried rule is not listed in any rulebook.]
the very unlikely to mean taking what's already carried rule is not listed in any rulebook.

volume rooms

book Eh Raw Air Aww

Eh Raw Air Aww is a room in first-rooms. printed name is "[if sco-an-aim is false]Eh, Raw Air, Aww[else]Tomb Apse[end if]". description is "[if sco-an-aim is false]The air chokes you a bit. It's too thick to see far beyond yourself. You barely know who you are, even. Ugh.[paragraph break]Maybe if you took a good look at yourself, it could provide some clues.[else]It's a bit clearer now. You still seem trapped. But there must be secrets hidden, and maybe one or more can get you out of here.[end if]". eyes-number of Eh Raw Air Aww is 2. eyes-rule of Air Aww is pre-an-aim rule. [okay, we don't get the eyes until later.]

book Hype Lane

Hype Lane is a room in first-rooms. "It's still pretty dark here. You must still be underground.[paragraph break]Around you, [if sco-self-owns is false]cell phones, cell phones everywhere. Such confident chatter. Or it seems confident. It distracts you and your bearings, trying to figure who you really are and get somewhere less dark[else if sco-pry-stalk is true]you're able to ignore the prize talk for now, but you realize you can and must move on from it. Get out of this underground area[else]a prize talk booms from unseen speakers, exhorting you to do, or at least earn, more. The heck with being above ground, with boring old nature that distracts you from being all you can be. Well, for the economy, at least[end if].". eyes-number of Hype Lane is 45. eyes-rule of hype lane is the pre-high-plain rule.

chapter cell phones

the cell phones are a plural-named sentient in hype lane. understand "phone" and "cell phone" as cell phones. "You don't remember everything about your former self, but you remember you hated cell phones and how they distracted you. Maybe if the people yacking into them were taken down a peg, you could focus a bit more. Dang cell phones.". description is "Whether or not the cell phones are the latest models, you don't want to pay attention to them too much. Just figure out a way for a harmless calamity that may make their users quiet down a bit.". eyes-number of cell phones is 44. eyes-rule of cell phones is the pre-self-owns rule.

understand "chatter" as cell phones.

every turn when noun is cell phones:
	if the player's command includes "chatter", say "It's more the cell phones you need to focus on. They're what's making the chatter extra distracting.";

chapter prize talk

the prize talk is a hostile sentient. "[if sco-pry-stalk is false]You'd like to DO something about the prize talk. Or seek out something that would give you passage away from it[else]The prize talk is all around, but you're able to ignore it, now you feel you might have a way out[end if].". description is "[if sco-pry-stalk is false]The prize talk discusses many things, jumping from subject to subject. It's not what it says, but how it keeps you ensnared without being interested. Like a predatory plant grabbing you or something[else]You can see your way around the prize talk now. You don't want to get sucked back in[end if].". eyes-number of prize talk is 35. eyes-rule of prize talk is the pre-pry-stalk rule.

section stalk

the stalk is a thing. description is "Apparently, it's magical or something, and if you know where you want to go and plant it, it will lead you there.". eyes-number of stalk is -1.

book Naff Haze

NaffHaze is a privately-named room in universal. "[if sco-nah-phase is false]You're surrounded by some really naff haze. It's naff because you can't go anywhere, and it also just makes you feel naff, and it seems so universal, like there's no escaping from it, and it'll be here forever and ever[else]Things have opened up [ways-open] now, with the naff haze lifted[end if][if sco-pole-east is true]. You feel less policed, too, since you found a path [b]EAST[r][end if][if sco-grow-star is true].[paragraph break]You got rid of the gross tar blocking your way [b]NORTH[r][end if].". printed name is "[if sco-nah-phase is false]Naff Haze[else]High Plain[end if]". eyes-number of NaffHaze is 35. eyes-rule of naffhaze is the pre-nah-phase rule.

to say ways-open:
	if plane-dir-score is 0:
		say "to where you see potential paths";
	else if plane-dir-score is 1:
		say "a bit";
	else if plane-dir-score is 2:
		say "a bit more";
	else if plane-dir-score is 3:
		say "almost all the way";
	else if plane-dir-score is 4:
		say "in every cardinal direction"

after printing the locale description for NaffHaze when sco-nah-phase is true and sco-pole-east is false:
	say "You feel policed here. And it's the mean American gung-ho militarized sort of policed, not the (usually) kinder UK brand. Where and what is this policed feeling coming from?";
	continue the action;

after printing the locale description for NaffHaze when Bruise Wares is off-stage and current-score >= 20 and core-pals-made >= 2 (this is the show-bruise-wares rule):
	say "An ominous new construction appears here. It's called [wares]. Perhaps you should ignore it. Often one doesn't want to engage that sort of thing. But you may feel that much more accomplished tackling whatever is behind there.";
	move Bruise Wares to NaffHaze;
	continue the action;

after going to NaffHaze when Bruise Wares is in NaffHaze and sco-treat-all is true:
	say "Coming back here, you notice [wares] has vanished. But that can't be all bad. It means one less potential place to need to look, if you get a bit lost.";
	zap-bruise-wares;
	remove-swear-bonus;
	continue the action;

the naff haze is scenery in NaffHaze. "You can't look very far though it. Just looking at it makes you feel hopeless you'll always be trapped in the fog.". eyes-number of naff haze is 35. eyes-rule of naff haze is pre-nah-phase rule.

check going a viable direction in NaffHaze when sco-pole-east is false:
	say "You'd like to go [noun], but you feel, well, policed." instead;

check going inside in NaffHaze:
	if sco-nah-phase is false, continue the action;
	if BRUISE WARES is moot:
		if Brew Swears is visited or sco-nab-aye is true, say "([wares] is no longer available, so I assume you mean the keep.)[paragraph break]";
		try going west instead;
	if BRUISE WARES is off-stage:
		try going west instead;
	if BRUISE WARES is in NaffHaze and sco-brew-swears is false:
		say "You'll have to figure what else [wares] is advertising, first." instead;
	if room gone to is Brew Swears:
		say "Your companions stay behind. They recognize this is a spiritual fight for you and you alone.";
		block-follows;

check going north in NaffHaze when sco-grow-star is false and sco-nah-phase is true: say "The gross tar is in the way right now." instead;

check going west in NaffHaze when sco-key-pillar is false and sco-nah-phase is true: say "The keep (iller) is locked. You will need to find the key." instead;

chapter policed feeling

the policed feeling is scenery. "It just feels like you could escape it, if you found something somewhere, or some direction.". eyes-number of policed feeling is 44. eyes-rule of policed feeling is pre-pole-east rule.

check eyeing the policed feeling: say "Strangely, though it's incorporeal, you get readings...";

every turn when noun is policed feeling:
	if the player's command includes "feeling", say "It's more the being policed to focus on. You have lots of feelings that come and go."

chapter short rail

the short rail is a thing. "A short rail leads -- well, not very far. You get the sense it should lead somewhere more.". description is "It's just ... not aligned right. Maybe if it were, it could lead somewhere, or make sense of this place, here.". eyes-number of short rail is 55. eyes-rule of short rail is the pre-shore-trail rule.

section shore trail

the shore trail is a thing. "The shore trail you discovered leads [b]SOUTH[r].". description is "There are no secret passages hidden in it.". eyes-number of shore trail is -1.

chapter gross tar

the gross tar is a thing. "Gross tar blocks the way [b]NORTH[r] into darkness.". description is "Maybe there's a way through, but it's a bit too dark now. At least it's not foggy any more.". eyes-number of gross tar is 44. eyes-rule of gross tar is the pre-grow-star rule.

chapter keep iller

the keep iller is a thing. "A keep, iller, rises to the [b]WEST[r][if sco-key-pillar is false], but you see no way in yet[else]. You've figured how to enter it[end if].". description is "It [if keepiller is visited]wasn't[else]doesn't look[end if] dangerous, but then, it's not exactly a tourist attraction. Still, [if keepiller is unvisited]there's probably a lot to do there, since it takes up a lot of space to the west[else if keep-score < 6]you've seen there's plenty to do there[else]it helped you a lot[end if].". eyes-number of keep iller is 36. printed name is "keep, iller". eyes-rule of keep iller is the pre-key-pillar rule.

check entering keep iller:
	if sco-key-pillar is false, say "You will enter the keep to the west, once you find a way. But you haven't, yet." instead;
	say "Going [b]WEST[r] inside the keep...[paragraph break]";
	try going west instead;

chapter waydown

the waydown is a privately-named thing. description is "You shouldn't see this description, since waydown is privately-named.". "There's also a way [b]DOWN[r] that opened up once you found passages in all cardinal directions.". eyes-number of waydown is 1.

chapter Bruise Wares

Bruise Wares is a thing. "[wares], some sort of odd disturbing shop, has popped up here. You can probably figure why it's forbidding and such. But perhaps it is only for a certain sort of adventurer[if nah bye is touchable]. You noticed [b]NAH BYE[r] scrawled on it[end if].". description is "Looking at [wares], it sort of overdoes the whole 'you might not be ready for this' schtick. And, you figure, if you know what's really there, it's not something you will put up with unless you have to.[paragraph break]Seriously, dealing with it is up to you.". eyes-number of bruise wares is -46. eyes-rule of bruise wares is the pre-brew-swears rule.

printed name of bruise wares is "[b]BRUISE-WARES[r]".

rule for choosing notable locale objects (this is the put followers at the bottom rule):
	repeat with item running through things in location of player:
		if item is a follower, set the locale priority of the item to 10;
		if item is Bruise Wares, set the locale priority of the item to 8;
		if item is waydown, set the locale priority of the item to 9;

check entering Bruise Wares:
	if sco-brew-swears is false, say "You probably shouldn't go in there until you divine its true meaning." instead;
	try going inside instead;

report examining Bruise Wares when gs-nah-bye-cued is false:
	say "It's been vandalized a bit, though, and maybe if you [b]X[r] again, you might find a fourth-wall way to warp around and, well, see the bare minimum of extra adventures it holds, without the, well, language.";
	now gs-nah-bye-cued is true;
	continue the action;

report examining Bruise Wares when gs-nah-bye-cued is true and nah bye is off-stage:
	say "Oh, hey! You notice something scrawled on [wares]. It says [b]NAH, BYE[r]. It seems negative on the surface but makes you believe if you can do the minimum you need to get in and out of that place and bypass the spicier stuff.";
	now gs-nah-bye-cued is true;
	move nah bye to NaffHaze;
	continue the action;

section nah bye

the nah bye is scenery. "[b]NAH BYE[r] is scrawled on the [wares] sign.". eyes-number of nah bye is -33. eyes-rule of nah bye is pre-nab-aye rule.

book Keep Iller

KeepIller is a room in Universal. printed name is "Keep (Iller)". "This keep has seen better days, but there seems to be a lot in its ruins. You can go back [b]EAST[r]. [if sco-see-design is true]You explored south already, so no need to go back[else]You also sense something fearsome from a passage south[end if].". eyes-number of KeepIller is -1.

check going south in KeepIller:
	if sco-knife-right is true, say "You don't need or want to revisit the Nigh Fright. You're not scared, of course, just focused on what needs to be done" instead;
	if pals-made is 0:
		say "You try to go south, but with no support, you're just too scared." instead;
	else if pals-made is 1:
		say "Even with [the random friendly follower]'s support, you are still terrified of what is south. You may need just a bit more." instead;
	else:
		say "You get over your fears with a little help from your friends.";

chapter no mold

there is a thing called no mold. It is in KeepIller. "You are really impressed by how no mold grows here. [if pre-gnome-old rule is guessed-yet]The gnome (old,) who keeps it up, will be an impressive companion once you find them adventuring gear.[else if sco-gnome-old is false]Someone must be keeping it up well. Who?[else]". description is "You can't see the absence of mold, but you appreciate it nonetheless. Someone must be, ahem, keeping the keep up well. Who?". eyes-number of mold is 53. eyes-rule of no mold is the pre-gnome-old rule.

section gnome old

the gnome old is a follower. printed name is "gnome (old)". help-chat is "The gnome (old) discusses ways of finding hidden psychic weaknesses in a very tough opponent. You also hear how whatever force there is, it only cares about things looking good on the outside. The gnome had so much mold to protect against and continually scrape away, even outside of the keep.". description is "Still full of vigor, like they don't deserve to be schlepped out in a garden--though keeping mold away as they did is certainly good-gardening-adjacent!". eyes-number of gnome is -1.

chapter row gold

there is a thing called row gold. It is in KeepIller. printed name is "row (gold)". "A row (gold) shines in this otherwise forbidding keep[if sco-rogue-old is true], and you're glad the rogue (old) had enough faith in you to leave it for a while[else if pre-rogue-old rule is guessed-yet]. You've met its proprietor, the rogue (old,) but they require payment[end if].". description is "You're surprised someone hasn't taken it yet. Perhaps it has an unseen guardian.". eyes-number of row gold is 53. eyes-rule of row gold is the pre-rogue-old rule.

section rogue old

the rogue old is a follower. printed name is "rogue (old)". help-chat is "The rogue (old) discusses ways to sneak around so vastly overpowered opponents can't blow you away, and you also learn not to feel guilty or shifty about being good at sneaking around, around much more unsavory entities than yourself.". description is "Moves a bit slowly, but also very quietly.". eyes-number of rogue old is -1.

chapter manic herb

some manic herb is a thing in KeepIller. "There's a bunch of manic herb here[if sco-manna-curb is true] the mensch elf sifted through[else]. You don't know a lot about it, other than that some is really poisonous and some is okay. There's so much, perhaps it's hiding something[end if]. ". description is "You're unable to see through it, to determine what's safe[if sco-manna-curb is true], but you don't need to[else], and it'll probably require someone else's knowledge, from times way past, maybe even Biblical, once you know what to look for[end if].". eyes-number of manic herb is 54. eyes-rule of manic herb is the pre-manna-curb rule.

section manna

some manna is a singular-named thing. description is "Apparently, manna is supposed to be tasty. It looks sort of dull. Maybe it can be made into something cool. You don't know what.". indefinite article of manna is "some". eyes-number of manna is -1.

chapter plant racker

the plant racker is a thing in KeepIller. "A plant racker lies here, pretty much useless.". description is "It seems papery, broken beyond repair, at least in its current state.". eyes-number of plant racker is 47. eyes-rule of plant racker is the pre-plan-tracker rule.

chapter plan tracker

the plan tracker is a thing. description is "[if sco-war-file is true]You have written notes for combat and leadership in here. They will be useful for the rest of your journey[else]The plan tracker is currently blank, but maybe you can find plans for it[end if].". eyes-number of plan tracker is -1.

after printing the name of plan tracker when taking inventory: say " ([if sco-war-file is false]with no ideas yet[else]full of ideas[end if])"

chapter seedy sign

the seedy sign is a thing in KeepIller. "[if sco-see-design is false]A seedy sign stands here, advertising somewhere very risky indeed[else]That seedy sign stands off to the side here. It's no longer scary, but you don't wish to bother with it, any more[end if].". description is "[if sco-see-design is false]There are clues in here to figure what it hides, if you look the right way. You might be scared to[else]The design is clearer now--not that you want to go back[end if].". eyes-number of seedy sign is 36. eyes-rule of seedy sign is the pre-see-design rule.

book Nigh Fright

Nigh Fright is a room in Universal. "Whatever you need to do or find here, you only want to do it once. You don't want to have to come back. You're glad your friends supported you enough to get here, but you don't want to have to rely on them like that again.[paragraph break]So, what do you need to find, before getting out?". eyes-number of nigh fright is 45. eyes-rule of nigh fright is the pre-knife-right rule.

chapter knife right

the knife right is a thing. printed name is "knife (right)". description is "Well, it's sharp. And it's probably, like, sacred and stuff, since you got it in a rite.". eyes-number of knife right is -1.

book Wolf Rock

Wolf Rock is a room in universal. "A big rock in the shape of a wolf looms impressively, blocking all passages except back [b]SOUTH[r]. [if sco-hide-out is true]You can also go [b]DOWN[r] into the hideout you found[else]Also, the high doubt you can go anywhere else here is thick indeed. Maybe there's a way to dispel it[end if].[paragraph break]There's a huge pile of lode ore here, too, [if sco-low-door is true]and you found a low door in it that leads [b]INSIDE[r][else]and perhaps there's something in it[end if].". eyes-number of wolf rock is 45. eyes-rule of wolf rock is the pre-wool-frock rule.

check going inside in Wolf Rock:
	if sco-oh-flier is true, say "Since you got the flier, you have no need or desire to return." instead;
	if sco-low-door is true:
		say "The low door makes it hard for too many people or entities to enter at once. So you go it alone.";
		block-follows;

chapter high doubt

the high doubt is scenery in Wolf Rock. "It's incorporeal, and examining it too much would be serious navel-gazing.". eyes-number of high doubt is 43. eyes-rule of high doubt is the pre-hide-out rule.

chapter wool frock

the wool frock is a thing. description is "It's a bit too small for you.". eyes-number of wool frock is -1.

chapter lode ore

the pile of lode ore is scenery in Wolf Rock. "[if sco-low-door is true]You can't imagine there is anything more to find[else]Maybe it is hiding something. If it were a pile of anything else, it might not be so interesting[end if].". eyes-number of lode ore is 34. eyes-rule of lode ore is the pre-low-door rule.

section low door

the low door is scenery. "You can just barely fit through it, now the tall mice helped you to find and clear it.". eyes-number of low door is -1.

check entering low door: try going inside instead.

book Hideout

Hideout is a room in universal. "You can only go back [b]UP[r]. You're sort of glad it's not a deluxe or exciting hideout, really, since that'd just mean more to map out.". eyes-number of hideout is -1.

chapter Booze Troll

the booze troll is a prefollowing sentient in Hideout. "A booze troll sulks sullenly here.". description is "For all the troll's sulkiness, it doesn't appear evil. Perhaps it's reacted badly to ... well, the same people who stuffed you beneath the tomb apse.". eyes-number of booze troll is 54. eyes-rule of booze troll is the pre-boost-role rule.

the new troll is a follower. "A new troll looks around with purpose.". help-chat is "The new troll relates ways to shake oneself free from despair (no! Really! It managed to for a while!) before relating more ways to avoid it in the first place, or help others you care about do the same.". description is "Won't win any beauty contests, but the troll seems to look eagerly towards you for what to do next.". eyes-number of new troll is -1.

chapter base ale

the Base Ale is a thing. description is "Uck. It's a nasty color, really. But perhaps it will be useful.".  indefinite article of Base Ale is "some". eyes-number of base ale is 34. eyes-rule of base ale is the pre-bay-sale rule.

book We Loan

We Loan is a room in universal. printed name is "[if sco-well-own is false]We Loan[else if sco-whee-lone is false]We'll Own[else if sco-oh-flier is false]Whee, Lone?[else]Whee! [']Lone![end if]". "[loan-starter][line break]You can only go back [b]OUT[r] here[if sco-well-own is false].[paragraph break]You don't really trust the whole 'financial services' vibe here. Maybe there's a double meaning to deduce[end if].". eyes-number of we loan is 43. eyes-rule of we loan is the pre-well-own rule.

to say loan-starter:
	if sco-oh-flier is true:
		say "It's fully calm and peaceful around here. [if flier is moot]You even made full use of that flier you found here[else]You've managed to navigate negotiations and wind up with ... a shiny new flier[end if]! What more could you ask for? Here, well, probably nothing. Time to get back to your companions.";
	else if sco-whee-lone is true:
		say "Commerce seems to be happening here, whether you want it or not. Or maybe you have one more thing you can do?";
	else if sco-bile-oh is true:
		say "It's nice to have this area to yourself, for now. You'd like to celebrate a bit. Maybe there's a specific way to do so.";
	else if sco-well-own is true: [summer chant doesn't change the room description]
		say "You've seen the seedy side of this place, and you can't unsee it. You'll just have to work through it.";
	else:
		say "This area feels replete with the sort of double-talk all salesmen use. You can almost hear all the dropped and excess apostrophes. It will be tough to hang with all the way through, but if you do, maybe you'll get something out of it.[paragraph break]So, yeah, outwardly, everything seems okay here. And yet ... something about the place, its name, leads you to feel things behind the curtain aren't right, and you need to expose them."

check going outside in We Loan:
	say "You're glad to get back to your companions...";
	allow-follows;

chapter some merchant

some merchant is a singular-named hostile sentient. "Some merchant babbles on, all up in your personal space, suggesting you buy low[if sco-summer-chant is true], but a bit more tolerable now you've got a mantra to zone them out.[else]. You find yourself thinking 'Man, SOME merchant,' yet looking for a way to think, 'pfft, some merchant.'[end if]". description is "Their smile certainly is fake. They're not going to shut up until you get a resolution here.". eyes-number of merchant is 65. [indefinite article of merchant is "some".] eyes-rule of some merchant is the pre-summer-chant rule.

check eyeing merchant when sco-summer-chant is true:
	say "It's more their 'buy low' rhetoric, now you managed to get that chant started. You focus on that.";

report examining merchant when sco-summer-chant is false:
	say "It strikes you you don't see them as [i]a[r] merchant, or [i]the[r] merchant, but [i]some[r] merchant.";
	continue the action;

check going outside in we loan when merchant is in we loan: say "Alas, that merchant is some merchant, able to capture your attention as you want to pull away.[paragraph break]You'll have to deal with the merchant, uhh, some merchant, sometime, anyway." instead;

chapter oaf liar

the oaf liar is a sentient. "An oaf liar blathers away here, with stuff that's likely, but not provably false. They seem quite proud of their salesmanship skill, which is more persistence than anything else.". description is "Smarmy and well-dressed.". eyes-number of oaf liar is 25. eyes-rule of oaf liar is the pre-oh-flier rule.

section flier

the flier is a thing. description is "The flier advertises places to go: a wharf isle, a thief isle, and a grove isle, each of which may hold odd treasures. It contains pretty clear directions, too. The only thing it lacks is where the directions start from[if flier-isle-score > 0]. You now know to start [here-in of NoNotion][end if].". understand "flyer" as flier. eyes-number of flier is 34. [this is not always right because...] eyes-rule of flier is the flier-conglomerated-eyes rule.

a wordtwisting rule (this is the flier-conglomerated-eyes rule):
	if player is not in NoNotion, not-yet;
	if sco-grow-vial is false, ready;
	if sco-war-file is false:
		if sco-plan-tracker is true, ready;
	if sco-the-file is false:
		if number of still-chat-needed followers is 0, ready;
	not-yet;

check eyeing flier when flier-isle-score < 2:
	if flier-isle-score is 1 and sco-grow-vial is true, continue the action;
	process the flier-conglomerated-eyes rule;
	let rb-out be the outcome of the rulebook;
	say "Weird. The flier seems to blink between three and four dots on the left, but it's stable at four dots on the right. The dots [if rb-out is ready outcome]do not [end if]blink." instead;

report examining the flier:
	if flier-isle-score is 0:
		say "You haven't found a way to get to any of the islands yet.";
	else if flier-isle-score is 1:
		say "So far you've only found [if sco-grow-vial is true]Grove[else if sco-war-file is true]Wharf[else]Thief[end if] Isle.";
	else if flier-isle-score is 2:
		say "You still need to find [if sco-grow-vial is false]Grove[else if sco-war-file is false]Wharf[else]Thief[end if] Isle.";
	continue the action;

book Lobe End

Lobe End is a room in universal. "[if sco-low-bend is false]This lobe of land appears to fall off steeply in all directions except back west. Maybe you could look for something that might be a hill, even a steep one.[else]The low bend (former lobe end) now bends from west to north, where there's too much water to pass on foot[raft-clue].[end if]". printed name is "[if sco-low-bend is true]Low Bend[else]Lobe End[end if]". eyes-number of lobe end is 34. eyes-rule of lobe end is the pre-low-bend rule.

to say raft-clue:
	if sco-bay-sale is false:
		say ". So maybe you could get across, with transport. Maybe you can summon or find someone who can offer it, as well a way to pay[if squid is not off-stage]. Unfortunately, the squid can't help you back here. The water's deep and wide, but not enough[end if]"

check going north in lobe end when sco-low-bend is true and sco-bay-sale is false: say "You have no way across the water, yet." instead;

there is a thing called the water to the north. it is scenery. "[if sco-bay-sale is true]Easy to cross with the raft[else]You need a vessel to cross the water. The other side is too far away[end if].". eyes-number of water to the north is 1.

chapter We Craft Weak Raft

the We Craft Weak Raft is a thing. printed name is "We-Craft Weak Raft". description is "Well, it isn't fancy, but [if storm isle is unvisited]it looks sturdy enough[else]it got you across the water with no problem[end if].". "[if player is in lobe end]Fortunately, the[else]The[end if] We-Craft Weak Raft from the bay sale floats here, ready to take you [if player is in storm isle]south[else]north[end if] across the water and back, as many times as needed.". eyes-number of We Craft Weak Raft is 1.

check going:
	if ((room gone from is lobe end) and (room gone to is storm isle)) or ((room gone to is lobe end) and (room gone from is storm isle)):
		if storm isle is unvisited:
			say "You poke at [the raft] one last time before braving the water, which isn't too deep or too active, but then, you aren't an expert at this.[paragraph break]It's all so smooth. It's not until you cross you realize you won't need to seek a new sea-canoe.";
		else:
			say "You[if pals-made is 1] and [the random friendly follower][else if pals-made > 1] and your [pals-made in words] companions[else][end if] again make it across the water without incident on your raft.";
		move raft to room gone to;

book Storm Isle

Storm Isle is a room in universal. "[if sco-store-mile is true]Well, you're in a sort of shopping mall now. You can see a passage leading north[else]On this storm isle, it's always rainy. It'd be nice to have some shelter inside[end if].". printed name is "[if sco-store-mile is true]Store Mile[else]Storm Isle[end if]". eyes-number of storm isle is 55. eyes-rule of storm isle is the pre-store-mile rule.

chapter my stall

My Stall is a thing. "A stall labeled [b]MY STALL[r] sits here, abandoned, against a wall. You think you hear odd noises from behind it.". description is "As you get closer to [b]MY STALL[r], the odd noises grow a bit louder. You see nothing particularly special, though.". eyes-number of my stall is 44. eyes-rule of my stall is the pre-mice-tall rule.

section mice tall

the mice tall are a plural-named followers. printed name is "mice (tall)". description is "Well, they're tall for mice, so they just come up to your thigh. But they make up enough numbers to be extremely effective at whatever you need them to do. They're a cool blend of 'My skill mice kill' and 'My school mice, cool.'". help-chat is "[one of]You're surprised how easy it is to understand them and how easily they understand you. [or][stopping]They discuss how much bigger opponents can be brought down by, not just arrogance facing many small opponents, but by dexterity and quick maneuvers. Oh, also a lot about the evil in the land killing or corrupting or mutating animals. So presumably finding or destroying it will put a stop to the very worst bits.". eyes-number of mice tall is -1.

chapter men shelf

the MEN shelf is a thing. "A MEN shelf sits here, barren. Which may be a good thing--there's no appalling stuff to buy. Or a bad thing--everything it displayed was in such high demand.". description is "Empty. Well, it's a system of shelves, really. Perhaps there is something or someone under or behind. Someone too decent to buy anything from such a bold MEN shelf.". eyes-number of MEN shelf is 63. eyes-rule of men shelf is the pre-mensch-elf rule.

section mensch elf

the mensch elf is a follower. description is "Smiling and ready to help.". help-chat is "The mensch elf discusses ways to identify people or situations that just need a bit of help, and how to do so without making them feel hopeless or in need of help, or that they got themselves in this position in the first place.". eyes-number of mensch elf is -1.

after printing the locale description for Storm Isle when gs-got-weapons is false and sco-treat-all is true:
	now gs-got-weapons is true;
	say "The gaunt raider raises a hand. They have an idea! The abandoned mall must have all sorts of stuff that can be fashioned into weapons. Not top-of-the-line, but enough to get by. Heartened by your recent meal, your party takes the time to find weapons. You all keep them hidden until needed.";
	continue the action;

book Trees Mall

Trees Mall is a room in universal. "This is a withered, run-down former mall that had the ceiling blow off. A long old lawn, gold, is depicted here on crumbling walls and fails to give a semblance of nature. You can only go back [b]SOUTH[r].". eyes-number of trees mall is 45. eyes-rule of trees mall is the pre-tree-small rule.

to grow-the-tree:
	if player has grow vial and tree small is in Trees Mall:
		say "But wait! You can use the grow vial! It makes the tree (small) into a tree (tall)! Then it dissolves once empty.";
		moot tree small;
		moot grow vial;
		move tree tall to Trees Mall;

after printing the locale description for Trees Mall:
	grow-the-tree;
	wfak;
	continue the action;

chapter tree small

the tree small is a thing. "The tree (small) that you summoned/discovered sits here, growing or trying to, at least. What could you use on it to help it really bloom?". description is "It's a nice tree, but you wish you could make it bigger.". eyes-number of tree small is -1. printed name is "tree (small)".

check eyeing tree small: say "The eyes show nothing. But the tree should be bigger! Perhaps there is a more organic method to achieve this." instead;

chapter tree tall

the tree tall is a thing. "A tree (tall) has grown here, thanks to you and the grow vial you found. It's quite welcoming. A whole crowd could sit under it!". description is "It was a nice tree before, but it's much more impressive now.". eyes-number of tree tall is 53. printed name is "tree (tall)". eyes-rule of tree tall is the pre-treat-all rule.

chapter long old lawn gold

the long old lawn gold is scenery in Trees Mall. printed name is "long old lawn, gold". "The lawn looks tacky and useless. You can't make it better, but [if tree tall is in mall]you grew that tree (tall,) which is pretty good[else if sco-tree-small is true]that three (small) you summoned is pretty nice[else]maybe you can improve the area in general[end if].". eyes-number of lawn gold is 1.

understand "walls" as lawn gold when player is in Trees Mall.

book no notion

NoNotion is a room in universal. "[if sco-known-ocean is false]You simply have no notion what lies beyond here. You hope something does. Surely the shore trail didn't just lead to a dead end! [else][ocean-desc]. [island-status]. [end if]You can go back north to the high plain.". printed name of nonotion is "[if sco-known-ocean is false]No Notion[else]Known Ocean[end if]". eyes-number of NoNotion is 55. eyes-rule of NoNotion is the pre-known-ocean rule.

to say ocean-desc:
	if flier-isle-score is 0:
		say "It looks like there is an ocean, or some large body of water, as you can't see islands in the distance";
	else:
		say "The ocean surrounds you on all sides, but it's less intimidating now you rode the squid"

to decide whether remaining-flier-guessed:
	if pre-war-file rule is guessed-yet, yes;
	if pre-grow-vial rule is guessed-yet, yes;
	if pre-the-file rule is guessed-yet, yes;
	no;

to say island-status:
	if flier-isle-score is 0:
		if remaining-flier-guessed:
			say "You feel confident you will see, based on your previous thoughts, if there are islands far away";
		else:
			say "If they're there, they're too far to swim to--you'd need a map and help to navigate things";
	else if flier-isle-score is 1:
		if remaining-flier-guessed:
			say "You have figured more than one place to go, but you didn't have the capability to visit everywhere, yet";
		else:
			say "You figured one island to visit. Maybe there are more";
	else if flier-isle-score is 2:
		if remaining-flier-guessed:
			say "There's only one isle left to visit from your flier. You just need to figure how to get there";
		else:
			say "You bet there's one remaining isle from the flier";
	else:
		say "You had fun exploring beyond the horizon, but there's nothing left to do, now";

chapter sick squid

the sick squid is an agreeable sentient. "A [if sco-six-quid is true]formerly (thanks to you) [end if]sick squid trundles about in the water here.". description is "[if sco-six-quid is false]It seems like it's half choking on something, not enough to strangle it, but enough to make it really uncomfortable[else]It looks back at you. Squids don't smile, but if it could, it would. Perhaps, if you know of an island nearby in the ocean, it will take you there[end if].". eyes-number of sick squid is 34. eyes-rule of sick squid is the pre-six-quid rule.

check entering squid: say "It might not have the energy for joyriding. You need to show it where to go, maybe with [if player has flier]that flier of yours[else]a map or something[end if]." instead;

chapter grow vial

the grow vial is a thing. description is "It says it will help something grow, but it's potentially toxic to mammals.". eyes-number of grow vial is -1.

chapter ocean

the ocean is scenery. "Well, you'll need help to cross it.". eyes-number of ocean is -1.

check entering ocean: try going west instead;

book wand wharf

Wand Wharf is a room in universal. "You rode the squid here, and there are all sorts of magical symbols here. It's a bit intimidating for someone like you who is clueless about magic. Maybe it's intimidating and depressing for someone else, and maybe you can more than commiserate.[paragraph break]You don't really trust your sense of direction here, but maybe if you knew the sort of companion you were looking for, it would help.". eyes-number of wand wharf is 35.

the wan dwarf is a follower. description is "Short and stocky. It wears glasses from what other dwarves would say was reading too much.". help-chat is "The dwarf provides an impressively nuanced view on how to balance magic skill with physical skill and fighting savvy. But the dwarf also notes how to be a good expert in specific areas if need be, as well as how to get experts and generalists to work together. However, the dwarf also expresses worry that this talk is all great in theory but hard in practice.". eyes-number of wan dwarf is -1. eyes-rule of wand wharf is the pre-wan-dwarf rule.

book Brew Swears (optional)

to say leave-out: say "leave back [b]OUT[r]"

Brew Swears is a bonuspointy room in universal. "[if grinch earls are in brew swears]If you thought Hype Lane was bad, this is even worse. Fortunately, you don't need to solve any puzzles to [leave-out][else if sco-gah-wanker is false]It's lonelier her without [the earls], but you could still make it lonelier! Or you can just [leave-out][else]Now that you got rid of the orc's old associates and their, um, mentor, there's nothing really left to do here. You can [leave-out][end if].". eyes-number of brew swears is -42. eyes-rule of Brew Swears is pre-weak-us rule.

check going outside in Brew Swears:
	allow-follows;
	if shrewd orc is friendly:
		say "As you lead [the orc] out, BRUISE-WARES crumbles behind you.[paragraph break]But [the orc] pauses. You ask what's the matter. Once they see their companions, they wonder if -- well, they'll fit in. They're too young and orcish. And they have a lot of questions they're sure other people know the answers to.[paragraph break]It's tough -- they had a lot of questions you had when you were younger, and some of their own, too! But they're good questions, ones you'd have enjoyed kicking around. And they show surprising insights for their youth.[paragraph break]You sense 'It's going to be okay' and 'you'll find a place' isn't enough. What is there to say?[paragraph break]Ah. This should work: 'You're new. Yearn! Ooh!'";
		wfak;
		let x be list of friendly needed followers;
		say "[line break]Shortly, [the entry 1 in x] greet[nosplur of entry 1 in x] the orc with 'You the youth, uhh?'[paragraph break]The orc responds 'I'm an ... I ... man ...' but soon gets their footing.[paragraph break]";
		say "[line break]Soon, [the entry 2 in x] chime[nosplur of entry 2 in x] in with 'You ... swell use, well!' Of course, this is clarified: the orc isn't just useful, or there to be used. But it breaks the ice completely.";
		wfak;
		say "[line break]The orc held their own in conversation. And they didn't swear once. They have a keen moral eye. You ask a bit more about their background. They've earned a new name -- not the crude orc, but the shrewd orc, a hat-tip to how [the grinch] mocked them for being too goody-goody, and how that's largely passed now.";
		zap-bruise-wares;
		remove-swear-bonus;

to zap-bruise-wares:
	moot BRUISE WARES;
	if nah bye is in NaffHaze:
		moot nah bye;
		choose row with check-rule of pre-nab-aye rule in table of main oronyms;
		now think-cue entry is false;
	now nowhere is mapped inside NaffHaze;

chapter earls

the grinch earls are a plural-named hostile sentient in Brew Swears. "Some [earls] parade around here, bragging about how they ruin boring people's fun with their dynamic ways and pointing out that it's easy to be nice if you're boring. They fix you with a 'We parse: weep, arse' gaze[if sco-grin-churls is true], though they're less effective than when they were self-styled earls[end if]. [if number of not moot swearblobs is 0]They've run out of swears but not of sneers. Perhaps one more non-profane phrase could dispel them[else if sco-weak-us is true]You cut their 'we cuss' down to size, so they're now giving examples of how they cuss[else]They constantly blather 'WE CUSS' and seem quite proud of that[end if].". printed name is "[if sco-grin-churls is true]grin churls[else]grinch earls[end if]". description is "Bleah. They remind you of popular kids (you know, the ones who beat up kids who claimed they weren't popular--it was effective) from back in school, except all grown up. But perhaps the right broke-us-bro cuss can neutralize them.". eyes-number of grinch earls is -46. eyes-rule of grinch earls is pre-grin-churls rule.

understand "grin churls" and "grin/churls" as grinch earls when sco-grin-churls is true.

chapter shrewd orc

the shrewd orc is a privately-named unneeded follower in Brew Swears. "A crude orc trundles around here, [orc-desc].". description is "[if sco-weak-us is false]Looking at you like their next target, to show they're tough enough for [the earls][else if sco-crew-dork is false]Unsure of themselves. They might be ready for a hard truth[else if number of swearblobs in Brew Swears > 0]Looking up to you a lot, for setting [the grinch] straight[else]So over this place and ready to go along with you on your adventure[end if].". help-chat of shrewd orc is "The shrewd orc is wise beyond its years, especially given what you'd heart about orcs. Perhaps it has no grand theories, and it's still young and naive. But it asks the sort of questions you forgot you had. Perhaps others youths have these questions, too, or they would, with -- well, whatever force that kidnapped you -- not pressing on them so much. And while impressing kids with mean swears isn't overarching evil, it's a gateway to nastier things. Kids like the orc are worth helping.". eyes-number of shrewd orc is -44. eyes-rule of shrewd orc is pre-crew-dork rule.

printed name of shrewd orc is "[if player is in Brew Swears]crude[else]shrewd[end if] orc".

understand "orc" as shrewd orc.

understand "crude" and "crude orc" as shrewd orc when player is in Brew Swears.

understand "shrewd" and "shrewd orc" as shrewd orc when player is in Brew Swears.

to say orc-desc:
	if orc-score is 0:
		say "trying to impress [the earls]";
	else if orc-score is 1:
		say "looking equally between you and [the earls]";
	else:
		say "[if grinch earls are in Brew Swears]looking with distaste at the grinch earls, [else if gawain kerr is in Brew Swears]looking with distaste at Gawain Kerr[else]ready to leave when you are[end if]"

chapter swearblobs

aah-slow is a swearblob. "The [grinch] snicker 'Aah, slow!' at you. It's a screamy aah, not an a-ha sort of aah.". eyes-number of aah-slow is -34. eyes-rule of aah-slow is pre-ass-low rule.

bah-sturdy is a swearblob. "The [grinch] shake their heads at you: 'Bah! Sturdy?!'". eyes-number of bah-sturdy is -73. eyes-rule of bah-sturdy is pre-bastard-eee rule.

heh-class is a swearblob. "The [grinch] mock you, or maybe boost themselves, with 'Heh, class!'". eyes-number of heh-class is -63. eyes-rule of heh-class is pre-heckle-ass rule.

damp-yawns is a swearblob. "The [grinch] dismiss you: 'Damp! Yawns!'". eyes-number of damp-yawns is -45. eyes-rule of damp-yawns is pre-damn-peons rule.

hush-it is a swearblob. "The [grinch] laugh and say 'Hush it.'". eyes-number of hush-it is -34. eyes-rule of hush-it is pre-huh-shit rule.

life-occurs is a swearblob. "The [grinch] take cheap shots and say 'Life occurs.'". eyes-number of life-occurs is -37. eyes-rule of life-occurs is pre-lie-fuckers rule.

weird-icks is a swearblob. "The [grinch] launch 'Weird! Ick!'[']s at enemies real and imagined.". eyes-number of weird-icks is -45. eyes-rule of weird-icks is pre-were-dicks rule.

chapter Gawain Kerr

Gawain Kerr is a hostile sentient. "Gawain Kerr stands here, ready to mock and slightly mispronounce your name some more. The horror! Well, what are you going to do about it?". description of Gawain Kerr is "He has the words SOFA KING tattooed on one arm and FLOCK RAP on the other.". eyes-number of Gawain Kerr is -36. eyes-rule of Gawain Kerr is pre-gah-wanker rule.

volume endgame or endgame-ish rooms

book Worm Eaten

Worm Eaten is a room in universal. printed name is "[if sco-my-corps is true]A Play-[']Er-Up Lair[else if sco-were-meetin is false]Worm-Eaten[else]We're Meetin[']![end if]". "[if sco-were-meetin is false]This place seems very run-down. But it feels homey and inspires camaraderie in an odd way[else]Having had your meeting here, there's not much else to do[end if].". eyes-number of worm eaten is 46. eyes-rule of worm eaten is the pre-were-meetin rule.

after printing the locale description of Worm Eaten when sco-were-meetin is true and sco-my-corps is false:
	say "[line break]You feel like your companions are just about ready to go. But you still need to say something, something that can only come uniquely inside of you, to establish what a great team you are.";
	continue the action;

check going down in Worm Eaten:
	if sco-the-file is false, say "Hmm. You still feel like you're missing some plans, some intelligence, even though you have everything else. The [raider-traitor] found it easy to get kicked out, but you need detailed plans how to get back in." instead;
	remove-swear-bonus;
	say "It's obviously going to take a while to dig or explore down, as [the raider] only remembers so much. Everyone wants to be motivated to push through when it gets tricky, of course. But they just aren't quite [i]there[r], yet. You reach into your mind and look for something apropos to say.";
	wfak;
	say "Then it comes. 'Air out a route!' And everyone does.";
	wfak;

to say raider-traitor:
	say "[if gone traitor is moot]gaunt raider[else]gone traitor[end if]";

chapter gone trader

The gone traitor is a prefollowing sentient in Worm Eaten. "[one of]Someone comes out from the depths. They introduce themselves as the gone traitor, someone who cozied up to the bad guys and ditched their friends, then ditched the bad guys. And only recently they ran away, but how can they ask for forgiveness? Surely it just doesn't happen like this? Just one small change and you have a new identity? Rubbish![or]The gone traitor continues to mope about here, looking for someone who can help convince them they're not so awful.[stopping]". description is "[if sco-gaunt-raider is true]Still pretty gaunt, but no longer with a look of despair on their face. They're ready to redeem themselves, you imagine[else]Despairing, shaking their head, barely able to look you in the eye. You dare not ask all they did. But they seem sorry for the big stuff[end if].". eyes-number of gone traitor is 56. eyes-rule of gone traitor is the pre-gaunt-raider rule.

section gaunt raider

the gaunt raider is a follower. description is "Tall and imposing. They still look disturbed by who they were.". help-chat is "The gaunt raider discusses regret for their past actions, as well as some possibilities for how to use it to boost yourself to do the right thing, or when to just drop it without being drowned by guilt.". eyes-number of gaunt raider is -1.

book Doom Ending

Doom Ending is a room in last-rooms. "[if sco-wide-vision is true]This place is much less scary now that you shared your wide vision. But now you need to put it into practice![else if sco-wipe-out is true]Well, it turns out the doom ending was for the sea skull, not for you. But you're still a bit frustrated. How do you go forward from here?[else]The gaunt raider wasn't joking around when they said they came from some place awful! You just hope your companions can help you enough here.[end if]". eyes-number of doom ending is 37. eyes-rule of doom ending is pre-do-due-mend rule.

after printing the locale description for Doom Ending when Doom Ending is unvisited:
	say "Everyone whispers some variation of 'We're stuck! Worst, UCK!' to each other. But surely there must be a way through.";
	continue the action;

chapter Sea Skull

The Sea Skull is a sentient in Doom Ending. "A sea skull [if sco-cease-cull is true]spews rivers of blood at you and your companions, but fortunately, with so many companions, the rivers aren't very deep. Still, you should do something about it[else]gloats evilly, with its back turned to you[end if].". description is "[if sco-cease-cull is true]It looks upset you've disturbed its, err, work[else]You can't see its face, which must be evil. You may need to yell something at it to get the, uh, conversation started[end if].". eyes-number of Sea Skull is 54. eyes-rule of sea skull is the pre-cease-cull rule.

chapter why division

the why division is a thing. "Why-division has settled in among your companions. Everyone's done what they can. Why should they do more? They've saved their skin, and a lot of others['], too, and they'll be safe for a while!". description is "It's not something physical. It's more a general mood. You worry you have not experienced enough to dispel it.". eyes-number of why division is -46. eyes-rule of why division is the pre-wide-vision rule.

volume you

Mike Orr is a privately-named person in Eh Raw Air Aww. the player is Mike Orr. description is "You are Mike Orr. You know that now. [if sco-my-corps is true]You're glad of your name now, after giving that pep talk[else]Kind of pedestrian, you always thought. But you hoped it might have some greater meaning[end if].". eyes-number of mike orr is 23. eyes-rule of Mike Orr is pre-an-aim rule.

understand "mike orr" and "mike/orr" as Mike Orr when sco-an-aim is true.

carry out examining Mike Orr when sco-an-aim is false:
	say "You think you have a name. Most people do, if you remember things correctly. For better or worse, you can't be special.[paragraph break]You'd really like to have a purpose, too.[paragraph break]The weird thing is, you feel the two must be inter-related in some simple way. A way that will feel dumb once you figure it out. But you haven't, yet.[paragraph break]Hmm. A name. A name. You're focused on finding [b]A NAME[r], and yet, if you just shook up this focus a bit, you might get something else. Something that could kick-start you, no matter what your name is!";
	the rule succeeds;

volume verbs

understand the command "sit" as something new.

book exiting

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

chapter abouting

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

carry out creditsing:
	say "Thanks to Michael Baltes, Clem Bing-Storrs, Wade Clarke (who also tested post-release,) Hanon Ondricek, P. B. Parjeter, Fred Snyder, and Daniel Stelzer for testing. They found stuff I just didn't have the time to find, or stuff I convinced myself I'd checked, honest I did, or even broke down cases for stuff where I was muddled and not sure how to test stuff. Oh and they inspired several ideas, too. It's always hard to ask someone for their time and energy, but I appreciate it so much![paragraph break]Michael, Fred and Daniel had IFComp [']24 entries as well, and I always appreciate being able to trade testing with a fellow competitor, so it doesn't feel cutthroat.";
	say "[line break]B. J. Best and Arthur DiBianca (he is also in IFComp [']24,) who've written a lot of good stuff, both found bugs within two hours of IFComp starting. So thanks to them!";
	say "[line break]Viv Dunstan, yet another fellow IFComp [']24 author, found some nontrivial bugs I fixed mid-comp and suggested a more granular approach to [b]THINK[r], implemented post-comp.";
	say "[line break]DemonApologist, who wrote reviews for all IFComp [']24[']s entries, and Wolfbiter, who also ran the gauntlet, found nontrivial bugs, too.";
	say "[line break]Tabitha found several bugs in post-comp versions which were a great catalyst for putting releases out quickly.";
	say "[line break]The cover art is my fault, and my fault alone.";
	say "[line break]Thanks also to David Welbourn for writing a walkthrough during IFComp. He has a Patreon account at patreon.com/dswxyz. Support it if you can!";
	say "[line break][b]GENERAL THANKS[r]:[paragraph break]";
	say "Thanks to everyone past and future involved in the administration of IFComp.";
	say "Thanks to the I7 board on Intfiction.org for their help, as well as the people in the general topics as we discussed our plans.";
	the rule succeeds;

chapter hinting

report hinting:
	say "[if slice eyes are off-stage]After two puzzles in this first room, there will be a hint item that gives clues what to do or think next[one of]. You will get a clue if you [b]HINT[r] again[or]. Try using your senses for a clue[stopping][else if player has slice eyes]You can [b]EYE[r] things with [the slice eyes], or just [b]EYE[r] the whole room[else]You dropped [the eyes], which were the main hint item. You'll have to restart to bring them back again[end if].";
	continue the action;

chapter verbsing

carry out verbsing:
	say "[this-game] bypasses many of the standard Inform parser verbs, since it is word-puzzle based. Things are taken implicitly, and you don't need to drop anything.";
	say "[line break]The four standard directions ([b]NORTH[r], [b]SOUTH[r], [b]EAST[r] and [b]WEST[r]) work, and some passages lead [b]IN[r], [b]OUT[r], [b]UP[r], and [b]DOWN[r], too.";
	say "[line break]In addition, there are NPCs you may wish to [b]TALK TO[r], which can be shortened to [b]T[r].";
	say "[line break][b]THINK[r] will remind you of things you found, but the time wasn't right.";
	say "[line break]Finally, [b]ABOUT[r] gives basic information about [this-game] and also cues some other meta-commands.";
	if current-score < 3:
		say "[line break]Most point-scoring commands will consist of two words.";
	the rule succeeds;

report verbsing when gs-note-chatopt is true:
	say "To control random follower chat, you can type [b]SCORE CHAT[r] to turn it on or [b]SCORCH AT[r] to turn it off.";
	continue the action;

report verbsing when can-lump-party:
	say "[b]UH PARTY[r] or [b]A PARTY[r] will describe your party as one unit (use [b]I[r] to see who is there,) and [b]APART EE[r] (2-4 e's) will show them individually.";
	continue the action;

chapter versioning

carry out versioning:
	say "Pretty much every version has trivial flavor tweaks added, so I'm just listing the big things.";
	say "[line break]Version 1 was released to IFComp on August 28, 2024.";
	say "[line break]Version 2 was released on October 18, 2024. It rolls up many fixes made during IFComp but also includes a hint device and [b]UNDO[r] protection for using the pawn to advance through a puzzle. For version 1, I'd had a great idea for a hint device. The only thing not-great was the timing: six hours before the comp deadline!";
	say "[line break]Version 3 was released on October 22, 2024. It includes one more point in the optional room, as well as a big boss there, of sorts. There are some trivial fixes, too.";
	say "[line break]Version 4 was released on November 9, 2024. It features game-mechanic-relevant dialogue between friendly NPCs, as well as general text flavor tweaks.";
	say "[line break]Version 5 was released on November 12, 2024. It contains more granular hints about what you got right, e.g. one word right, both words right, or either very close.";
	say "[line break]Version 6 will be release on November xx, 2024. It adds a point in the optional area, allows for a bypass, and allows COMPANIONS as a noun. It fixes trivial but persistent line break issues too.";
	say "[line break]For details on fixes, see fixes.txt, which should be packaged with the binary. Or visit the GitHub site https://github.com/andrewschultz/why-pout, which may provide a view of bugs to be fixed for potential future releases. Although as of release 6, I don't want this project to drag on, fun as it's been. There are other games to write!";
	the rule succeeds;

[the text below is added to Versioning and Extensions Tweak]

report exting:
	unless can-show-spoilers, say "One extension has been temporarily removed from the list, as it may cause a spoiler. If you wish to see it, come back after you've scored two points.";
	continue the action;

to decide whether can-show-spoilers:
	if current-score < 2, no;
	yes;

chapter xyzzying

carry out xyzzying:
	say "You hear a[one of][or]nother[stopping] size-Z 'X! Why's [']e...'";
	say "[one of][line break]No, I don't know whether size Z is super-big or super-small.[or][stopping]";
	the rule succeeds;

book options

to lump-party (ts - a truth state):
	say "Your party is [if ts is opt-lump-party]already[else]now[end if] [if ts is true]lumped together[else]listed separately[end if] in room descriptions[if block-followers is true], or they will be, once you rejoin them[end if].";
	now opt-lump-party is ts;

to toggle-chat (ts - a truth state):
	say "Your party is [if ts is opt-chat-on]already[else]now[end if] [if ts is true]chatting away randomly[else]keeping quiet[end if] every turn.";
	now opt-chat-on is ts;

the companions are a plural-named sentient. description is "You see [the list of friendly followers].".

understand "companion/comps/comp/com/coms" as companions.

chapter lumponing

lumponing is an action out of world.

understand the command "uh/a party" as something new.

understand "uh party" and "a party" as lumponing when can-lump-party.

carry out lumponing:
	lump-party true;
	say "[line break][b]T[r] to talk will list whom to talk to[one of].[paragraph break]You can also refer to them with [b]COMPANIONS[r] or even [b]COMPS[r] or [b]COMP[r] or [b]COM[r], though you can't do much more than examine them[or][stopping].";
	now player has companions;

chapter lumpoffing

lumpoffing is an action out of world.

understand the command "apart ee/eee/eeee" as something new.

understand "apart ee" and "apart eee" and "apart eeee" as lumpoffing when can-lump-party.

carry out lumpoffing:
	lump-party false;
	if player has companions, moot companions;

chapter scorechating

chatoning is an action out of world.

understand the command "score chat" as something new.

understand "score chat" as chatoning.

carry out chatoning:
	say "You give the thumbs-up to word-raining ... [paragraph break]";
	toggle-chat true;
	the rule succeeds;

chapter scorchating

chatoffing is an action out of world.

understand the command "scorch at" as something new.

understand "scorch at" as chatoffing.

carry out chatoffing:
	say "You indicate 'we're draining' at chatter ...[paragraph break]";
	toggle-chat false;
	the rule succeeds;

book regular verbs, modified

chapter attacking extra stuff

[the main rule is in Oronym Core]

check attacking a follower:
	if noun is not friendly, say "But you want [the noun] on your side eventually, so, no." instead;
	if player is in doom ending, say "A soul dark-sold arc now? Why, you should be exiled to the grim thug rim." instead;
	if noun is mice, say "Even if they weren't friendly, you'd think 'My! Stuff mice? Tough...'" instead;
	say "You lack the resolve, thankfully, for me-now-mean-OW nonsense." instead;

check  attacking:
	if noun is skull, say "Conventional attacks aren't the way to go. You need a rallying cry[if sco-cease-cull is false] or two[end if]." instead;

report attacking: say "You aren't built for that[if pals-made > 0], but maybe you can lead companions to a big victory[end if]." instead;

chapter eating

[redefining Inform's eat, which implicitly takes in 6G. Since we can't actually eat/consume, we can just use a dummy verb.]

rule for supplying a missing noun when noteating:
	if player has tall cake:
		now noun is tall cake;
		continue the action;
	say "You need to say what to [b]EAT[r], though [b]EAT[r] is not necessary to win.";
	the rule fails;

check noteating (this is the modified eating rule):
	if noun is cell phones or noun is prize talk, say "The talk itself gives you indigestion." instead;
	if noun is stalk, say "That stalk is your way out of here." instead;
	if noun is tar, say "Too much to eat, even if it were edible." instead;
	if noun is mold, say "Yes, mold is one of many things you should never eat." instead;
	if noun is manic herb, say "Too risky, but perhaps it hides some more pleasant food or ingredients." instead;
	if noun is tall cake, say "You can't eat the cake by yourself! Make it a communal experience in a special place!" instead;
	if noun is manna, say "The manna is raw material for more standard food." instead;
	if noun is squid, say "[if flier-isle-score is 0]The squid is more likely to eat you, given your relative sizes.[else]You can't ever eat calamari again, now the squid helped you![end if]" instead;
	if noun is merchant or noun is liar, say "No, just prevent [the noun] eating you up in conversation." instead;
	if noun is a friendly follower, say "You realize asking if you can nibble would give an answer of no." instead;
	if noun is an unfriendly follower or noun is a prefollowing sentient, say "Better ways to assimilate [the noun]." instead;
	if noun is grinch earls, say "They'd be, uh, tasteless." instead;
	if noun is skull, say "'Dine? Ow! Die now!' you think." instead;
	if noun is lode ore, say "[if sco-low-door is true]This wouldn't have worked even before the mice found a passage[else]Too much to eat through, even if you could[end if]." instead;
	if noun is a sentient, say "You can't eat your way through dealing with [the noun]." instead;
	say "[if sco-treat-all is true]You already ate the only thing you needed to[else]If you need to eat anything, it requires a slightly different approach[end if]." instead;

chapter inventory

after printing the name of flier when taking inventory:
	if flier is unexamined, continue the action;
	say " (";
	let slash be false;
	if sco-grow-vial is false:
		say "grove isle";
		now slash is true;
	if sco-the-file is false:
		say "[if slash is true] / [end if]thief isle";
		now slash is true;
	if sco-war-file is false:
		say "[if slash is true] / [end if]wharf isle";
		now slash is true;
	say " still to visit)";
	continue the action;

check taking inventory:
	if sco-wipe-out is true, continue the action;
	say "There's that occasional voice ringing in your head asking 'Why pout?' ";
	if NaffHaze is unvisited:
		say "But besides that ...";
	else if number of friendly followers is 0:
		say "Well, you're feeling a bit alone, but there's always the prospect of finding stuff...";
	else if number of friendly followers is 1:
		say "It's a bit harder to than before, because you have a companion now, [the random friendly follower].";
	else:
		say "Well, it's gotten very hard to pout, with [if number of friendly followers is 2]two[else]multiple[end if] companions.";

the get rid of ache standard inventory rule is listed instead of the print standard inventory rule in the carry out taking inventory rulebook.

Carry out taking inventory (this is the get rid of ache standard inventory rule):
	now all things carried by player are marked for listing;
	now companions are not marked for listing;
	now talk ache is not marked for listing;
	now all hintthings are not marked for listing;
	say "[if sco-high-plain is true]'Good! Some goods, umm...':[else]You are carrying:[end if][line break]";
	list the contents of the player, with newlines, indented, including contents, listing marked items only,
		giving inventory information, with extra indentation;
	if number of carried hintthings > 0:
		say "[line break]You are also carrying [if number of carried hintthings is 1]something[else]some things[end if] that may help your quest in general: [a list of carried hintthings].";

report taking inventory when sco-six-quid is true and current-quid > 0:
	say "You [if current-quid < 6]still [end if]have [current-quid in words] quid [if current-quid < 6]left [end if]from helping the sick squid.";
	continue the action;

report taking inventory when sco-my-corps is false and sco-an-aim is true:
	say "[if sco-nah-phase is true]Also, you almost forgot you forgot your name, Mike Orr, at first[else]You have a name, too, now, you remember: Mike Orr[end if]. [if pre-my-corps rule is not guessed-yet]Maybe you will find something special about it some day[else]Perhaps you will prove your leadership, [corps-note][end if].";
	continue the action;

to say corps-note:
	if number of friendly followers is 0:
		say "but you have nobody to lead";
	else if number of friendly followers is 1:
		say "but leading only one companion isn't a corps per se";
	else if number of friendly followers is 2:
		say "and you're starting to get a following";
	else if number of still-follow-needed followers > 0:
		say "though you feel you could find a bit more support";
	else:
		say "inspiring your followers at the right time"

report taking inventory when player has talk ache:
	say "Oh, man. You still have that talk-ache, too.";
	continue the action;

report taking inventory when gs-got-weapons is true and sco-wipe-out is false:
	say "You and your party are also armed for any conflict that may arise.";
	continue the action;

report taking inventory when opt-lump-party is true:
	say "So far, you have gained the support of [number of friendly followers in words] friends[if mice tall are friendly] (counting the mice as an aggregate)[end if]: [the list of friendly followers].";
	continue the action;

chapter singing

check singing (this is the WP check singing rule):
	if player is in brew swears, say "You conjure some funk rap, inspired by the specific environs. It's not a totally tasteless new ditty." instead;

chapter listening

check listening (this is the WP specific listening rule):
	if player is in air aww, say "Air, or ... a roar?!" instead;
	if player is in hype lane:
		say "You hear no thud in the din.[paragraph break]";
		if prize talk is in hype lane:
			say "Hard not to hear the prize talk, though.";
			try examining prize talk;
		else if cell phones are in hype lane:
			say "Hard not to hear the cell phones, though.";
			try examining cell phones;
		else:
			say "Probably just time to get out.";
		the rule fails;

report listening when gs-default-listen-yet is false:
	say "You've figured enough out by now. You can laugh back at this laughing-villain act.";
	now gs-default-listen-yet is true;
	continue the action;

chapter swearing reports

report swearing obscenely in brew swears:
	say "But, well, yes. You're in the right place for that.";
	continue the action;

report swearing obscenely when brew swears is visited and player is not in brew swears:
	say "Haven't you had enough of that in Brew Swears?";
	continue the action;

report swearing obscenely when bruise wares is touchable:
	say "[wares] seems to call you a bit extra after that outburst.";
	continue the action;

report swearing obscenely when bruise wares is not moot and sco-brew-swears is false:
	say "[one of]There's actually an area for that[or]You still haven't found the area for that[stopping].";
	continue the action;

report swearing obscenely when bruise wares is moot and sco-brew-swears is false:
	say "Alas, you missed your chance to gain points saying that sort of thing.";
	continue the action;

chapter t talking

rule for supplying a missing noun when ting:
	if talk-default-to-player:
		now noun is the player;
		continue the action;
	if number of followers in location of player is 1:
		now noun is random follower in location of player;
		continue the action;
	if number of friendly followers in location of player is 1:
		now noun is random friendly follower in location of player;
		continue the action;
	if number of followers in location of player > 1:
		if up-for-chat is 0 and orc is in location of player and orc is unchatted:
			say "The orc looks left out a bit...";
			now noun is the orc;
			continue the action;
		if up-for-chat is 1:
			let X be random still-chat-needed follower in location of player;
			say "You realize you've talked with everyone but [the x], who may feel a bit left out. So...";
			now noun is X;
			continue the action;
		say "That's ambiguous--more than one friend you can chat with.";
		if up-for-chat is 1:
			say "[line break]However, since you have talked to everyone except [the list of still-chat-needed followers in location of player], you decide to break the ice.";
			now noun is random sentient in location of player;
			continue the action;
		if up-for-chat > 0:
			say "[line break]However, you still haven't talked with [the list of still-chat-needed followers in location of player].";
		else:
			say "[line break]You've talked to everyone here, though, so you don't need to talk to them again.";
		the rule fails;
	if number of sentients in location of player is 1:
		now noun is random sentient in location of player;
		continue the action;
	say "Nobody here to talk to.";
	the rule fails;

check ting:
	if player has talk ache:
		if noun is orc and orc is unchatted, continue the action;
		say "That talk-ache is a bit of a nuisance. You've probably got the information you need from your friends." instead;
	if player is in doom ending:
		if sco-wide-vision is true, say "You've already shared your vision. Now's the time to put it into action." instead;
		if sco-wipe-out is true, say "[if pre-wide-vision rule is guessed-yet]The why-division is too much to sort things out[else]The only thing left to do is dispel the why-division, if you can[end if]." instead;
		if noun is a follower, say "Now's not the time for chat." instead;

check ting a follower:
	if noun is not friendly:
		if noun is orc, say "You'll have to win the argument with [the grinch] before any meaningful conversations." instead;
		say "You haven't gained [the noun]'s trust enough yet for a chat." instead;

carry out ting a sentient:
	if noun is skull, say "You doubt the skull would have anything to say beyond 'I'm all I MAUL!' or 'Help our hell-power!' or even 'WAKE, rule way cruel!'" instead;
	if noun is oaf liar, say "The oaf liar is talking over you. Perhaps you can shut them up by buying something really cheap." instead;
	if noun is companions, say "You can only talk to one companion at a time with [b]T[r], [if sco-my-corps is false]though you will need to give a big speech with a special command later[else]and you've already given your big speech[end if]." instead;
	if noun is merchant, say "You want to figure a way to kill conversation, [if sco-summer-chant is true]even if your summer chant made it more bearable[else]instead[end if]." instead;
	if noun is Gawain Kerr, say "You don't need him to riff on your name. But maybe you can riff on his." instead;
	if noun is booze troll, say "The booze troll doesn't seem interested in useful conversation, at least not in their present form." instead;
	if noun is squid, say "[if sco-six-quid is false]It seems to be choking a bit, but on what?[else]The squid can't speak, but you get very good vibes from it. It will understand where to go when you have a way to show it where to go.[end if]" instead;
	if noun is traitor, say "[The traitor] mumbles apologetically for who they were. Perhaps you can show [the traitor] a small shift to change them." instead;
	if noun is grinch earls, say "[if sco-grin-churls is true][The earls] feel beaten down by your renaming. Okay, maybe you'd get schadenfreude from a whiny 'Mean? Oh, me? No!'[else]You can't imagine any chat with them would be pleasant. 'Help our hell-power?!'[end if][paragraph break]Staunch, specific verbal defense is the way to get rid of them, here." instead;
	if noun is cell phones, say "No, you don't want to get swept up in that." instead;
	if noun is prize talk, say "You [if sco-pry-stalk is true]got[else]want[end if] something better than good chat." instead;
	say "Awkward silence, which is my fault. I'd like to change that, so do report a bug on GitHub." instead;

carry out ting (this is the first t rule):
	if noun is the player:
		if sco-an-aim is false:
			say "Self-talk is the way, but you need something positive and specific. All you can muster is 'I molder. I'm older.' You sort of wish for purpose, or something like it." instead;
		if player is in Eh Raw Air Aww, say "You had enough positive self-talk. Now to find a way out!" instead;
		if being-policed, say "You're too self-conscious for self-talk, being policed and all." instead;
		say "You motivate yourself with 'Goal: earn? Go learn!'" instead;
	if noun is not a follower, say "You don't get a response." instead;
	if sco-my-corps is true, say "Motivational talk is through. Time to end this thing." instead;
	if sco-treat-all is true, say "You've talked all you needed, one-on-one. Time to bring the gang together for a big lecture." instead;
	if sco-tall-cake is true, say "Time to eat, not talk." instead;
	if number of still-chat-needed followers is 0:
		if noun is unchatted:
			say "Sure, why not chat a bit more?";
		else:
			say "You've talked to everyone you needed to, but why not reach at re-chat?";

carry out ting:
	say "You chat with [the noun] a bit, [if noun is chatted]recapping[else]learning[end if] more about the history of the area you're exploring and why you're here.";
	say "[line break][help-chat of noun]";
	if noun is unchatted:
		if noun is orc::
			say "[paragraph break]You're impressed. You'd not have had that much to say, at the orc's age.";
		else:
			say "[paragraph break][entry (useful-chats + 1) in dialogue-list][line break]";
	the rule succeeds;

the t-only note rule is listed last in the report ting rulebook.

report ting when gs-t-without-note is false (this is the t-only note rule):
	now gs-t-without-note is true;
	say "[i][bracket]NOTE[r][i]: without an argument for [b]T[r][i], [this-game-noi] will try to guess whom you talk to. It prioritizes friendly NPCs, especially ones you haven't talked to before, but if there is more than one, it will ask you to be more specific.[close bracket][r][line break]";
	continue the action;

report ting a follower:
	if noun is chatted:
		if talk ache is moot, continue the action;
		if number of still-chat-needed followers is 0:
			say "[line break]Ouch! Still got that talk-ache.";
			continue the action;
		say "[line break]That was a nice refresher, though ";
		if number of unchatted followers in location of player > 0:
			let RF be random unchatted follower in location of player;
			say "[the RF] seem[if rf is not plural-named]s[end if] to want to cut in a bit for their turn some time.";
		else:
			say "it didn't reveal anything new.";
		if gs-t-special-note is false:
			say "[line break][i][bracket][b]NOTE:[r][i] if you want to see whom you haven't talked to yet, [b]T[r][i] by itself will do the trick. If there's only one companion you haven't talked to, you will talk to them[close bracket][r][line break]";
			now gs-t-special-note is true;
	else:
		now noun is chatted;
		if number of still-chat-needed followers is 0 and talk ache is off-stage:
			say "[line break]That was a lot of talking. After all that time alone in the Tomb Apse, you feel a bit of social burnout. You develop a talk-ache.";
			now player has talk ache;
	continue the action;

chapter talk ache

the talk ache is a thing. description is "Not really annoying, but the sort of small nuisance that makes you feel a need to do something.". printed name is "talk-ache". eyes-number of talk ache is 44. eyes-rule of talk ache is the pre-tall-cake rule.

section tall cake

the tall cake is a thing. description is "Wonderful. Can probably serve six or so. But you need to find the right place.". eyes-number of tall cake is -1.

book taking

check taking (this is the WP specific take rejects rule):
	if noun is row gold, say "That's greedy." instead;
	if noun is tree small or noun is tree tall, say "Don't undo your beautifying!" instead;

book touching

understand "feel" as touching.

rule for supplying a missing noun when touching: now the noun is the player.

report touching when current-score is 0:
	say "Maybe it's not a cue to weep, though, but ... something else.";
	the rule succeeds;

book waiting

check waiting when number of friendly followers > 0: say "You wait, aware too much 'we're staying' would prompt 'worst, eh'-ing." instead;

book wearing

the can't wear what's not clothing rule is not listed in any rulebook.

check wearing:
	if noun is frock, say "Too small for you." instead;
	say "Anything you come across that you need to wear will be worn automatically." instead;

volume cheating

chapter warponing

to check-run-rules:
	if run-rule entry is post-do-due-mend rule, decrement cur-max-bonus;

section debug testing

report warponing: follow the check inventory change rule;

volume parser errors

book general

the WP pardon begging rule is listed before the Oronym pardon begging rule in the for printing a parser error rulebook.

rule for printing a parser error when the latest parser error is the I beg your pardon error (this is the WP pardon begging rule):
	if core-score < 2:
		say "'Hum, blank,' you muse. No humble ankh pops into your hands, sadly.";
		the rule succeeds;
	continue the action;

book specific

rule for printing a parser error when player is in Eh Raw Air Aww and sco-an-aim is true:
	if the player's command includes "tomb" or the player's command includes "apse":
		say "You can do something with the location name, but not either word directly. Think of what you did before: getting [b]AN AIM[r] on remembering [b]A NAME[r].";
		the rule succeeds;
	continue the action;

rule for printing a parser error when player is in Eh Raw Air Aww and sco-an-aim is false:
	if the player's command includes "eh" or the player's command includes "raw" or the player's command includes "aww" or the player's command includes "air":
		say "You can't do much with the location name, as you can't see it, and it's a bit general. But maybe you can look at yourself [if mike orr is examined]again [end if]to discover something you have or need.";
		the rule succeeds;
	continue the action;

rule for printing a parser error when player is in brew swears and weird-icks are in brew swears:
	if the player's command includes "dick":
		say "Alas, there is more than one of [the earls].";
		the rule succeeds;
	continue the action;

rule for printing a parser error when has-quid:
	if the player's command includes "quid":
		say "While you have the quid, you don't need to inspect it, or whatever. You'll make transactions when necessary.";
		the rule succeeds;
	continue the action;

rule for printing a parser error when can-lump-party and player does not have companions:
	if the player's command includes "companion" or the player's command includes "companions":
		say "There's no need to refer to your companions as a group, though you can lump them together with [b]COMPS[r].";
		the rule succeeds;
	continue the action;

volume appearance

to decide whether need-mouse-plural-warn:
	if opt-lump-party is false, no;
	if gs-mouse-plural-party-note is true, no;
	if mice tall are not friendly, no;
	yes;

to say mouse-check:
	if need-mouse-plural-warn:
		say ". Just to check, I'm counting the mice as one unit, here";
		now gs-mouse-plural-party-note is true;

for printing a locale paragraph about a follower (called fo):
	if fo is not friendly, continue the action;
	if fo is mentioned, continue the action;
	say "[if opt-lump-party is true]Your [(number of friendly followers in location of player) in words] companions[else][The list of friendly followers in location of player][end if] wait[if not say-plural-stationary-followers]s[end if] here for what to do or where to go next[mouse-check].";
	now all friendly followers are mentioned;

volume scores

report requesting the score:
	if pre-acts > -1, say "You also performed [pre-acts] of [pre-max] actions ahead of time." ;
	continue the action;

volume endgame

table of final question options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see points [b]MISSED[r]" 	true	"missed"	endgame recap missed points rule	--

this is the endgame recap missed points rule:
	if brew swears is unvisited:
		say "All but one bonus point is found in Bruise Wares.";
	nope-check;

volume painful parser stuff

after reading a command:
	if player is in brew swears and bah-sturdy is in brew swears:
		if the player's command matches "bastardy":
			change the text of the player's command to "bastard eee";
