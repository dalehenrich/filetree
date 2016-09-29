private
conditionTimestamp: aString
	"gemstone formats it's timestamps differently..."

	| ts |
	ts := DateAndTime fromString: aString.
	^ ts asDate mmddyyyy , ' ' , (String streamContents: [ :s | ts asTime print24: true on: s ])