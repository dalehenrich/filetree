accessing
refresh
	loadedPackages := Set new.
	versions := repository retrieveVersionsWithPackageNames: Set new.
	newer := Set new.
	loaded := Set new.
	MCWorkingCopy allManagers
		do: [ :eachManager | 
			| packageVersions allAncestorIDs |
			packageVersions := versions
				select: [ :each | each first beginsWith: eachManager packageName ].
			packageVersions notEmpty
				ifTrue: [ loadedPackages add: eachManager packageName.
					eachManager ancestors do: [ :each | loaded add: each name ].
					allAncestorIDs := eachManager allAncestors collect: [ :e | e id ].
					packageVersions
						do: [ :eachVersion | 
							(allAncestorIDs anySatisfy: [ :e | eachVersion fourth info id = e ])
								ifFalse: [ newer add: eachVersion fourth info ] ] ] ].
	self packageListUpdate.
	repository branch: nil.
	self changed: #gitNeedPush