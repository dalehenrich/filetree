private-fast import
outputCommit: authorNameAsString email: authorEmailAsString time: aTimeStamp message: aString
	"Output the git fast-import commit information. Get all raw values."

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

	self
		nextPutAll: 'commit refs/heads/';
		nextPutAll: self repository currentBranch;
		lf.
	self
		nextPutAll: 'committer ';
		nextPutAll: authorNameAsString;
		space;
		nextPutAll: authorEmailAsString;
		space;
		nextPutAll: aTimeStamp asUnixTime printString;
		space;
		nextPutAll: aTimeStamp offset asEmailTimeOffsetString;
		lf.
	self outputData: aString.
	self
		nextPutAll: 'from refs/heads/';
		nextPutAll: self repository currentBranch;
		nextPutAll: '^0';
		lf