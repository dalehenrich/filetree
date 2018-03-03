descriptions
description
	self gitTopDirectory exists
		ifFalse: [ ^ 'deleted' ].
	remoteUrl
		ifNil: [ ^ self shortDirectoryDescription , ' ['
				, (self branch ifNil: [ 'master' ]) , '] (GitFileTree)' ].
	^ self shortRemoteDescription , ' ['
		, (self branch ifNil: [ 'master' ]) , '] (Remote Git)'