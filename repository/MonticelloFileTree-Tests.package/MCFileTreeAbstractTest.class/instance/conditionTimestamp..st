private
conditionTimestamp: aString
	"gemstone formats it's timestamps differently..."
	
	| ts | 
	ts := TimeStamp readFrom: aString readStream.
	^ts asDate mmddyyyy, ' ', (String streamContents: [:s | ts asTime print24: true on: s])