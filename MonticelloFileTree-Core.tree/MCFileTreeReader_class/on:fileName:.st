
!MCFileTreeReader class methodsFor: 'reading' stamp: 'OttoBehrens 10/25/2011 00:58'!
on: s fileName: f
	^ (self on: s)
		packageDirectory: f;
		yourself! !
