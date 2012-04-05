*monticellofiletree-gemstone-extensions
writeDefinitions: aCollection
	"the correct initialization order is unknown if some classes are missing in the image"

	[ 
	aCollection do: [:ea | ea accept: self]
	 ] on: Error do: [ :ex | ex halt ]