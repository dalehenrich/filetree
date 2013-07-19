finding
allIDs
	"Return all the ids seen."

	^ Array
		streamContents: [ :s | 
			s nextPut: id.
			parents notNil
				ifTrue: [ parents do: [ :e | s nextPutAll: e allIDs ] ] ]