*monticellofiletree-core
writeCypressJsonOn: aStream forHtml: forHtml indent: startIndent
    "by default ignore <forHtml> ... <forHtml> is used for Dictionary and Array, i.e., container objects and String which actually encodes itself differently for HTML"

    aStream
        nextPutAll: '"';
        nextPutAll:
                (forHtml
                        ifTrue: [ self cypressEscape ]
                        ifFalse: [ self ]);
        nextPutAll: '"'