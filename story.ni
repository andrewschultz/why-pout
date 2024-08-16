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

universal is a region.

to up-min: do nothing;

core-score is a number that varies.

to decide which region is mrlp: decide on map region of location of player.
cur-bonus is a number that varies.

a region has a number called curregscore.

volume you

Dee Klein is a privately-named person. the player is Dee Klein.

understand "dee klein" and "dee/klein" as Dee Klein when sco-an-aim is true.

check examining Dee Klein when sco-an-aim is false:
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

Eh Raw Air Aww is a room in universal. printed name is "Eh, Raw Air, Aww".

chapter short rail

the short rail is a thing. "A short rail leads -- well, not very far. You get the sense it should lead somewhere more.". description is "It's just ... not aligned right. Maybe if it were, it could lead somewhere, or make sense of this place, here.".

section shore trail

the shore trail is a thing. "The shore trail you discovered leads south.". description is "There are no secret passages hidden in it."

chapter tomb apse

the tomb apse is a thing.

section two maps

there is a plural-named thing called two maps.

book naff haze

Naff Haze is a room in universal. "You feel like the haze is universal, and there's no escaping from it.".

book policed

Policed is a room in universal. "You feel policed, here. You can't really move. Where would you go, anyway?"

book no notion

NoNotion is a room in universal. "[if sco-known-ocean is false]You simply have no notion what lies beyond here[else]It looks like there is an ocean, or some large body of water, and maybe some islands in the distance. They are too far to swim to[end if]. You can go back north to where you started.". printed name of nonotion is "[if sco-known-ocean is false]No Notion[else]Known Ocean[end if]".

chapter sick squid

the sick squid is a thing. "A [if sco-six-quid is true]formerly (thanks to you) [end if]sick squid trundles about in the water here.". description is "[if sco-six-quid is false]It seems like it's half choking on something, not enough to strangle it, but enough to make it really uncomfortable[else]It looks back at you. Squids don't smile, but if it could, it would[end if]."

section six quid

there is a thing called six quid. description is "Well, it's money, and a good deal of it."

book we loan

We Loan is a room in universal. "You wonder if there is actually anyone here. It feels more sinister than it should."

book meat rooms

Reap Rest is a room. moot-room is Reap Rest.

volume unsorted

the booze troll is a follower in NoNotion.

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
