private
allVersionNames
	"https://github.com/dalehenrich/filetree/issues/132"

	^ self readableFileNames collect: [ :each | each versionName ] 