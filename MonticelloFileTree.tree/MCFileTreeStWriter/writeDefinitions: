
!MCFileTreeStWriter methodsFor: 'initialize-release' stamp: 'ezra 5/13/2005 15:15'!
writeDefinitions: aCollection
	"the correct initialization order is unknown if some classes are missing in the image"

	[ 
	stWriter acceptVisitor: self forDefinitions: aCollection.
	self writeInitializers ] on: Error do: [ :ex | ex halt ]! !
