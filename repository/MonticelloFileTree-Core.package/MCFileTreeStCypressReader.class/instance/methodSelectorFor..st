utilities
methodSelectorFor: source
	^ (System myUserProfile objectNamed: 'RBParser')
		ifNotNil: [ :rbParserClass | 
			"fix for https://github.com/dalehenrich/filetree/issues/231"
			"use #perform:with: to avoid SBNI test errors when RBParser package is not installed"
			rbParserClass perform: #'parseMethodPattern:' with: source ]
		ifNil: [ 
			"needed until RBParser is installed"
			ChangeList parseSelector: source ]