accessing
gitAuthorEmail
	^ gitAuthorEmail
		ifNil: [ gitAuthorEmail := (self
				gitCommand: #('config' '--get' 'user.email')
				in: directory) trimRight ]