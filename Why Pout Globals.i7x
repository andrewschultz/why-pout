Version 1/240720 of Why Pout Globals by Andrew Schultz begins here.

"Globals file for Why Pout"

volume top level definitions, game states and specifics

a follower is a kind of thing.

section game states

current-quid is a number that varies. current-quid is 0.

block-followers is a truth state that varies.

gs-parser-error-note is a truth state that varies.

gs-examined-self is a truth state that varies.
gs-examined-flier is a truth state that varies.

gs-t-without-note is a truth state that varies.

gs-overpay-flier is a truth state that varies. [OH FLIER with >1 quid remaining]

gs-t-special-note is a truth state that varies.

gs-search-warn is a truth state that varies.

gs-swear-bonus-removed is a truth state that varies.

gs-war-pawn-try is a truth state that varies.
gs-war-pawn-used is a truth state that varies. [ugh ... would like to say "if war pawn is moot" but I de-moot it for testing]

gs-got-weapons is a truth state that varies.

gs-penalized-why-division is a truth state that varies.

gs-eye-note is a truth state that varies.

gs-mouse-plural-party-note is a truth state that varies.

gs-nah-bye-cued is a truth state that varies.

gs-default-listen-yet is a truth state that varies.

gs-top-eight-op-known is a truth state that varies.

section chat tracking

gs-full-chat-notify is a truth state that varies.
gs-note-chatopt is a truth state that varies.

missed-this-cycle is a number that varies.

section option(s)

opt-lump-party is a truth state that varies.

opt-chat-on is a truth state that varies. opt-chat-on is true.

section first point cue(s)

first-point-clue-flag is a number that varies.

counter-zero-points is a number that varies.

section cheat counters

eyes-number of Reap Rest is 1.

section only changed in debug but needed in release

undo-okayed is a truth state that varies.

section list but not quite table

wide-vision-rejects is a list of text variable. wide-vision-rejects is {
  "You come off as someone who just glided through things, knowing exactly what to do, when and where, encountering little, if any, REAL adversity. Surely, your companions muse, you'll be able to get the whole leadership thing right without them! It stings a bit.",
  "You only barely got your feet wet with tough problems. You come off as someone who is way too concerned about getting things right the first time.",
  "You mention a few detours you had, and the wisdom you allegedly gained from them, but mentioning them does feel sort of like pandering.",
  "You had some struggles beyond just 'what do do now,' sure, and said struggles were interesting, but your companions had many, many more. Your words feel inadequate.",
  "You relate how some of the time, you had to put off what you really wanted to do for something else, but you have to admit, there weren't all that many roadblocks. There could have been more. Maybe you zoomed past a few.",
  "While you often ran into situations where you felt unprepared, and there was a good deal of temporary failure along the way, you wound up seeing and feeling nothing crushing from all this delay and distraction. So you don't communicate your vision of growth all that well.",
  "You've had struggles figuring what to do, sure, but so have they, and the dialogue degenerates into who struggled more. Nothing gets done.",
  "You look back on your journey, bringing up many hurdles and barriers, mental and physical. It doesn't totally hit the mark. Your companions assure you you've inspired them to do something someday. But your store hasn't quite captured their imaginations and hearts.",
  "You're pretty good with words. (You had to be, to make it this far.) You learned what to say, and then you learned when and how. But you haven't quite learned enough to persuade your companions your leadership should carry over.",
  "You discuss your journey and its ups and downs. It seems like you have just about everyone on board. They want to put their doubts aside, but for whatever reason, they just can't quite go along with you.",
  "You make your sales pitch for more than just saving one's own skin. And it's more than a sales pitch! You try not to worry whether you have a captive audience, and you don't, until -- one small glib slip, where you were pretty sure you had to be right, but you weren't. Ouch. Your companions say there's nobody else they'd rather have lead them. Why, they look up to you almost as much as their parents! It hurts them to move on. And the issue is finely balanced. But they'll need to, with things done here. They'll take this lesson back to their villages, or wherever. Honest they will!"
}

volume follower random dialogue variables

followers-as-joined is a list of followers variable.

t1 is a number that varies. t2 is a number that varies.

init-dialogue-row is a number that varies.
second-dialogue-row is a number that varies.

volume point scoring variables

pre-max is a number that varies. [determined in DEFINITIONS so I don't have to keep processing it, since it remains constant throughout the game]

book integers

core-max is a number that varies. core-max is 45.

max-bonus is a number that varies. max-bonus is 13.

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

section optional point

sco-wide-vision is a truth state that varies.

chapter optional room

section brew swears

sco-weak-us is a truth state that varies.
sco-crew-dork is a truth state that varies.

sco-ass-low is a truth state that varies.
sco-bastard-eee is a truth state that varies.
sco-damn-peons is a truth state that varies.
sco-heckle-ass is a truth state that varies.
sco-huh-shit is a truth state that varies.
sco-lie-fuckers is a truth state that varies.
sco-were-dicks is a truth state that varies.

sco-grin-churls is a truth state that varies.

sco-gah-wanker is a truth state that varies.

sco-nab-aye is a truth state that varies.

brew-max is a number that varies. brew-max is 1. [note: it starts at 1 because later, we track the score with every point where bestroom is Brew Swears, but we need to include how to get there!]

Why Pout Globals ends here.

---- DOCUMENTATION ----
