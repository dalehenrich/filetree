accessing
gitCommand
	^ GitCommand ifNil: [ 'git' ]