instance creation
on: aPackageDirectory id: aCommitID parentIDs: parentIDs author: aString message: aMessage timeStamp: aDateAndTime
	^ self new
		packageDirectory: aPackageDirectory;
		commitID: aCommitID;
		parentIDs: parentIDs;
		author: aString;
		message: aMessage;
		timeStamp: aDateAndTime