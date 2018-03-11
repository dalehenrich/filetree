git querying
gitAuthorName
	^ gitAuthorName
		ifNil: [ gitAuthorName := (self
				gitCommand: #('config' '--get' 'user.name')
				in: self gitTopDirectory) trimRight ]