visiting
writeInDirectoryName: directoryName fileName: fileName visit: visitBlock
	(directoryName = '.'
		ifTrue: [ stream packageFileDirectory ]
		ifFalse: [ stream subPackageFileDirectoryFor: directoryName ])
		forceNewFileNamed: fileName
		do: [ :file | 
			stWriter stream: file.
			visitBlock value ]