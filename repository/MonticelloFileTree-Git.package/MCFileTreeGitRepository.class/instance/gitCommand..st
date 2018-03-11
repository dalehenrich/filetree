private
gitCommand: aCommandString
	"I often use the git top directory for the commands."

	^ self class runGitCommand: aCommandString in: self gitTopDirectory