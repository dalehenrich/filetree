accessing
stream
	^ stream ifNil: [ stream := WriteStream on: ByteArray new ]