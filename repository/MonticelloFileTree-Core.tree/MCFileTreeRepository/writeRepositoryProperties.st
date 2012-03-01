
!MCFileTreeRepository methodsFor: 'as yet unclassified'!
writeRepositoryProperties
    directory
        forceNewFileNamed: '.filetree'
        do: [ :file | 
            file lineEndConvention: #'lf'.
            file
                nextPutAll: '{ "packageExtension" : "' , self class defaultPackageExtension , '" }';
                cr ]! !
