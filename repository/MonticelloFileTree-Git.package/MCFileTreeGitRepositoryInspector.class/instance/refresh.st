accessing
refresh
	| packageNames mcWorkingCopies |
	loadedPackages := Set new.
	packageNames := Set new.
	versions := repository retrieveVersionsWithPackageNames: packageNames.
	newer := Set new.
	loaded := Set new.
	mcWorkingCopies := MCWorkingCopy allManagers
		select: [ :e | packageNames includes: e packageName ].
	mcWorkingCopies
		do: [ :eachManager | 
			| packageVersions allAncestorIDs |
			packageVersions := versions
				select: [ :each | each first beginsWith: eachManager packageName ].
			packageVersions notEmpty
				ifTrue: [ loadedPackages add: eachManager packageName.
					eachManager ancestors do: [ :each | loaded add: each name ].
					allAncestorIDs := eachManager ancestors collect: [ :e | e id ].
					self versions: packageVersions before: allAncestorIDs ] ].
	self packageListUpdate.
	repository branch: nil.
	self changed: #gitNeedPush