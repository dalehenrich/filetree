accessing
authorName: aVersion
	^ (self class namesAt: aVersion info author)
		ifNil: [ (self gitCommand: #('config' '--get' 'user.name') in: directory)
				trimRight ]