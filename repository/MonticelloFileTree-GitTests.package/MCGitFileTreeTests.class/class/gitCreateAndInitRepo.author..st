as yet unclassified
gitCreateAndInitRepo: dir author: aName
	^ PipeableOSProcess
		command:
			'cd ' , (MCFileTreeFileUtils current directoryPathString: dir) , '; git init; git config user.email "you@example.com"; git config user.name "' , aName , '"'