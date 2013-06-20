accessing
loadAllFileNames
	"When reading the file names, generate GitFileTreePackageEntry objects with the path and the info."

	| allNames entries |
	allNames := OrderedCollection new.
	entries := self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ].
	'loading packages versions from git'
		displayProgressFrom: 0
		to: entries size
		during: [ :bar | 
			1 to: entries size do: [ :i | 
				(entries at: i)
					in: [ :entry | 
						(self gitVersionsForPackage: entry name)
							do: [ :commitID | 
								| info |
								info := [ ((MCFileTreeGitStReader on: directory fileName: entry name) commitID: commitID) info ]
									on: KeyNotFound
									do: [ nil ].
								info notNil
									ifTrue: [ allNames add: (GitFileTreePackageEntry on: entry name id: commitID info: info) ] ] ].
				bar value: i ] ].
	^ allNames