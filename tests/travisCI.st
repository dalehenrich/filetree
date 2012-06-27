| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree tests"
Metacello new
  baseline: 'FileTreeTests';
  onUpgrade: [:ex | ex allow];
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
  load.
"workaround for https://github.com/dalehenrich/metacello-work/issues/61"
Metacello new
  baseline: 'FileTree';
  onUpgrade: [:ex | ex allow];
  repository: 'filetree://', gitPath, '/filetree/repository';
  load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

