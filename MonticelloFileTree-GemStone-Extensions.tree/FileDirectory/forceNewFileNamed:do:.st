
!FileDirectory methodsFor: '*monticellofiletree-gemstone-extensions' stamp: 'galatians 05/13/2005 14:15'!
forceNewFileNamed: localFileName do: aBlock
	| file |
	file := self forceNewFileNamed: localFileName.
	^ [ aBlock value: file ] ensure: [ file close ]! !
