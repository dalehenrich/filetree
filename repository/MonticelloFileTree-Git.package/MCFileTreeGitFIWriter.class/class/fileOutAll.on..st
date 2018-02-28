instance creation
fileOutAll: anArrayOfVersions on: aMCFileTreeGitRepository
	"Only one approach to filing out: a set of versions in one commit."

	"Small note: since we do not provide the package or the full version itself to the main writer method, we write by hand after each version some package related data that seems a relic of the old mcz format."

	| aWriter subDirectoryString |
	aWriter := self new.
	aWriter repository: aMCFileTreeGitRepository.
	subDirectoryString := aMCFileTreeGitRepository subDirectoryString.
	aWriter outputCommit: anArrayOfVersions first.
	anArrayOfVersions
		do: [ :each | 
			aWriter
				writeSnapshot: each snapshot
				in: subDirectoryString , each package name , '.package'.
			aWriter
				outputFileModify:
					subDirectoryString , each package name
						, '.package/monticello.meta/package'
				with: '(name ''' , each package name , ''')' ].
	^ aWriter stream