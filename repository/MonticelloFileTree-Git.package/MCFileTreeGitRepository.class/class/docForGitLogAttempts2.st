documentation
docForGitLogAttempts2
	"Some of this code is to test various options."

	"Testing a solution encapsulating the object and the commitID in one go."
	
	"MCFileTreeGitRepository docForGitLogAttempts2"
	
	"timeToRun: 5135 (x2 sur l'ancienne version). Mais timeToRun: 1862 sur la partie OSProcess seule. timeToRun on splitting then scanning the info: 3818. timeToRun for splitting: 392. Longuest bit is the scan."
	
	"Minimizing the scan: 474 to split and scan :) Removing the error handling... 450. Result is correct."

	| c commitIDs allNames tag |
	tag := '^øø--øø^'.
	c := PipeableOSProcess
		command:
			'cd /home/thierry/src/GitFileTree/AltBrowser/Alt-Browser.package/monticello.meta/; for i in `git log --pretty="%H" version`; do echo "'
				, tag , '"; echo $i; echo "' , tag , '"; echo `git show $i:./version`; done'.
	commitIDs := ReadStream on: c output.
	allNames := OrderedCollection new.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	self assert: (commitIDs match: tag).
	^ [ [ commitIDs atEnd ]
		whileFalse: [ 
			| commitID rawInfo info |
			commitID := commitIDs upToAll: tag.
			rawInfo := (ReadStream on: (commitIDs upToAll: tag)) upToAll: 'ancestors'.
			info := "["
			((MCFileTreeGitStReader on: '/home/thierry/src/GitFileTree/AltBrowser' asFileReference fileName: 'Alt-Browser.package')
				commitID: commitID) loadVersionInfo: rawInfo , 'ancestors () stepChildren ())' "]
				on: KeyNotFound
				do: [ nil ]".
			info notNil
				ifTrue: [ allNames add: (GitFileTreePackageEntry on: 'Alt-Browser.package' id: commitID info: info) ] ].
	allNames ] timeToRun