as yet unclassified
writeRepositoryProperties
    self fileUtils
        writeStreamFor: '.filetree'
        in: self directory
        do: [ :fileStream | 
            fileStream lineEndConvention: #'lf'.
            fileStream
                nextPutAll: '{ "packageExtension" : "' , self class defaultPackageExtension , '" }';
                cr ]