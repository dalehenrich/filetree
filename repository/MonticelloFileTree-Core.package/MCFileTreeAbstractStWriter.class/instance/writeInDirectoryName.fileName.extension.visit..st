visiting
writeInDirectoryName: directoryNameOrPath fileName: fileName extension: ext visit: visitBlock
	| directory |
	directory := self directoryForDirectoryNamed: directoryNameOrPath.
	self fileUtils
		writeStreamFor: fileName , ext
		in: directory
		do: [ :fileStream | 
			| stringStream |
			self setFileStream: (stringStream := WriteStream on: String new).
			visitBlock value.
			fileStream nextPutAll: stringStream contents withUnixLineEndings ]