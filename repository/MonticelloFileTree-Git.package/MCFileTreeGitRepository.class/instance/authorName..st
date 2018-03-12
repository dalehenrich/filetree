accessing
authorName: aVersion
	^ (self class namesAt: aVersion info author)
		ifNotNil: [ :d | d at: #name ]
		ifNil: [ self gitAuthorName ]