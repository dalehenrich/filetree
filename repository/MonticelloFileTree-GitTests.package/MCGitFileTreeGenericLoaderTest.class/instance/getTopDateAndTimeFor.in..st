resources
getTopDateAndTimeFor: packageName in: repositoryName
	"get name and timestamp"

	^ (DateAndTime
		fromString:
			(MCFileTreeGitRepository
				runGitCommand: #('log' '--pretty=''%ai''' '--max-count=1' './')
				in:
					(utilityClass
						directoryFromPath: repositoryName , '/' , packageName , MCFileTreeRepository defaultPackageExtension
						relativeTo: self getTestRepositoriesDirectory))) in: [ :d | d asDate mmddyyyy , ' ' , d asTime print24 ]