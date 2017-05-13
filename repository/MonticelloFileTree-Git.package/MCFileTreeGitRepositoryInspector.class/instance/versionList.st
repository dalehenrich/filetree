morphic ui
versionList
	| result sortBlock |
	result := selectedPackage
		ifNil: [ versions ifNil: [ ^ #() ] ]
		ifNotNil: [ (versions ifNil: [ ^ #() ])
				select: [ :each | selectedPackage = each first ] ].
	versionPattern
		ifNotEmpty: [ result := result
				select:
					[ :package | package fourth asLowercase includesSubstring: versionPattern ] ].
	^ result collect: [ :each | self versionHighlight: each fourth ]