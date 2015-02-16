i/o
writeGitFileTreeProperties: aPackageDirectory
	"Write git file tree properties with a package."

	self fileUtils
		writeStreamFor: '.gitfiletree'
		in: (self fileUtils directoryFromPath: 'monticello.meta' relativeTo: aPackageDirectory)
		do: [ :fileStream | 
			fileStream lineEndConvention: #lf.
			fileStream nextPutAll: '{'.
			fileStream
				nextPut: $";
				nextPutAll: 'SingleCommitForDependencies';
				nextPutAll: '" : "';
				nextPutAll: 'true';
				nextPut: $".
			fileStream nextPutAll: ' }' ]