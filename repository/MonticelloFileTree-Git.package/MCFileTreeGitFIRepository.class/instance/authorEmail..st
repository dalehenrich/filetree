accessing
authorEmail: aVersion
	^ (self class namesAt: aVersion info author)
		ifNil: [ (self gitCommand: #('config' '--get' 'user.email') in: directory)
				trimRight ]