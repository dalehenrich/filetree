| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree tests"
Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  get.

Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  load: 'TravisCI'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTree' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

