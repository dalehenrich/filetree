private-writing
writePackageGitPropertiesIn: aPathAsString
	| properties |
	properties := Dictionary new.
	properties at: 'noMethodMetaData' put: true.
	properties at: 'separateMethodMetaAndSource' put: false.
	properties at: 'useCypressPropertiesFile' put: true.
	self
		outputFileModify: aPathAsString , '/.filetree'
		with:
			(String
				streamContents: [ :s | STON put: properties asJsonOnStreamPretty: s ])
				withUnixLineEndings.
	self
		outputFileModify: aPathAsString , '/properties.json'
		with:
			(String
				streamContents: [ :s | STON put: Dictionary new asJsonOnStreamPretty: s ])
				withUnixLineEndings