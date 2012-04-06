tests
testPropertyDictionaryWrite
    | propertyDictionary stream |
    propertyDictionary := MCFileTreeJsonParser parse: self sampleJson.
    stream := WriteStream on: String new.
    propertyDictionary writeCypressJsonOn: stream indent: 0.
    self assert: stream contents = self sampleJson