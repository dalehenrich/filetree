accessing
loadAncestry
	"Load the ancestry chain to be able to scan it properly."

	| s dict |
	s := self gitVersions.
	dict := Dictionary new.
	(s match: 'commit ')
		ifFalse: [ self error: 'Unable to find git data in input' ].
	[ s atEnd ]
		whileFalse: [ 
			| a |
			a := (s upToAll: 'commit') substrings collect: [ :e | ByteArray readHexFrom: e trimBoth ].
			dict at: a first put: a allButFirst ].
	^ dict