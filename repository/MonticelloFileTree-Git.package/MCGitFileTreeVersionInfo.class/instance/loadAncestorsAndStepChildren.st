private
loadAncestorsAndStepChildren
	"For a GitFileTree loaded version, search only in the repository of origin."

	repo
		ifNotNil: [ :r | r versionWithInfo: self ]
		ifNil: [ MCRepositoryGroup default
				in: [ :r | r versionWithInfo: self ifNone: [  ] ] ]