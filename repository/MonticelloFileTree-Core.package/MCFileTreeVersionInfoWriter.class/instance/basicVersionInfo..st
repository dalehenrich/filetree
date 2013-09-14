printing
basicVersionInfo: aVersionInfo
	
	^ String streamContents: [:s |
		s nextPut: $(.
		#(name message id date time author) 
			do: [:sel | 
				s nextPutAll: sel.
				s nextPut: $ .
				((aVersionInfo perform: sel) ifNil: ['']) asString printOn: s.
			s cr].
		s nextPutAll: 'ancestors ('.
		aVersionInfo ancestors 
			do: [:ea | self versionAsId: ea on: s]
			separatedBy: [s nextPut: $ ].
		s nextPut: $); cr.
		s nextPutAll: 'stepChildren ('.
		aVersionInfo stepChildren
			do: [:ea | self versionAsId: ea on: s]
			separatedBy: [s nextPut: $ ].
		s nextPutAll: '))'.]