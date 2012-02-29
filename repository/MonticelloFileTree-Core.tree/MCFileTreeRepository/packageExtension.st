
!MCFileTreeRepository methodsFor: 'private'!
packageExtension
    self usesPkgExtension
        ifTrue: [ ^ '.pkg' ].
    ^ '.tree'! !
