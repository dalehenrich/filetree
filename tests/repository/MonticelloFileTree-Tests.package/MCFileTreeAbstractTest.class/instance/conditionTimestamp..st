private
conditionTimestamp: aString
	"gemstone formats it's timestamps differently..."
	
	| ts | 
	ts := TimeStamp readFrom: aString readStream.
	^ts date mmddyyyy, ' ', (String streamContents: [:s | ts time print24: true on: s])