writing
packageFileDirectory
    packageFileDirectory ifNil: [ packageFileDirectory := stream directory directoryNamed: directory ].
    ^ packageFileDirectory