private
cacheAllFileNamesDuring: aBlock 
	"https://github.com/dalehenrich/filetree/issues/132"

	allFileNamesCache := nil.
	^super cacheAllFileNamesDuring: aBlock 