resources
gitCreateAndInitRepo: dir author: aName
	{#('init').
	#('config' 'user.email' 'you@example.com').
	{'config'.
	'user.name'.
	aName}} do: [ :c | MCFileTreeGitRepository runGitCommand: c in: dir ]