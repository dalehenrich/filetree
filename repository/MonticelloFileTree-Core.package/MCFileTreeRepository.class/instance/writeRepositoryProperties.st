as yet unclassified
writeRepositoryProperties
	"But update the repositoryProperties as well, mate!"

	self fileUtils
		writeStreamFor: '.filetree'
		in: self directory
		do: [ :fileStream | 
			fileStream lineEndConvention: #lf.
			repositoryProperties
				at: 'packageExtension' put: self class defaultPackageExtension;
				at: 'propertyFileExtension' put: self propertyFileExtension.
			fileStream
				nextPutAll: '{ "packageExtension" : "' , self class defaultPackageExtension , '",';
				cr;
				nextPutAll: '  "propertyFileExtension" : "' , self propertyFileExtension , '" }';
				cr;
				yourself ]