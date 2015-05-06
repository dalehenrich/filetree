private
cacheAllFileNamesDuring: aBlock 
	"https://github.com/dalehenrich/filetree/issues/132"
	| cacheInvalidated |
	cacheInvalidated := false.
	cacheInvalidationFlag ifNil: [cacheInvalidationFlag := true.
		cacheInvalidated := true.
		allFileNamesCache := nil.].
	
	^ [super cacheAllFileNamesDuring: aBlock]
		ensure: [cacheInvalidated ifTrue: [cacheInvalidationFlag := nil]]