loading
loadClassCommentFromEntries: entries
	^ entries
		detect: [ :entry | entry name = 'README.md' ]
		ifFound: [ :commentEntry | commentEntry contents withSqueakLineEndings ]
		ifNone: [ '' ]