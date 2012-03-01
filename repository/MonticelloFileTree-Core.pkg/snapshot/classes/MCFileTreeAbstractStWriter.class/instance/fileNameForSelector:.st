
!MCFileTreeAbstractStWriter methodsFor: 'private'!
fileNameForSelector: selector
    ^ selector == #'/'
        ifTrue: [ 'encoded slash' ]
        ifFalse: [ selector ]! !
