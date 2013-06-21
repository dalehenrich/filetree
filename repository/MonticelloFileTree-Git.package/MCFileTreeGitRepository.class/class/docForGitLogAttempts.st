documentation
docForGitLogAttempts
	"Some of this code is to test various options."

	"Design documentation:
	 - git log is reasonably fast
	 - git archive for each version is not that fast.
	This doc provides code for testing various choices."
	
	"Notes:
		- Issue 72 testWriteNRead shows that this code is brittle and require a full unified diff parser to work.
		- It should be possible to drop to git plumbing to retrieve the objects directly instead of asking for diffs; this would remove the need for the diff parser."
	

	| c output commitIDs allNames |
	[ 
	c := PipeableOSProcess
		command:
			'cd /home/thierry/src/gitfiletree/AltBrowser/Alt-Browser.package/monticello.meta/; git log --pretty="%H" -p version'.
	allNames := OrderedCollection new.
	output := c output findTokens: Character lf.
	commitIDs := (1 to: output size by: 10)
		collect: [ :i | 
			Array
				with: (output at: i)
				with:
					((output at: i + 5) = '@@ -1 +1 @@'
						ifTrue: [ output at: i + 8 ]
						ifFalse: [ 
							(output at: i + 6) = '@@ 0,0 +1 @@'
								ifTrue: [ output at: i + 6 ]
								ifFalse: [ ' ' ] ]) allButFirst ].
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	commitIDs
		do: [ :commitID | 
			| info |
			info := [ 
			((MCFileTreeGitStReader on: '/home/thierry/src/gitfiletree/AltBrowser' asFileReference fileName: 'Alt-Browser.package')
				commitID: commitID first) loadVersionInfo: commitID last ]
				on: KeyNotFound
				do: [ nil ].
			info notNil
				ifTrue: [ allNames add: (GitFileTreePackageEntry on: 'Alt-Browser.package' id: commitID info: info) ] ].
	allNames ] timeToRun