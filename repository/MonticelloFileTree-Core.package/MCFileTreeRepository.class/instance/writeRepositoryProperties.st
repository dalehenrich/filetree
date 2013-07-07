as yet unclassified
writeRepositoryProperties
  self directory
    forceNewFileNamed: '.filetree'
    do: [ :file | 
      file
        nextPutAll:
            '{ "packageExtension" : "' , self class defaultPackageExtension , '" }';
        lf;
        nextPutAll:
            '{ "propertyFileExtension" : "' , self propertyFileExtension , '" }';
        lf;
        yourself ]