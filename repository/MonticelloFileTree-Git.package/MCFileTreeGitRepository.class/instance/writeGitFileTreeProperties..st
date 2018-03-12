i/o
writeGitFileTreeProperties: aPackageDirectory
	"Write git file tree properties with a package. Only needed when in metadata mode."

	self fileUtils
		writeStreamFor: self class gitPerPackageProperties
		in:
			(self fileUtils
				directoryFromPath: 'monticello.meta'
				relativeTo: aPackageDirectory)
		do: [ :fileStream | 
			STON
				put:
					(Dictionary new
						at: 'SingleCommitForDependencies' put: 'true';
						yourself)
				asJsonOnStreamPretty: fileStream ]