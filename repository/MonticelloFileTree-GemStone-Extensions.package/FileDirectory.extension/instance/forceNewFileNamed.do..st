*monticellofiletree-gemstone-extensions
forceNewFileNamed: localFileName do: aBlock
	| file |
	file := self forceNewFileNamed: localFileName.
	^ [ aBlock value: file ] ensure: [ file close ]