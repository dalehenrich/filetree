private
ensureMetacelloBaseConfiguration
  Smalltalk
    at: #'MetacelloBaseConfiguration'
    ifAbsent: [ 
      #('http://smalltalkhub.com/mc/dkh/metacello/main' 'http://seaside.gemtalksystems.com/ss/metacello')
        do: [ :url | 
          | repository version |
          repository := MCHttpRepository location: url user: '' password: ''.
          repository
            versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.19'
            do: [ :reader | 
              version := reader version.
              version load.
              version workingCopy repositoryGroup addRepository: repository.
              ^ self ] ].
      self
        error:
          'Error bootstrapping Metacello: likely network error. Please try again' ]