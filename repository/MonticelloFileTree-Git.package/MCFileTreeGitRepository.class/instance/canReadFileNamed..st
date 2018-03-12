testing
canReadFileNamed: aString
	| filename extension |
	filename := self subDirectoryString , aString.
	extension := filename
		copyFrom: (filename lastIndexOf: $.)
		to: filename size.
	extension ifEmpty: [ ^ false ].
	^ (extension ~= '.package'
		and: [ (self gitEntriesFor: filename)
				in: [ :es | 
					#('version' 'package')
						allSatisfy: [ :t | es anySatisfy: [ :e | e name = t ] ] ] ])
		or: [ extension = '.package' ]
