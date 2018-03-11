git querying
gitVersionsForDefinition: aMCDefinition in: aPackageName
	"Query git for all the versions related to that method definition."

	| methodFile |
	methodFile := self subDirectoryString , aPackageName , '.package/'
		, aMCDefinition className
		,
			(aMCDefinition isExtensionMethod
				ifTrue: [ '.extension/' ]
				ifFalse: [ '.class/' ])
		,
			(aMCDefinition classIsMeta
				ifTrue: [ 'class/' ]
				ifFalse: [ 'instance/' ])
		, (MCGitFileTreeWriter baseFileNameForSelector: aMCDefinition selector)
		, '.st'.
	^ (self gitCommand: #('log' '--format=%H' '--') , {methodFile})
		substrings collect: [ :e | ByteArray readHexFrom: e ]