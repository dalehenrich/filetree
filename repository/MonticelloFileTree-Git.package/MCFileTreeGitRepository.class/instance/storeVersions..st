storing
storeVersions: versions
	self basicStoreVersions: versions.
	versions
		do: [ :aVersion | 
			SystemAnnouncer uniqueInstance
				announce: (MCVersionSaved version: aVersion repository: self) ]