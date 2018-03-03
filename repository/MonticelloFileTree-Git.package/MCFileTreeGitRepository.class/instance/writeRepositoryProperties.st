i/o
writeRepositoryProperties
	"When writing the repository properties, commit them as well."

	| string |
	string := MCGitFileTreeWriter
		fileOutSingleFile: self subDirectoryString , '.filetree'
		in: self
		with: (STON toJsonStringPretty: self repositoryProperties).
	self
		gitCommand: #('fast-import')
		in: self gitTopDirectory
		withInput: string contents.
	self gitCommand: {'reset' . 'HEAD' . '.filetree'} in: directory.
	self gitCommand: {'checkout' . 'HEAD' . '.filetree'} in: directory