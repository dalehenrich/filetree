| repository repoDir gitCache |
gitCache := 'git_cache'.

Gofer new
  url: 'http://ss3.gemstone.com/ss/FileTree';
  package: 'ConfigurationOfFileTree';
  load.
((Smalltalk at: #'ConfigurationOfFileTree') project version: #'stable')
  load.

repoDir := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #FileSystem) workingDirectory / gitCache / 'filetree' / 'repository') ]
  ifNotNil: [:fileDirectoryClass | 
    (fileDirectoryClass default directoryNamed: gitCache, '/filetree/repository') ].

repository := (Smalltalk at: #'MCFileTreeRepository') new
      directory: repoDir;
      yourself.
 
"Test by loading configuration from FileTree repo and then loading config"
Gofer new
  repository: repository;
  package: 'ConfigurationOfFileTree';
  load.

((Smalltalk at: #'ConfigurationOfFileTree') project version: #stable)
  load.

Transcript cr; show: '-------------->SUCCESSFUL LOAD'; cr.
