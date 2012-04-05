
!Dictionary methodsFor: '*monticellofiletree-core'!
writeCypressJsonOn: aStream indent: startIndent
    | indent keys |
    indent := startIndent.
    aStream
        nextPutAll: '{';
        lf.
    indent := indent + 1.
    keys := self keys sort: [ :a :b | a <= b ].
    1 to: keys size do: [ :index | 
        | key value |
        key := keys at: index.
        value := self at: key.
        aStream tab: indent.
        key writeCypressJsonOn: aStream indent: indent.
        aStream nextPutAll: ' : '.
        value writeCypressJsonOn: aStream indent: indent.
        index < self size
            ifTrue: [ 
                aStream
                    nextPutAll: ',';
                    lf ] ].
    self size = 0
        ifTrue: [ aStream tab: indent ].
    aStream nextPutAll: ' }'! !
