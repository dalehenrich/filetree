accessing
authorEmail: aVersion
	^ (self class namesAt: aVersion info author)
		ifNil: [ self gitAuthorEmail ]