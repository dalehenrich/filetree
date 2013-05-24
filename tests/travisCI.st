| gitPath |
gitPath := (FileSystem workingDirectory / 'git_cache') pathString.

"load the FileTree tests ... make sure we're using the baseline
associated with git checkout under test ... Metacello may not be
loading the one we want..."
Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  get.

Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  onConflict: [:ex | 
    "allow new version of FileTree to be loaded"
    ex existingProjectRegistration baseName = 'FileTree'
      ifTrue: [ ex allow ].
    ex disallow ];
  load: 'TravisCI'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTree' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

