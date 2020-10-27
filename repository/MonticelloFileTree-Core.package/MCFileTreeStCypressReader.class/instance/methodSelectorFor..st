utilities
methodSelectorFor: source
	| rbParserClass |
	rbParserClass := System myUserProfile objectNamed: 'RBParser'.
	^ (rbParserClass notNil
		and: [ 
			"use respondsTo: because during some upgrades, the class exists without any methods installed"
			rbParserClass respondsTo: #'parseMethodPattern:' ])
		ifTrue: [ 
			"fix for https://github.com/dalehenrich/filetree/issues/231"
			"use #perform:with: to avoid SBNI test errors when RBParser package is not installed"
			rbParserClass perform: #'parseMethodPattern:' with: source ]
		ifFalse: [ 
			"needed until RBParser is installed or or during upgrade"
			ChangeList parseSelector: source ]