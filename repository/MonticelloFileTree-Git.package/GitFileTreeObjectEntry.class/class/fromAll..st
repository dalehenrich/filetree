instance creation
fromAll: aString
	"Extracted from a string containing the lines of git ls-tree"

	^ aString lines collect: [ :aLine | self from: aLine ]