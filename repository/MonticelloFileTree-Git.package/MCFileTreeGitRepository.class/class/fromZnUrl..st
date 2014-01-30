instance creation
fromZnUrl: aZnUrl
	"Let hack that. Get fed up with the lack of progress at times, can't work."

	"A gitfiletree url with a protocol parameter is the target for a remote. All other parameters are optional.
	Parameters are:
		dir : the directory inside the repository where the target MC packages are.
		branch : the git branch to fetch.
		protocol : the protocol to use to access the repository from git. Essentially make the difference between ssh (git@hostname:pathToRepo) and others urls (https://hostname/pathToRepo).
		readOnly : is the repository read only? If present, reduce the history to a minimum (and change the GUI).
	Once parameters are set, it becomes mandatory to have a protocol and a remote url."

	| repo |
	repo := self new.
	self assert: aZnUrl scheme = #gitfiletree.
	(aZnUrl hasQuery and: [ (aZnUrl queryAt: 'protocol' ifAbsent: [  ]) notNil ])
		ifTrue: [ 
			repo subdirectory: (aZnUrl queryAt: 'dir' ifAbsent: [  ]).
			repo branch: (aZnUrl queryAt: 'branch' ifAbsent: [  ]).
			repo
				remoteUrl:
					((aZnUrl queryAt: 'protocol') = 'git'
						ifTrue: [ 'git@' , aZnUrl host , ':' ]
						ifFalse: [ (aZnUrl queryAt: 'protocol') , '://' , aZnUrl host , '/' ]) , aZnUrl path.
			repo readonly: (aZnUrl queryAt: 'readOnly' ifAbsent: [  ]) notNil.
			repo
				gitCloneRepositoryAndCheckoutIn:
					(aZnUrl lastPathSegment ifNil: [ aZnUrl host ] ifNotNil: [ :n | n asFileReference basenameWithoutExtension ]) ]
		ifFalse: [ repo directory: aZnUrl asFileReference ].
	^ repo