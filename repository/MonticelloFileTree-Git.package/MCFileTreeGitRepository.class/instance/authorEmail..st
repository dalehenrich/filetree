accessing
authorEmail: aVersion
	^ (self class namesAt: aVersion info author)
		ifNotNil: [ :d | d at: #email ]
		ifNil: [ '<' , self gitAuthorEmail , '>' ]