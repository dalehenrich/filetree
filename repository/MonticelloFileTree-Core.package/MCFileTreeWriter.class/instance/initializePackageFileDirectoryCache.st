visiting
initializePackageFileDirectoryCache
	cachedPackageFileDirectoryEntries := Dictionary new.
	self packageFileDirectory entries
		do: [ :entry | 
			entry isDirectory
				ifTrue: [ cachedPackageFileDirectoryEntries at: entry basename put: entry asFileReference ] ]