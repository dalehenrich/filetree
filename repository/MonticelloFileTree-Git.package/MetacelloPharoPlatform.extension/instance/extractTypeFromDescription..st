*MonticelloFileTree-Git-override
extractTypeFromDescription: description
	(description beginsWith: 'ftp://')
		ifTrue: [ ^ 'ftp' ].
	(description beginsWith: 'gitfiletree://')
		ifTrue: [ ^ 'gitfiletree' ].
	^ super extractTypeFromDescription: description