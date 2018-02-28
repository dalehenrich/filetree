private-fast import
outputCommit: aVersion
	"Output the git fast-import commit information."

	"'commit' SP <ref> LF
	mark?
	('author' (SP <name>)? SP LT <email> GT SP <when> LF)?
	'committer' (SP <name>)? SP LT <email> GT SP <when> LF
	data
	('from' SP <commit-ish> LF)?
	('merge' SP <commit-ish> LF)?
	(filemodify | filedelete | filecopy | filerename | filedeleteall | notemodify)*
	LF?"

	"We use the current branch name, last commit and we add a commit on top of it."

	"commit {repositoryBranchName}
	committer {authorName} <{authorEmail}>
	data inline {aString size}
	{aString}
	from refs/heads/{repositoryBranchName}^0
	"

	self stream
		nextPutAll: 'commit refs/heads/';
		nextPutAll: self repository currentBranch;
		nextPut: Character lf.
	self stream
		nextPutAll: 'committer ';
		nextPutAll: (repository authorName: aVersion) utf8Encoded asString;
		nextPutAll: ' <';
		nextPutAll: (repository authorEmail: aVersion) utf8Encoded asString;
		nextPutAll: '> ';
		nextPutAll: aVersion info timeStamp asUnixTime printString;
		nextPut: Character space;
		nextPutAll: aVersion info timeStamp offset asEmailTimeOffsetString;
		nextPut: Character lf.
	self outputData: aVersion info message.
	self stream
		nextPutAll: 'from refs/heads/';
		nextPutAll: self repository currentBranch;
		nextPutAll: '^0';
		nextPut: Character lf