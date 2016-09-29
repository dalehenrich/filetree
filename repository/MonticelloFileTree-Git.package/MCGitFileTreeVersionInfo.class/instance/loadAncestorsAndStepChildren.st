private
loadAncestorsAndStepChildren
	"only loads into the repository it comes from."

	repo
		ifNotNil: [ :r | r versionWithInfo: self ]
		ifNil:
			[ MCRepositoryGroup default
				in: [ :r | r versionWithInfo: self ifNone: [  ] ] ]
