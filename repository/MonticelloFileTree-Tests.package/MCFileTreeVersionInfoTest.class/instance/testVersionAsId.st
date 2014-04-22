tests
testVersionAsId
    | versionInfo id |
    id := UUID fromString: '38c683f8-288c-45f1-925f-9c698ef709c9'.
    versionInfo := self mockVersionInfo: 'x'  id: id.
    self
        assert: (sut versionId: versionInfo)
        equals: '38c683f8-288c-45f1-925f-9c698ef709c9'
        description: 'A version info id should match the UUID';
        assert: (String streamContents: [:s| sut versionAsId: versionInfo on: s])
        equals: '(id ''38c683f8-288c-45f1-925f-9c698ef709c9'')'
        description: 'A version info id ref should contain (id ... )'