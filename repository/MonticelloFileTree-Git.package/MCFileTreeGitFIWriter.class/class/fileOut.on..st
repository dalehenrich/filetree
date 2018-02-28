instance creation
fileOut: aVersion on: aMCFileTreeGitRepository
	"Creation API: note that with other repository types, aMCFileTreeGitRepository is supposed to be a stream..."

	| aWriter |
	aWriter := self new.
	aWriter repository: aMCFileTreeGitRepository.
	aWriter outputCommit: aVersion.
	aVersion hasDependencies
		ifTrue: [ aWriter
				outputFileModify: aVersion package name , '.package/monticello.meta/.gitfiletree'
				with: aMCFileTreeGitRepository buildGitFileTreeProperties ].
	aWriter
		writeSnapshot: aVersion snapshot
		in: aVersion package name , '.package'.
	^ aWriter stream