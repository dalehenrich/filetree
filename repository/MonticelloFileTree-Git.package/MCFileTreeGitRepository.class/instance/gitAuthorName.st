git querying
gitAuthorName
	^ gitAuthorName
		ifNil: [ gitAuthorName := (self gitCommand: #('config' '--get' 'user.name'))
				trimRight ]