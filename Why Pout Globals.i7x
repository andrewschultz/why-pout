Version 1/240720 of Why Pout Globals by Andrew Schultz begins here.

"Globals file for Why Pout"

volume game states and specifics

current-quid is a number that varies. current-quid is 0.

block-followers is a truth state that varies.

gs-parser-error-note is a truth state that varies.

gs-examined-self is a truth state that varies.

gs-overpay-flier is a truth state that varies. [OH FLIER with >1 quid remaining]

gs-t-special-note is a truth state that varies.

section first point cue(s)

first-point-clue-flag is a number that varies.

counter-zero-points is a number that varies.

volume point scoring variables

pre-max is a number that varies. [determined in DEFINITIONS so I don't have to keep processing it, since it remains constant throughout the game]

book integers

core-max is a number that varies. core-max is 45.

max-bonus is a number that varies. max-bonus is 9.

core-score is a number that varies.

cur-bonus is a number that varies.

last-cur-bonus is a number that varies.

last-current-score is a number that varies.

cur-max-bonus is a number that varies. [ what is achievable in the current game state? ]

to decide which number is bonus-locked-out: decide on max-bonus - cur-max-bonus;

when play begins (this is the set current max points to max points rule): now cur-max-bonus is max-bonus;

to decide which number is current-score: decide on core-score + cur-bonus;

to decide which number is min-needed: decide on core-max + cur-bonus.

to decide which number is max-available: decide on core-max + cur-max-bonus.

to decide which number is max-overall: decide on core-max + max-bonus.

book booleans

chapter start and center

section general

sco-wipe-out is a truth state that varies.

section Eh Raw Air Aww

sco-an-aim is a truth state that varies.
sco-two-maps is a truth state that varies.

section Hype Lane

sco-self-owns is a truth state that varies.
sco-pry-stalk is a truth state that varies.

sco-high-plain is a truth state that varies.

section naff haze / high plain

sco-nah-phase is a truth state that varies.

sco-grow-star is a truth state that varies.
sco-shore-trail is a truth state that varies.
sco-pole-east is a truth state that varies.
sco-key-pillar is a truth state that varies.

chapter north area

section wolf rock

sco-wool-frock is a truth state that varies.

sco-hide-out is a truth state that varies.
sco-low-door is a truth state that varies.

section we loan

sco-well-own is a truth state that varies.
sco-whee-lone is a truth state that varies.

sco-summer-chant is a truth state that varies.
sco-bile-oh is a truth state that varies.
sco-oh-flier is a truth state that varies.

section hideout

sco-boost-role is a truth state that varies.

chapter south area

section No Notion

sco-known-ocean is a truth state that varies.
sco-six-quid is a truth state that varies.

sco-the-file is a truth state that varies.
sco-war-file is a truth state that varies.
sco-grow-vial is a truth state that varies.

section wand wharf

sco-wan-dwarf is a truth state that varies.

chapter east area

section lobe end

sco-low-bend is a truth state that varies.
sco-bay-sale is a truth state that varies.

section storm isle

sco-store-mile is a truth state that varies.
sco-mice-tall is a truth state that varies.

sco-mensch-elf is a truth state that varies.

section trees mall

sco-tree-small is a truth state that varies.
sco-tall-cake is a truth state that varies.
sco-treat-all is a truth state that varies.

chapter west area

section keep iller

sco-plan-tracker is a truth state that varies.

sco-gnome-old is a truth state that varies.
sco-rogue-old is a truth state that varies.

sco-manna-curb is a truth state that varies.

sco-see-design is a truth state that varies.

section nigh fright

sco-knife-right is a truth state that varies.

section unsorted

chapter endgame

section worm eaten

sco-gaunt-raider is a truth state that varies.

sco-were-meetin is a truth state that varies.
sco-my-corps is a truth state that varies.

section doom end

sco-cease-cull is a truth state that varies.
sco-do-due-mend is a truth state that varies.

sco-brew-swears is a truth state that varies.

chapter optional

section brew swears

sco-weak-us is a truth state that varies.
sco-crew-dork is a truth state that varies.

sco-grin-churls is a truth state that varies.

sco-huh-shit is a truth state that varies.
sco-lie-fuckers is a truth state that varies.
sco-heckle-ass is a truth state that varies.
sco-bastard-eee is a truth state that varies.
sco-were-dicks is a truth state that varies.

sco-wide-vision is a truth state that varies.

Why Pout Globals ends here.

---- DOCUMENTATION ----
