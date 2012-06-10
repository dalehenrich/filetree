"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache').

"prime the pump with FileTree install using Metacello scripting API"
Metacello new
	baseline: 'FileTree';
  repository: 'filetree://', gitPath, 'filetree/repository';
  load.

"load the file tree tests"
Metacello new
	baseline: 'FileTreeTests';
  repository: 'filetree://', gitPath, 'filetree/tests/repository';
	load.

"Run the tests"
| projectName suite result stream |
projectName := 'FileTreeTests'.
suite := TestCase suiteClass named: projectName, ' Suite'.
(((MetacelloProjectRegistration
	registrationForProjectNamed: 'FileTreeTests' ifAbsent: []) baselineProjectSpec version currentlyLoadedClassesInVersion) select: [:cl | cl inheritsFrom: TestCase ]) do: [:cl |
		cl isAbstract ifFalse: [ suite addTest: cl buildSuiteFromSelectors]].
result := suite run.
stream := WriteStream on: String new.
stream nextPutAll: 'Results for ', suite name; cr.
result printOn: stream.
stream cr.
result defects do: [:each | 
	stream 
		tab
		nextPutAll: each class, ' debug: ', each testSelector printString. '.';
		cr.].
FileDirectory default 
	forceNewFileNamed: 'TravisCIResults.txt' 
	do: [:fileStream | 
		fileStream lineEndConvention: #'lf'..
		fileStream nextPutAll: stream contents ]. 
