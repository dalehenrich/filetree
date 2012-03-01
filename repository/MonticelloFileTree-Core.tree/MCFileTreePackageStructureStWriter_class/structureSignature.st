
!MCFileTreePackageStructureStWriter class methodsFor: 'accessing'!
structureSignature
    "
	0.0 - original structure
	0.1 - separate files for method metaData (timestamp) and source
	0.2 - no method metaData file
	0.3 - structure based on: https://gist.github.com/1892114/97d74577638b0f6902c5f1997c1574ca51a00ac8"

    | ext |
    ext := MCFileTreeRepository defaultPackageExtension.
    ext = '.pkg'
        ifTrue: [ ^ '0.3' ].
    ext = '.tree'
        ifTrue: [ ^ '0.2' ].
    self error: 'unknown package extenstion'! !
