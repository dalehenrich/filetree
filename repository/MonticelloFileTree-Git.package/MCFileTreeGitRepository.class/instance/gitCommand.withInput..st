private
gitCommand: aCommandString withInput: aString
	"Often, we do that into the top git directory."

	^ self class
		runGitCommand: aCommandString
		in: self gitTopDirectory
		withInput: aString