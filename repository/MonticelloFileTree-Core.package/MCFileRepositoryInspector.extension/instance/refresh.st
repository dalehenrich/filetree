*monticellofiletree-core
refresh
	| packageNames |
	packageNames := Set new.
	packageList := nil.
	versions := repository retrieveVersionsWithPackageNames: packageNames.
	newer := Set new.
	inherited := Set new.
	loaded := Set new.
	MCWorkingCopy allManagers
		do: [ :each | 
			| latest |
			each ancestors
				do: [ :ancestor | 
					loaded add: ancestor name.
					ancestor
						ancestorsDoWhileTrue: [ :heir | 
							(inherited includes: heir name)
								ifTrue: [ false ]
								ifFalse: [ 
									inherited add: heir name.
									true ] ] ].
			latest := (versions select: [ :v | v first = each package name ]) detectMax: [ :v | v third ].
			(latest notNil
				and: [ 
					each ancestors
						allSatisfy: [ :ancestor | 
							| av |
							av := ((ancestor name copyAfterLast: $-) copyAfter: $.) asInteger.
							av < latest third
								or: [ av = latest third and: [ ((ancestor name copyAfterLast: $-) copyUpTo: $.) ~= latest second ] ] ] ])
				ifTrue: [ newer add: each package name ] ].	"		select: [ :each | packageNames includes: each packageName]"
	self
		changed: #packageList;
		changed: #versionList