as yet unclassified
writeRepositoryProperties
    directory
        forceNewFileNamed: '.filetree'
        do: [ :file | 
            file
                nextPutAll: '{ "packageExtension" : "' , self class defaultPackageExtension , '" }';
                cr ]