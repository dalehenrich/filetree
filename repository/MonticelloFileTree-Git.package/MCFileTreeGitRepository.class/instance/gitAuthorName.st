accessing
gitAuthorName
	^ gitAuthorName
		ifNil: [ gitAuthorName := (self
				gitCommand: #('config' '--get' 'user.name')
				in: directory) trimRight ]