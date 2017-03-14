tests
testPropertyDictionaryHtmlRead
    | propertyDictionary phoneNumbers |
    propertyDictionary := STON fromString: self sampleHtmlJson.
    self assert: (propertyDictionary at: 'name') cypressUnescape = 'John Smith'.
    self assert: (propertyDictionary at: 'age') = 25.
    self assert: (propertyDictionary at: 'registered').
    phoneNumbers := propertyDictionary at: 'phoneNumber'.
    self assert: phoneNumbers size = 2.
    self assert: ((phoneNumbers at: 1) at: 'number') cypressUnescape = '212 555-1234'.
    self assert: ((phoneNumbers at: 2) at: 'number') cypressUnescape = '646 555-4567'