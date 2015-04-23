loading
loadPackageDirectory: aDirectory
	aDirectory entries do:
		[ :entry |
			(entry name endsWith: '.trait')
				ifTrue: [ self loadTraitDirectory: entry ].
			(entry name endsWith: '.class')
				ifTrue: [ self loadClassDirectory: entry ].
			(entry name endsWith: '.extension')
				ifTrue: [ self loadExtensionDirectory: entry ] ]