as yet unclassified
writeRepositoryProperties
    (self directory / '.filetree') 
		writeStreamDo: [ :stream | 
       	stream 
				lineEndConvention: #'lf';
   				nextPutAll: '{ "packageExtension" : "';
				nextPutAll: self class defaultPackageExtension;
				nextPutAll: '" }'; cr ]