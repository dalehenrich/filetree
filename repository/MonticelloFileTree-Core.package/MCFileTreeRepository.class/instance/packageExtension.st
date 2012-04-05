private
packageExtension
    ^ self repositoryProperties at: 'packageExtension' ifAbsent: [ '.tree' ]