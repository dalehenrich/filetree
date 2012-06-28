| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree tests"
Metacello new
  baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
  load.
"workaround for https://github.com/dalehenrich/metacello-work/issues/61"
MetacelloProjectRegistration resetRegistry.
Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

