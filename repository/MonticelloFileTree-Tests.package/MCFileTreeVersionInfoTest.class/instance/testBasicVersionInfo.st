tests
testBasicVersionInfo

    | versionInfo a idA s idS id date time |
    id := UUID fromString: '38c683f8-288c-45f1-925f-9c698ef709c9'.
    idA := UUID fromString: '67a5ce1e-2250-438e-9674-f8311d61dbf8'.
    idS :=UUID fromString: '1cdad4e2-be6f-41ee-9232-e30adea1f576'.
    date := Date fromString: '14 September 2013'.
    time := Time fromString: '3:16:03.776 pm'.
    a := {self mockVersionInfo: 'a' id: idA}.
    s := {self mockVersionInfo: 's' id: idS}.
    versionInfo := self mockVersionInfo: 'x'  id: id date: date time: time ancestors: a stepChildren: s.
    self
        assert: (sut basicVersionInfo: versionInfo)
        equals: self expectedBasicVersionInfo
        description: 'A version info should be serialized to expected format'