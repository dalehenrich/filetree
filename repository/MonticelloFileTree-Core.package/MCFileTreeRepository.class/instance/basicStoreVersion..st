as yet unclassified
basicStoreVersion: aVersion
    self readonly
        ifTrue: [ ^ self error: 'The filetree repository: ' , self description printString , ' was created read only.' ].
    self packageExtension ~= self class defaultPackageExtension
        ifTrue: [ 
            repositoryProperties := nil.	"force reset of properties, since we're rewriting the file"
            self writeRepositoryProperties ].
    MCFileTreeWriter fileOut: aVersion on: self