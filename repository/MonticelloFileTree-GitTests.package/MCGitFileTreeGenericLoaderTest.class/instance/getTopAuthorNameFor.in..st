resources
getTopAuthorNameFor: packageName in: repositoryName
	"get name and timestamp"

	^ (MCFileTreeGitRepository
		runGitCommand: #('log' '--pretty=''%an''' '--max-count=1' './')
		in:
			(utilityClass
				directoryFromPath: repositoryName , '/' , packageName , MCFileTreeRepository defaultPackageExtension
				relativeTo: self getTestRepositoriesDirectory)) trimBoth copyWithoutAll: ' '''