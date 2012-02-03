
!MCFileTreeWriter methodsFor: 'serializing'!
serializeVersionInfo: aVersionInfo
	^ String streamContents: [ :s | self writeVersionInfo: aVersionInfo onStream: s ]! !
