accessing
loadAncestry
	"Load the ancestry chain to be able to scan it properly."

	| s ancestry stack |
	ancestry := nil.
	stack := OrderedCollection new.
	s := self gitVersions.
	(s match: 'commit ')
		ifFalse: [ self error: 'Unable to find git data in input' ].
	[ s atEnd ]
		whileFalse: [ 
			| a |
			a := (s upToAll: 'commit') substrings collect: [ :e | ByteArray readHexFrom: e trimBoth ].
			ancestry isNil
				ifTrue: [ 
					ancestry := GitFileTreeCommit at: a first put: a allButFirst.
					stack addAll: ancestry parents ]
				ifFalse: [ 
					| t |
					t := stack detect: [ :e | e id = a first ].
					stack remove: t.
					t parents: a allButFirst.
					stack addAll: t parents ] ].
	^ ancestry