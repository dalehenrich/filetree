| gitPath repository |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Gofer new
  url: 'http://ss3.gemstone.com/ss/FileTree';
  package: 'ConfigurationOfFileTree';
  load.
((Smalltalk at: #'ConfigurationOfFileTree') project version: '1.0')
  load: 'default'.

repository := (Smalltalk at: #'MCFileTreeRepository') new
  directory: (FileDirectory on: gitPath , '/metacello-work/repository');
  yourself.

"Test by loading configuration from FileTree repo and then loading config"
Gofer new
  repository: repository;
  package: 'ConfigurationOfFileTree';
  load.

((Smalltalk at: #'ConfigurationOfFileTree') project version: #stable)
  load.

Transcript cr; show: 'SUCCESSFUL LOAD'.
