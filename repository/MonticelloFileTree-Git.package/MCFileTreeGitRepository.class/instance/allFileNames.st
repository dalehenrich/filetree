as yet unclassified
allFileNames
	"When reading the file names, generate GitFileTreePackageEntry objects with the path and the info."

	| allNames |
	allNames := OrderedCollection new.
	(self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ])
		collect: [ :entry | 
			(self gitVersionsForPackage: entry name)
				do: [ :commitID | 
					| info |
					info := [((MCFileTreeGitStReader on: directory fileName: entry name) commitID: commitID) info] on: KeyNotFound do: [nil].
					info notNil
						ifTrue: [ allNames add: (GitFileTreePackageEntry on: entry name id: commitID info: info) ] ] ].
	^ allNames