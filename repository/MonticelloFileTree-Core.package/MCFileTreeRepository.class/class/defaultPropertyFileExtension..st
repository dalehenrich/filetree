accessing
defaultPropertyFileExtension: aString
  "self defaultPropertyFileExtension:'.ston'"

  (#('.json' '.ston') includes: aString)
    ifFalse: [ self error: 'Unsupported property file extension: ' , aString printString ].
  defaultPropertyFileExtension := aString