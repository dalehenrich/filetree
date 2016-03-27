resources
getTopTimestampFor: packageName in: repositoryName
	"get name and timestamp"

	^ (self getTopAuthorNameFor: packageName in: repositoryName) , ' '
		, (self getTopDateAndTimeFor: packageName in: repositoryName)