
!String methodsFor: '*monticellofiletree-core'!
writeCypressJsonOn: aStream indent: startIndent
    aStream
        nextPutAll: '"';
        nextPutAll: self cypressEscape;
        nextPutAll: '"'! !
