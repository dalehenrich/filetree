accessing
authorName: aVersion
	^ (self class namesAt: aVersion info author)
		ifNil: [ self gitAuthorName ]