| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Transcript cr; show: 'travis---->before FileTree tests load'.
Transcript cr; show: 'travis---->repository path: ', ('filetree://', gitPath, '/filetree/tests/repository') printString.

"load the FileTree tests"
Metacello new
  baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
  load.

Transcript cr; show: 'travis---->before test run'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

