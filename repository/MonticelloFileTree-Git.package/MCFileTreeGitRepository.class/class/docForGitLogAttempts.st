documentation
docForGitLogAttempts
	"Some of this code is to test various options."

	"Design documentation:
	 - git log is reasonably fast
	 - git archive for each version is not that fast.
	This doc provides code for testing various choices."

	"Notes:
		- Issue 72 testWriteNRead shows that this code is brittle and require a full unified diff parser to work.
		- It should be possible to drop to git plumbing to retrieve the objects directly instead of asking for diffs; this would remove the need for the diff parser.
		- Git plumbing isn't the solution. Creating the processes is slow. Need to do only one PipeableOSProcess call if we are to make it fast."
		
		"TimeToRun on HP-DM1: 10263. Comparison with the git archive approach: 11754 for the full repo (two packages)."

	| c commitIDs allNames |
	[ 
	c := PipeableOSProcess
		command:
			'cd /home/thierry/src/GitFileTree/AltBrowser/Alt-Browser.package/monticello.meta/; git log --pretty="%H" version'.
	commitIDs := c output substrings.
	allNames := OrderedCollection new.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	commitIDs
		do: [ :commitID | 
			| info rawInfo |
			c := PipeableOSProcess
				command:
					'cd /home/thierry/src/GitFileTree/AltBrowser/Alt-Browser.package/monticello.meta/; git show ' , commitID , ':./version'.
			rawInfo := c output.
			c succeeded
				ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
			info := [ 
			((MCFileTreeGitStReader on: '/home/thierry/src/GitFileTree/AltBrowser' asFileReference fileName: 'Alt-Browser.package')
				commitID: commitID first) loadVersionInfo: rawInfo ]
				on: KeyNotFound
				do: [ nil ].
			info notNil
				ifTrue: [ allNames add: (GitFileTreePackageEntry on: 'Alt-Browser.package' id: commitID info: info) ] ].
	allNames ] timeToRun