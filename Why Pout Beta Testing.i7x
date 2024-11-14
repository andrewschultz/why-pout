Version 1/240824 of Why Pout Beta Testing by Andrew Schultz begins here.

"Why Pout beta testing function(s)"

chapter toending

toending is an action out of world.

understand the command "toend" as something new.

understand "toend" as toending.

carry out toending:
	if current-score >= 5, say "Sorry, you need to restart--or not have gotten to the main part--to use TOEND. If you've gotten to the Haze, it's too far." instead;
	say "Warping to penultimate room, with no way back to the surface ... with all necessary friends ...";
	moot gone traitor;
	now sco-treat-all is true;
	now sco-an-aim is true;
	now sco-plan-tracker is true;
	now sco-the-file is true;
	repeat with F running through followers:
		if F is shrewd orc, next;
		now F is friendly;
		now F is chatted;
		move F to Worm Eaten;
	move player to Worm Eaten;
	the rule succeeds;


Why Pout Beta Testing ends here.

---- DOCUMENTATION ----
