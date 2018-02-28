i/o
buildGitFileTreeProperties
	"Write git file tree properties."

	^ String
		writeStreamDo: [ :fileStream | 
			fileStream lineEndConvention: #lf.
			fileStream nextPutAll: '{'.
			fileStream
				nextPut: $";
				nextPutAll: 'SingleCommitForDependencies';
				nextPutAll: '" : "';
				nextPutAll: 'true';
				nextPut: $".
			fileStream nextPutAll: ' }' ]