
!MCFileTreeStWriter methodsFor: 'visiting'!
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
