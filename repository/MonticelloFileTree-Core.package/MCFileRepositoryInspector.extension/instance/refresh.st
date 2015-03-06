*monticellofiletree-core
refresh
	| packageNames |
	packageNames := Set new.
	versions := repository retrieveVersionsWithPackageNames: packageNames.
	newer := Set new.
	loaded := Set new.
	MCWorkingCopy allManagers
		do: [ :each | 
			| latest |
			each ancestors do: [ :ancestor | loaded add: ancestor name ].
			latest := versions select: [ :v | v first = each package name ].
			latest
				do: [ :aV | 
					each ancestors
						do: [ :ancestor | 
							| anVersion |
							anVersion := ((ancestor name copyAfterLast: $-) copyAfter: $.) asInteger.
							(anVersion < aV third
								or: [ anVersion = aV third and: [ ((ancestor name copyAfterLast: $-) copyUpTo: $.) ~= aV second ] ])
								ifTrue: [ newer add: aV last ] ] ] ].	"		select: [ :each | packageNames includes: each packageName]"
	self
		packageListUpdate;
		changed: #versionList