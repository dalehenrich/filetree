| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"load the FileTree tests ... make sure we're using the baseline
associated with git checkout under test ... Metacello may not be
loading the one we want..."
[
Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  get.

Metacello new
  baseline: 'FileTree';
  repository: 'filetree://', gitPath, '/filetree/repository';
  load: 'TravisCI' ]
    on: Warning
    do: [:ex |
      Transcript cr; show: 'Warning: ', ex description.
      ex resume ].

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfFileTree' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

