as yet unclassified
writeRepositoryProperties
    self fileUtils
        writeStreamFor: '.filetree'
        in: self directory
        do: [ :fileStream | 
            fileStream
                nextPutAll: '{ "packageExtension" : "' , self class defaultPackageExtension , '" }';
                lf;
                nextPutAll: '{ "propertyFileExtension" : "' , self propertyFileExtension , '" }';
                lf;
                yourself]
