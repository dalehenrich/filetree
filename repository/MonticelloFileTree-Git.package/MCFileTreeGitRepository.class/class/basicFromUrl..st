instance creation
basicFromUrl: aZnUrl
	"Let hack that. Fed up with the lack of progress at times, can't work."

	"A gitfiletree url with a host is the target for a remote. All other parameters are optional.
	Parameters are:
		dir : the directory inside the repository where the target MC packages are.
		branch : the git branch to fetch.
		protocol: the user name part to add to the ssh Url, default to git, but can also be https (which implies read only access).
		readOnly : is the repository read only? If present, reduce the history to a minimum (and change the GUI)."

	| repo |
	repo := self new.
	self assert: aZnUrl scheme = #gitfiletree.
	aZnUrl hasHost
		ifTrue: [ 
			| protocol |
			repo subdirectory: (aZnUrl queryAt: 'dir' ifAbsent: [  ]).
			repo branch: (aZnUrl queryAt: 'branch' ifAbsent: [  ]).
			protocol := aZnUrl queryAt: 'protocol' ifAbsent: [ 'git' ].
			repo readonly: (aZnUrl queryAt: 'readOnly' ifAbsent: [  ]) notNil.
			protocol = 'git'
				ifTrue: [ repo remoteUrl: 'git@' , aZnUrl host , ':' , aZnUrl path ].
			protocol = 'https'
				ifTrue: [ 
					repo remoteUrl: 'https://' , aZnUrl host , '/' , aZnUrl path.
					repo readonly: true ].
			repo
				gitCloneRepositoryAndCheckoutIn:
					(aZnUrl lastPathSegment ifNil: [ aZnUrl host ] ifNotNil: [ :n | n asFileReference basenameWithoutExtension ]) ]
		ifFalse: [ repo directory: (self urlAsFileReference: aZnUrl) ].
	^ repo