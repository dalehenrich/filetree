tests
testPropertyDictionaryWrite
    | propertyDictionary stream |
    propertyDictionary := self propertyDictionary.
    stream := WriteStream on: String new.
    propertyDictionary writeCypressJsonOn: stream.
    self assert: stream contents withUnixLineEndings = self sampleJson withUnixLineEndings