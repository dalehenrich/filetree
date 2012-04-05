as yet unclassified
canReadFileNamed: aString
    ^ (aString endsWith: self packageExtension) or: [ aString endsWith: '.tree' ]