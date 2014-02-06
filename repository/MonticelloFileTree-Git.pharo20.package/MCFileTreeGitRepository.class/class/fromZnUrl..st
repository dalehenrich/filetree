instance creation
fromZnUrl: aZnUrl
	"Let hack that. Get fed up with the lack of progress at times, can't work."

	"A gitfiletree url with a host is the target for a remote. All other parameters are optional.
	Parameters are:
		dir : the directory inside the repository where the target MC packages are.
		branch : the git branch to fetch.
		protocol: the user name part to add to the ssh Url, default to git.
		readOnly : is the repository read only? If present, reduce the history to a minimum (and change the GUI)."

	| repo |
	repo := self new.
	self assert: aZnUrl scheme = #gitfiletree.
	aZnUrl hasHost
		ifTrue: [ 
			repo subdirectory: (aZnUrl queryAt: 'dir' ifAbsent: [  ]).
			repo branch: (aZnUrl queryAt: 'branch' ifAbsent: [  ]).
			repo remoteUrl: (aZnUrl queryAt: 'protocol' ifAbsent: [ 'git' ]) , '@' , aZnUrl host , ':' , aZnUrl path.
			repo readonly: (aZnUrl queryAt: 'readOnly' ifAbsent: [  ]) notNil.
			repo
				gitCloneRepositoryAndCheckoutIn:
					(aZnUrl lastPathSegment ifNil: [ aZnUrl host ] ifNotNil: [ :n | n asFileReference basenameWithoutExtension ]) ]
		ifFalse: [ repo directory: aZnUrl asFileReference ].
	^ repo