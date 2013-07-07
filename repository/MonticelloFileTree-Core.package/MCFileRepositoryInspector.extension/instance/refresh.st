*monticellofiletree-core
refresh
	| packageNames |
	packageNames := Set new.
	packageList := nil.
	versions := repository retrieveVersionsWithPackageNames: packageNames.
	newer := Set new.
	inherited := Set new.
	loaded := Set new.
	self allManagers
		do: [ :each | 
			| latest |
			self computeLoadedAndInheritedFromManager: each.
			latest := (versions select: [ :v | v first = each package name ]) detectMax: [ :v | v third ].
			(latest notNil
				and: [ 
					each ancestors
						allSatisfy: [ :ancestor | 
							| av |
							av := ((ancestor name copyAfterLast: $-) copyAfter: $.) asInteger.
							av < latest third
								or: [ av = latest third and: [ ((ancestor name copyAfterLast: $-) copyUpTo: $.) ~= latest second ] ] ] ])
				ifTrue: [ newer add: each package name ] ].
	self
		changed: #packageList;
		changed: #packageSelection;
		changed: #versionList