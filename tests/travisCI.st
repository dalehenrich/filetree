| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"just load the FileTree configuration ... no tests at the moment"
Metacello new
	configuration: 'FileTree';
  version: #development;
  repository: 'filetree://', gitPath, '/filetree/repository';
	load.

