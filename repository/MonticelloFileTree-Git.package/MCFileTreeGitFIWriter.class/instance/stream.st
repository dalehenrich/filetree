accessing
stream
	^ stream ifNil: [ stream := WriteStream on: String new ]