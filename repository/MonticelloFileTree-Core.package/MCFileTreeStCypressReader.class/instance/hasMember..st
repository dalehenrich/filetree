private
hasMember: aFileName
	"Return true if the filetree format has a member of that name. The test is complete."

	^ self fileUtils filePathExists: aFileName relativeTo: self directoryForMember