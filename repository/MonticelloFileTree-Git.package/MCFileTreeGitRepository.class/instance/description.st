descriptions
description
	remoteUrl ifNil: [ ^ 'gitfiletree://' , directory fullName , ' ' , self currentBranch ].
	branch ifNotNil: [ ^ remoteUrl , '  ' , self currentBranch ].
	^ remoteUrl