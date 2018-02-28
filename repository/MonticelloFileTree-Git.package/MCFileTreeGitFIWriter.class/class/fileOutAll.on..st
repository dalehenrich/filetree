instance creation
fileOutAll: anArrayOfVersions on: aMCFileTreeGitRepository
	"Creation API: note that with other repository types, aMCFileTreeGitRepository is supposed to be a stream..."

	| aWriter |
	aWriter := self new.
	aWriter repository: aMCFileTreeGitRepository.
	aWriter outputCommit: anArrayOfVersions first.
	anArrayOfVersions
		do: [ :each | 
			aWriter
				writeSnapshot: each snapshot
				in: each package name , '.package' ].
	^ aWriter stream