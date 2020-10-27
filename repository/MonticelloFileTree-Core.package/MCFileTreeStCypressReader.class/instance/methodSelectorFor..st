utilities
methodSelectorFor: source
	^ (System myUserProfile objectNamed: 'RBParser')
		ifNotNil: [:rbParserClass | 
			"fix for https://github.com/dalehenrich/filetree/issues/231"
			rbParserClass parseMethodPattern: source ]
		ifNil: [ 
			"needed until RBParser is installed"
			ChangeList parseSelector: source ]
