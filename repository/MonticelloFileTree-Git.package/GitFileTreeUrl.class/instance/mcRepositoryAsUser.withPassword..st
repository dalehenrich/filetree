as yet unclassified
mcRepositoryAsUser: usernameString withPassword: passwordString
	"Where we create the repository."

	^ MCFileTreeGitRepository new directory: self asFileReference