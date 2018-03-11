git querying
gitAuthorEmail
	^ gitAuthorEmail
		ifNil:
			[ gitAuthorEmail := (self gitCommand: #('config' '--get' 'user.email'))
				trimRight ]