private
baseConfigurationClassIfAbsent: aBlock
  ^ Smalltalk
    at: #'MetacelloBaseConfiguration'
    ifAbsent: [ 
      Transcript
        cr;
        show: 'baseConfigurationClassIfAbsent: [1]'.
      self ensureMetacelloBaseConfiguration.
      Smalltalk at: #'MetacelloBaseConfiguration' ifAbsent: aBlock ]