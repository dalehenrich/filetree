
!FileDirectory methodsFor: '*monticellofiletree-gemstone-extensions' stamp: 'revelations 11/2/2011 13:40'!
fileNamed: localFileName do: aBlock
	| file |
	file := self fileNamed: localFileName.
	^ [ aBlock value: file ] ensure: [ file close ]! !
