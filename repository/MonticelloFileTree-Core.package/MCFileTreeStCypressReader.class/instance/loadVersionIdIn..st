private
loadVersionIdIn: aDirectory
    
    self flag: #topa.
    self flag: #todo. "we can detect svn/hg/git etc. merge conflicts here..."
    self fileUtils readStreamFor: 'version' in: aDirectory do: [ :fileStream | 
        ^ fileStream contents withBlanksTrimmed ].
