tests
testPropertyDictionaryRead
    | propertyDictionary phoneNumbers |
    propertyDictionary := MCFileTreeJsonParser parse: self sampleJson.
    self assert: (propertyDictionary at: 'name') = 'John Smith'.
    self assert: (propertyDictionary at: 'age') = 25.
    self assert: (propertyDictionary at: 'registered').
    phoneNumbers := propertyDictionary at: 'phoneNumber'.
    self assert: phoneNumbers size = 2.
    self assert: ((phoneNumbers at: 1) at: 'number') = '212 555-1234'.
    self assert: ((phoneNumbers at: 2) at: 'number') = '646 555-4567'