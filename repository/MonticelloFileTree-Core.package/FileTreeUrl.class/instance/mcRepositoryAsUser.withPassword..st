as yet unclassified
mcRepositoryAsUser: usernameString withPassword: passwordString
	"Where we create the repository."

	^ MCFileTreeRepository new directory: self asFileReference