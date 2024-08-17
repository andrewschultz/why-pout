"Why Pout" by Mick Stupp

volume includes

section general

include Trivial Niceties by Andrew Schultz.

include Punctuation Stripper by Andrew Schultz.

section semi-general

include Spoonerism and Oronym Core by Andrew Schultz.

section game-specific

include Why Pout Tables by Andrew Schultz.

include Why Pout Definitions by Andrew Schultz.

include Why Pout Globals by Andrew Schultz.

section not for release

include Why Pout Tests by Andrew Schultz.

chapter may be changed

to game-specific-cleanup: do nothing;

chapter move to global

when play begins:
	say "'Find a fine day' echoes in your head."

universal is a region.

to up-min: do nothing;

core-score is a number that varies.

to decide which region is mrlp: decide on map region of location of player.
cur-bonus is a number that varies.

a region has a number called curregscore.

volume you

Mike Orr is a privately-named person. the player is Mike Orr.

understand "mike orr" and "mike/orr" as Mike Orr when sco-an-aim is true.

check examining Mike Orr when sco-an-aim is false:
	say "You think you have a name. You're not sure.[paragraph break]You'd really like to have a purpose, too.[paragraph break]The weird thing is, you feel the two must be inter-related in some simple way. A way that will feel dumb once you figure it out. But you haven't, yet.[paragraph break]Hmm. A name. A name." instead;

section temporary code to test remembering oneself

understand the command "wipe" as something new.

the block thinking rule is not listed in any rulebook.

check thinking:
	say "Put good-guess notes here.";

volume verbs

check taking:
	say "You don't need to take anything in [this-game]. Everything you need will be taken implicitly." instead;

volume rooms

book Eh Raw Air Aww

Eh Raw Air Aww is a room in universal. printed name is "[if sco-an-aim is false]Eh, Raw Air, Aww[else]Tomb Apse[end if]". description is "[if sco-an-aim is false]The air chokes you a bit. It's too thick to see far beyond yourself. You barely know who you are, even. Ugh.[else]It's a bit clearer now. You still seem trapped. But there must be secrets hidden, and maybe one or more can get you out of here.[pole-east-stuff][end if]"

to say pole-east-stuff:
	if sco-pole-east is false, say "[run paragraph on]You feel policed here. Where's this feeling coming from?"

book Hype Lane

Hype Lane is a room in universal. "You feel you must be pretty far underground. People chatter all around about the adventure you find here."

chapter prize talk

prize talk is a thing in hype lane. "Prize talk reverberates all about ... about treasure, fame, and so forth.". description is "The prize talk also discusses things that aren't so worth it, like -- well, plants and stuff. BORING."

chapter Naff Haze

NaffHaze is a privately-named room in universal. "[if sco-nah-phase is false]A naff haze surrounds you. It's naff because you can't go anywhere, and it also just makes you feel naff, and it seems so universal, like there's no escaping from it.[else]Things have opened up a bit now, with the naff haze lifted.[end if]". printed name is "[if sco-nah-phase is false]Naff Haze[else]High Plain[end if]".

the naff haze is scenery in NaffHaze. "You can't look very far though it. Just looking at it makes you feel hopeless you'll always be trapped in the fog."

check going a viable direction in NaffHaze when sco-pole-east is false:
	say "You'd like to, but you feel, well, policed." instead;

chapter short rail

the short rail is a thing. "A short rail leads -- well, not very far. You get the sense it should lead somewhere more.". description is "It's just ... not aligned right. Maybe if it were, it could lead somewhere, or make sense of this place, here.".

section shore trail

the shore trail is a thing. "The shore trail you discovered leads south.". description is "There are no secret passages hidden in it."

chapter gross tar

the gross tar is a thing. "Gross tar blocks the way north into darkness.". description is "Maybe there's a way through, but it's a bit too dark now. At least it's not foggy any more."

book NorthRoom

NorthRoom is a room in universal. "You can go back south. You feel high doubt here you can go anywhere else."

book Lobe End

Lobe End is a room in universal. "[if sco-low-bend is false]This lobe of land appears to end in all directions. Maybe you could look for something that might be a hill, even a steep one.[else]The low bend (former lobe end) now bends south.[end if]"

book Storm Isle

Storm Isle is a room in universal. "[if sco-store-mile is true]Well, you're in a sort of shopping mall now[else]On this storm isle, it's always rainy. It'd be nice to have some shelter inside.[end if]"

chapter my stall

My Stall is a thing.

section mice tall

the mice tall are a plural-named friendly followers. printed name is "mice (tall)". description is "Well, they're tall for mice. But they make up enough numbers to be pretty effective in a skirmish, if need be.".

book no notion

NoNotion is a room in universal. "[if sco-known-ocean is false]You simply have no notion what lies beyond here[else]It looks like there is an ocean, or some large body of water, and maybe some islands in the distance. They are too far to swim to[end if]. You can go back north to where you started.". printed name of nonotion is "[if sco-known-ocean is false]No Notion[else]Known Ocean[end if]".

chapter sick squid

the sick squid is a thing. "A [if sco-six-quid is true]formerly (thanks to you) [end if]sick squid trundles about in the water here.". description is "[if sco-six-quid is false]It seems like it's half choking on something, not enough to strangle it, but enough to make it really uncomfortable[else]It looks back at you. Squids don't smile, but if it could, it would[end if]."

section six quid

there is a thing called six quid. description is "Well, it's money, and a good deal of it."

book we loan

We Loan is a room in universal. "You wonder if there is actually anyone here. It feels more sinister than it should."

volume endgame

book Worm Eaten

Worm Eaten is a room in universal. printed name is "[if sco-were-meetin is false]Worm-Eaten[else]We're Meetin[']![end if]". "[if sco-were-meetin is false]This place seems very run-down. But it'd make a nice hideout to build camaraderie if it were in better shape[else]Having had your meeting here, there's not much else to do[end if]."

book Doom End

Doom End is a room in universal. "Doom doom doom!"

chapter Sea Skull

The Sea Skull is a thing in Doom End. "A sea skull [if sco-cease-cull is true] spews rivers of blood at you and your companions, but fortunately, you have so many companions, it's only a trickle. Still, you should do something about it[else]gloats evilly, with its back turned to you[end if]."

volume unsorted

the booze troll is a follower in NoNotion. "A booze troll sulks sullenly here."

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
	now the right hand status line is "[current-score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	now the turn count is 1;

to decide which number is doable-hinted:
	decide on 0;
