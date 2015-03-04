as yet unclassified
gitCreateAndInitRepo: dir
	^ PipeableOSProcess
		command:
			'cd "' , (MCFileTreeFileUtils current directoryPathString: dir)
				, '"; git init; git config user.email "you@example.com"; git config user.name "Your Name"'