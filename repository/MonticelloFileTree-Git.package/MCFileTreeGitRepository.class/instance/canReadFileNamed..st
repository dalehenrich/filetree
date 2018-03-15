testing
canReadFileNamed: aString
	| filename extension |
	filename := self subDirectoryString , aString.
	(filename lastIndexOf: $.)
		in: [ :i | 
			i > 0
				ifFalse: [ ^ false ]
				ifTrue: [ extension := filename copyFrom: i to: filename size ] ].
	extension ifEmpty: [ ^ false ].
	^ (extension ~= '.package'
		and: [ (self gitEntriesFor: filename)
				in: [ :es | 
					#('version' 'package')
						allSatisfy: [ :t | es anySatisfy: [ :e | e name = t ] ] ] ])
		or: [ extension = '.package' ]
