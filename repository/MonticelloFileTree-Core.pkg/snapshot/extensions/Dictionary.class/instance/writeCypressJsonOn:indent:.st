
!Dictionary methodsFor: '*monticellofiletree-core'!
writeCypressJsonOn: aStream indent: startIndent
    | indent count |
    indent := startIndent.
    aStream
        nextPutAll: '{';
        lf.
    count := 0.
    indent := indent + 1.
    self
        keysAndValuesDo: [ :key :value | 
            count := count + 1.
            aStream tab: indent.
            key writeCypressJsonOn: aStream indent: indent.
            aStream nextPutAll: ' : '.
            value writeCypressJsonOn: aStream indent: indent.
            count < self size
                ifTrue: [ 
                    aStream
                        nextPutAll: ',';
                        lf ] ].
    self size = 0
        ifTrue: [ aStream tab: indent ].
    aStream nextPutAll: ' }'! !
