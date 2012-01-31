
!MCFileTreeWriter methodsFor: 'visiting' stamp: 'ezra 10/25/2011 16:53'!
initializePackageFileDirectoryCache
	cachedPackageFileDirectoryEntries := Dictionary new.
	self packageFileDirectory entries
		do: [ :entry | 
			entry isDirectory
				ifTrue: [ cachedPackageFileDirectoryEntries at: entry name put: entry asFileDirectory ] ]! !
