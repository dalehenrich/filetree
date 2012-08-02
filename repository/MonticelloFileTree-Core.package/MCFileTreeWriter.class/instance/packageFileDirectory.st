writing
packageFileDirectory
    packageFileDirectory ifNil: [ packageFileDirectory := stream directory / directory ].
    ^ packageFileDirectory