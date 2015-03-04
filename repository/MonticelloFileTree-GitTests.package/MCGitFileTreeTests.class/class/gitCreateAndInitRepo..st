resources
gitCreateAndInitRepo: dir
	#('init' 'config user.email "you@example.com"' 'config user.name "Your Name"')
		do: [ :c | MCFileTreeGitRepository runGitCommand: c in: dir ]