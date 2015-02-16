private
loadVersionFromGit: aCommitID in: aRepository
	"Does a load of the package in this repository"
	
	version := aRepository versionFromPackageName: package name commit: aCommitID.
	package := version info name