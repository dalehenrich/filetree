tests
testCreateStonRepository
	"create repository and set propertyFileExtension to .ston"

	| workingDir tempDir |
	workingDir := self utilityClass default.
	tempDir := self utilityClass
		directoryFromPath: 'temp'
		relativeTo: workingDir.
	[ | repoDir repo newRepo |
	self utilityClass ensureDirectoryExists: tempDir.
	MCGitFileTreeTests gitCreateAndInitRepo: tempDir.
	repoDir := self utilityClass
		directoryFromPath: 'repo'
		relativeTo: tempDir.
	self utilityClass ensureDirectoryExists: repoDir.
	repo := MCFileTreeGitRepository new directory: repoDir.
	self assert: repo propertyFileExtension = '.json'.
	repo propertyFileExtension: '.ston'.
	self assert: repo propertyFileExtension = '.ston'.
	newRepo := MCFileTreeGitRepository new directory: repoDir.
	self assert: newRepo propertyFileExtension = '.ston' ]
		ensure: [ self utilityClass deleteAll: tempDir ]