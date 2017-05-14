private
versions: packageVersions before: allAncestorIDs
	packageVersions
		do: [ :eachVersion | 
			(allAncestorIDs anySatisfy: [ :e | eachVersion fourth info id = e ])
				ifTrue: [ ^ self ]
				ifFalse: [ newer add: eachVersion fourth info ] ]