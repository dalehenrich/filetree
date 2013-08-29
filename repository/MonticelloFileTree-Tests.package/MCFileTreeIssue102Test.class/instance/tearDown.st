running
tearDown

	super tearDown.
	Smalltalk removeKey: #_MC_Scriptstuff ifAbsent: [].