resources
getTopCommitFor: packageName in: repositoryName
	"git log --pretty='%H' --max-count=1 ./"

	^ (MCFileTreeGitRepository
		runGitCommand: #('log' '--pretty=''%H''' '--max-count=1' './')
		in:
			(utilityClass
				directoryFromPath: repositoryName , '/' , packageName , MCFileTreeRepository defaultPackageExtension
				relativeTo: self getTestRepositoriesDirectory)) trimBoth