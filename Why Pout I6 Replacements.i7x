Version 1/240819 of Why Pout I6 Replacements by Andrew Schultz begins here.

"I6 replacements for Why Pout"

volume testing, to bypass "tree"

Include (-

[ testcommandnoun obj o2;
	switch (scope_stage) {
		1: rtrue; ! allow multiple objects
		2: objectloop (obj)
			if ((obj ofclass Object) && (obj provides KD_Count))
				PlaceInScope(obj, true);
		3: print "There seems to be no such object anywhere in the model world.^";
	}
];

{-testing-command:abstract}
	* scope=testcommandnoun 'to' scope=testcommandnoun -> XAbstract;
{-testing-command:actions}
	*                                           -> ActionsOn
	* 'on'                                      -> ActionsOn
	* 'off'                                     -> ActionsOff;
{-testing-command:gonear}
	* scope=testcommandnoun                     -> Gonear;
{-testing-command:purloin}
	* scope=testcommandnoun                     -> XPurloin;
{-testing-command:random}
	*                                           -> Predictable;
{-testing-command:relations}
	*                                           -> ShowRelations;
{-testing-command:rules}
	*                                           -> RulesOn
	* 'all'                                     -> RulesAll
	* 'on'                                      -> RulesOn
	* 'off'                                     -> RulesOff;
{-testing-command:scenes}
	*                                           -> ScenesOn
	* 'on'                                      -> ScenesOn
	* 'off'                                     -> ScenesOff;
{-testing-command:scope}
	*                                           -> Scope
	* scope=testcommandnoun                     -> Scope;
{-testing-command:showheap}
	*                                           -> ShowHeap;
{-testing-command:showme}
	*                                           -> ShowMe
	* scope=testcommandnoun                     -> ShowMe;
{-testing-command:showverb}
	* special                                   -> Showverb;
{-testing-command:test}
	*                                           -> TestScript
	* special                                   -> TestScript;
{-testing-command:trace}
	*                                           -> TraceOn
	* number                                    -> TraceLevel
	* 'on'                                      -> TraceOn
	* 'off'                                     -> TraceOff;
{-testing-command:tref}
	*                                           -> XTree
	* scope=testcommandnoun                     -> XTree;

-) instead of "Grammar" in "Tests.i6t".

Why Pout I6 Replacements ends here.

---- DOCUMENTATION ----
