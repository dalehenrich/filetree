accessing
versionHighlight: aPackageEntry
	"Changed to take in account the fact the version name is in the package entry."

	"Should correct a bug in FileTree display: current package is allways in bold."

	| verName |
	self assert: aPackageEntry class == GitFileTreePackageEntry.
	verName := aPackageEntry info name.
	^ Text
		string: verName
		attribute:
			(TextEmphasis new
				emphasisCode:
					((loaded includes: verName)
						ifTrue: [ 4	"underlined" ]
						ifFalse: [ 
							(aPackageEntry info breadthFirstAncestors anySatisfy: [ :v | loaded includes: v name ])
								ifFalse: [ 0 ]
								ifTrue: [ 1	"bold" ] ]))