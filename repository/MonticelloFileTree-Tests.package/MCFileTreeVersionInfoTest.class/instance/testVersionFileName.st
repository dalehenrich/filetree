tests
testVersionFileName
    | reader |
    reader := MCFileTreeStCypressReader new.
    self 
        assert: [reader isVersionFileName: 'Cypress-Mocks-dkh.10_ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Simple version file names should work';
        assert: [reader isVersionFileName: 'Cypress-Mocks.squeak-dkh.10_ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Version file names with branch should work';
        assert: [reader isVersionFileName: 'Cypress-Mocks.squeak-.10_ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Version file names without author (rare) should work';
        assert: [reader isVersionFileName: 'A-.1_ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Minimal version file names should work';
        deny: [reader isVersionFileName: 'A-.1ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Version name and UUID should be separated';
        deny: [reader isVersionFileName: '_ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Version name should be present';
        deny: [reader isVersionFileName: 'ad637421-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'Version name should be present';
        deny: [reader isVersionFileName: 'A-.1_']
        description: 'UUID should be present';
        deny: [reader isVersionFileName: 'A-.1']
        description: 'UUID should be present';
        deny: [reader isVersionFileName: 'A-.1_ad63742z-2d36-448b-a56d-34b9fdf3f7a8']
        description: 'UUID should be an UUID';
        deny: [reader isVersionFileName: 'Cypress-Mocks-dkh.10']
        description: 'It should be a version file name';
        deny: [reader isVersionFileName: 'version']
        description: 'It should be a version file name';
        yourself