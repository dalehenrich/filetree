| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree tests"
Metacello new
  baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
  load.
"load FileTree core - Baseline for FileTreeTests directly references a 
  branch and when a test is being run in an issue_* branch, the bugfix 
  isn't available"
Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

