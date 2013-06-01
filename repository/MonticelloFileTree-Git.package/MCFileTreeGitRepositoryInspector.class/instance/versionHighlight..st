as yet unclassified
versionHighlight: aPackageEntry
	self assert: aPackageEntry class == GitFileTreePackageEntry.
	^ super versionHighlight: aPackageEntry info name