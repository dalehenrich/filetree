
!MCFileTreeAbstractReader methodsFor: 'testing'!
separateMethodMetaAndSource
    ^ self packageProperties at: 'separateMethodMetaAndSource' ifAbsent: [ false ]! !
