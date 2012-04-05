*monticellofiletree-gemstone-extensions
fileNamed: localFileName do: aBlock
	| file |
	file := self fileNamed: localFileName.
	^ [ aBlock value: file ] ensure: [ file close ]