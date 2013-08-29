running
tearDown

	super tearDown.
	Smalltalk removeKey: #xxMCScriptTestGlobalxx ifAbsent: [].