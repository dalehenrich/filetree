visiting
writeInDirectoryName: directoryNameOrPath fileName: fileName extension: extension visit: visitBlock
	| file |	
	file := self directoryForDirectoryNamed: directoryNameOrPath.
	fileName isEmptyOrNil ifFalse: [ file := file / fileName ].
	file := file , extension.
	file writeStreamDo: [ :aStream | 
			aStream lineEndConvention: #'lf'.
			self setFileStream: aStream.
			visitBlock value ]