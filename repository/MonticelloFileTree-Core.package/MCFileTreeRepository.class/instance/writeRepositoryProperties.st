as yet unclassified
writeRepositoryProperties
    self directory
        forceNewFileNamed: '.filetree'
        do: [ :file | 
            file lineEndConvention: #'lf'.
            file
                nextPutAll: '{ "packageExtension" : "' , self class defaultPackageExtension , '" }';
                cr ]