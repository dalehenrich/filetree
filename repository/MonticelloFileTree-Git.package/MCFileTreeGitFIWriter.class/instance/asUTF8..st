private
asUTF8: aString
	"Output a string. Make sure conversions are done properly (to utf8)."

	"Issue: I need to know how long is the string once encoded to utf8!"

	^ String
		streamContents: [ :aStream | 
			| in encoder |
			encoder := ZnUTF8Encoder new.
			in := aString readStream.
			[ in atEnd ]
				whileFalse: [ aStream nextPut: (encoder nextFromStream: in) ] ]