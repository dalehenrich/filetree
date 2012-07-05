tests
testPropertyDictionaryHtmlWrite
    | propertyDictionary stream |
    propertyDictionary := self propertyDictionary.
    stream := WriteStream on: String new.
    propertyDictionary writeCypressJsonForHtmlOn: stream.
    self assert: stream contents = self sampleHtmlJson