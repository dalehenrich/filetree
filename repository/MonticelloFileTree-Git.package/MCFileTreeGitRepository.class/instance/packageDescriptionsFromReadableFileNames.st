accessing
packageDescriptionsFromReadableFileNames
	"I should avoid checking that the package is really a package in all versions; I'll cope with that if I really have to load the package later."

	"In the FileTree-derived version, I was checking on the current working tree only (but doing it for all versions of all packages). Now I'm checking only with the HEAD (and it's done in MCFileTreeGitRepository>>#readableFileNames."

	^ self readableFileNames
		collect: [ :packageEntry | 
			self class
				parseEntry: packageEntry
				extension:
					(packageEntry packageDirectory
						in: [ :s | s copyFrom: (s lastIndexOf: $.) to: s size ]) ]