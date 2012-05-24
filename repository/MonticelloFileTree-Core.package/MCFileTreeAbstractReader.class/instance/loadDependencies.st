utilities
loadDependencies
    | dependencyDir |
    dependencyDir := (packageDirectory directoryNamed: self monticelloMetaDirName) directoryNamed: 'dependencies'.
    dependencyDir exists
        ifFalse: [ ^ dependencies := #() ].
    dependencies := OrderedCollection new.
    dependencyDir entries
        do: [ :entry | 
            dependencies
                add:
                    (MCVersionDependency
                        package: (MCPackage named: entry name)
                        info:
                            (self extractInfoFrom: (self parseMember: 'dependencies' , FileDirectory slash , entry name))) ].
    dependencies := dependencies asArray