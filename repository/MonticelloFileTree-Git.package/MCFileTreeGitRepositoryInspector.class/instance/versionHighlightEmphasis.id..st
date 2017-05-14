morphic ui
versionHighlightEmphasis: aString id: anId
	"Appearence. This code attempts to show the following:
		- a currently loaded version of the package: underlined.
		- a version of a not loaded package: bold.
		- a newer version of a loaded package: bold.
		- a version not in the ancestry of the currently loaded and
		selected package: bold.
	All those tests are made on the version name and number, not the package
	UUID, so they are not reliable. The least reliable test is the 'newer' check.
	"

	| versionName packageName |
	versionName := aString copyUpTo: $(.
	packageName := versionName copyUpToLast: $-.
	(packageName includes: $.)
		ifTrue: [ packageName := packageName copyUpTo: $. ].
	(loaded includes: versionName)
		ifTrue: [ ^ TextEmphasis underlined ].
	(newer anySatisfy: [ :e | e id = anId ])
		ifTrue: [ ^ TextEmphasis bold ].
	(loadedPackages includes: packageName)
		ifFalse: [ ^ TextEmphasis bold ].
	^ TextEmphasis normal