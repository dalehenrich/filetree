accessing
branch
	^ branch ifNil: [ branch := self currentBranch ]