private
ensureMetacelloBaseConfiguration
  Transcript
    cr;
    show: 'ensureMetacelloBaseConfiguration: [0]'.
  Smalltalk
    at: #'MetacelloBaseConfiguration'
    ifAbsent: [ 
      Transcript
        cr;
        show: 'ensureMetacelloBaseConfiguration: [1]'.
      #('http://smalltalkhub.com/mc/dkh/metacello/main' 'http://seaside.gemtalksystems.com/ss/metacello')
        do: [ :url | 
          | repository version |
          Transcript
            cr;
            show: 'ensureMetacelloBaseConfiguration: [2]: ' , url printString.
          repository := MCHttpRepository location: url user: '' password: ''.
          repository
            versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.19'
            do: [ :reader | 
              version := reader version.
              version load.
              version workingCopy repositoryGroup addRepository: repository.
              Transcript
                cr;
                show:
                    'ensureMetacelloBaseConfiguration: [2]: ' , version printString.
              ^ self ] ].
      self
        error:
          'Error bootstrapping Metacello: likely network error. Please try again' ]