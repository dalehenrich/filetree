
!MCFileTreeWriter methodsFor: 'serializing' stamp: 'revelations 11/9/2011 14:18'!
writeVersionInfo: aVersionInfo onStream: s
	s nextPut: $(.
	#(#name #message #id #date #time #author)
		do: [ :sel | 
			s
				nextPutAll: sel;
				space.
			((aVersionInfo perform: sel) ifNil: [ '' ]) asString printOn: s.
			s lf ].
	s
		nextPutAll: 'ancestors ()';
		lf;
		nextPutAll: 'stepChildren ())'! !
