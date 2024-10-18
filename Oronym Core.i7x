Version 1/241009 of Oronym Core by Andrew Schultz begins here.

"The Oronym Core file, which calls the spoonerism/oronym core file but also has specific oronym-related stuff."

volume includes

use authorial modesty.

include Spoonerism and Oronym Core by Andrew Schultz.

include Revealing Passages by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

volume things

a sentient is a kind of thing.

volume talking

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

volume right hand status line and scores (could be moved to universal file)

when play begins (this is the score and status tweak rule):
	now the right hand status line is "[current-score][if doable-hinted > 0](+[doable-hinted])[end if]/[min-needed][if score is min-needed or max-bonus is 0][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	now the turn count is 1;

to decide which number is doable-hinted:
	let temp be 0;
	repeat through table of main oronyms:
		if think-cue entry is true and idid entry is false and core entry is true, increment temp;
	decide on temp;

volume meta verbs

book meta stuff

check quitting the game:
	say "A voice taunts you 'What? Changing your name to Ike Witt?'";

check restarting the game:
	say "A voice cackles 'Done, ooh? Duh, new!'";

check saving the game:
	say "A voice taunts 'Save?! I'll say, VILE!'";

volume meta rooms

Reap Rest is a room. moot-room is Reap Rest. "You should never get here."

Oronym Core ends here.

---- DOCUMENTATION ----
