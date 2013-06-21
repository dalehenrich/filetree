documentation
docForGitLogAttempts2
	"Some of this code is to test various options."

	"Design documentation:
	 - git log is reasonably fast
	 - git archive for each version is not that fast.
	This doc provides code for testing various choices."

	"Testing a solution encapsulating the object and the commitID in one go."
	
	"timeToRun: 5135 (x2 sur l'ancienne version). Mais timeToRun: 1862 sur la partie OSProcess seule."

	| c commitIDs allNames tag |
	tag := '^øø--øø^'.
	[ 
	c := PipeableOSProcess
		command:
			'cd /home/thierry/src/GitFileTree/AltBrowser/Alt-Browser.package/monticello.meta/; for i in `git log --pretty="%H" version`; do echo "'
				, tag , '"; echo $i; echo "' , tag , '"; echo `git show $i:./version`; done'.
	commitIDs := ReadStream on: c output.
	allNames := OrderedCollection new.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	self assert: (commitIDs match: tag).
	[ commitIDs atEnd ]
		whileFalse: [ 
			| commitID rawInfo info |
			commitID := commitIDs upToAll: tag.
			rawInfo := commitIDs upToAll: tag.
			info := [ 
			((MCFileTreeGitStReader on: '/home/thierry/src/GitFileTree/AltBrowser' asFileReference fileName: 'Alt-Browser.package')
				commitID: commitID) loadVersionInfo: rawInfo ]
				on: KeyNotFound
				do: [ nil ].
			info notNil
				ifTrue: [ allNames add: (GitFileTreePackageEntry on: 'Alt-Browser.package' id: commitID info: info) ] ].
	allNames ] timeToRun