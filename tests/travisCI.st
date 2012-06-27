| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree base from the checkout ... make sure checkout and tests from same checkout"
Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
        load.
"load the FileTree tests"
Metacello new
  baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
	load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

