accessing
namesAt: aName put: aNameString email: anEmailString
	self assert: (aNameString matchesRegex: '(:isAlphaNumeric:|[ _.])+').
	self assert: (anEmailString matchesRegex: '<.+\@.+>').
	self namesMap
		at: aName
		put:
			{(#name -> aNameString).
			(#email -> anEmailString)} asDictionary