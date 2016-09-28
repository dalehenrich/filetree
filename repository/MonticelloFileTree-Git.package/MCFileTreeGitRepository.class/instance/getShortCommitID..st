private
getShortCommitID: outputOfGitCommit
	| s |
	outputOfGitCommit isEmpty
		ifTrue: [ ^ nil ].
	s := ReadStream on: outputOfGitCommit.
	s upTo: $ .
	^ s upTo: $]