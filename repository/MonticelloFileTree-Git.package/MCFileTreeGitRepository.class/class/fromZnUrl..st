instance creation
fromZnUrl: aZnUrl
	"Let hack that. Get fed up with the lack of progress at times, can't work."

	"A gitfiletree url with a protocol parameter is the target for a remote. All other parameters are optional."

	| repo |
	repo := self new.
	self assert: aZnUrl scheme = #gitfiletree.
	aZnUrl hasQuery
		ifTrue: [ 
			repo subdirectory: (aZnUrl queryAt: 'dir' ifAbsent: [  ]).
			repo branch: (aZnUrl queryAt: 'branch' ifAbsent: [  ]).
			repo
				remoteUrl:
					((aZnUrl queryAt: 'protocol') = 'git'
						ifTrue: [ 'git@' , aZnUrl host , ':' ]
						ifFalse: [ (aZnUrl queryAt: 'protocol') , '://' , aZnUrl host , '/' ]) , aZnUrl path.
			repo
				gitCloneRepositoryAndCheckoutIn:
					(aZnUrl lastPathSegment ifNil: [ aZnUrl host ] ifNotNil: [ :n | n asFileReference basenameWithoutExtension ]) ]
		ifFalse: [ repo directory: aZnUrl asFileReference ].
	^ repo