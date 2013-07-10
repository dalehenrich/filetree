utility
getTestRepositoriesDirectory
  "filetree test repository is located in the .../filetree/tests directory ... get a handle on it"

  | wc fileTreeRepo repoDir fileTreeRepoPath fileTreeRepoDir |
  MCWorkingCopy registry
    do: [ :mgr | 
      (mgr packageInfo includesClass: self class)
        ifTrue: [ wc := mgr ] ].
  wc ifNil: [ ^ self assert: false ].
  fileTreeRepo := (wc repositoryGroup repositories
    reject: [ :repo | MCCacheRepository default = repo ])
    detect: [ :repo | repo isKindOf: MCFileTreeRepository ].
  fileTreeRepoPath := fileTreeRepo directory fileTreeUtilityClass
    directoryPathString: fileTreeRepo directory.	"use fileTreeUtilityClass and path so we can test FileDirectory and FileSystem in same image"
  fileTreeRepoDir := self utilityClass directoryFromPath: fileTreeRepoPath.
  repoDir := self utilityClass parentDirectoryOf: fileTreeRepoDir.
  ^ self utilityClass
    directoryFromPath: 'tests/testRepositories'
    relativeTo: repoDir