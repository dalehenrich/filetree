
!MCFileTreeStWriter methodsFor: 'visiting' stamp: 'dkh 2/1/2012 20:14'!
writeInDirectoryName: directoryName fileName: fileName extension: ext visit: visitBlock
	| directory |
	directory := directoryName = '.'
		ifTrue: [ stream packageFileDirectory ]
		ifFalse: [ stream subPackageFileDirectoryFor: directoryName ].
	directory
		forceNewFileNamed: fileName , ext
		do: [ :file | 
			file lineEndConvention: #lf.
			stWriter stream: file.
			visitBlock value ]! !
