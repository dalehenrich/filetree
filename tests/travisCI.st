| gitPath packageName testRepoPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree tests"
Metacello new
  baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, '/filetree/tests/repository';
  load.

testRepoPath := gitPath, '/filetree/tests/testRepositories/cuisCypress'.
packageName := 'Cypress-Mocks'.
Gofer new
    disablePackageCache;
    repository: (MCFileTreeRepository new directory: 
                   (FileDirectory on: testRepoPath));
    package: packageName;
     load.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTreeTests' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

