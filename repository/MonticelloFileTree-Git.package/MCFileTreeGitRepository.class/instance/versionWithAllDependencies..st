private
versionWithAllDependencies: aVersion
	| deps |
	deps := OrderedCollection with: aVersion.
	MCCacheRepository uniqueInstance
		cacheAllFileNamesDuring: [ self
				cacheAllFileNamesDuring: [ aVersion
						allAvailableDependenciesDo: [ :dep | 
							(self includesVersionNamed: dep info name)
								ifFalse: [ deps add: dep ] ] ] ].
	^ deps