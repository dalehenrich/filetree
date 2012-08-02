utilities
loadDependencies
    | dependencyDir |
    dependencyDir := self packageDirectory / self monticelloMetaDirName / 'dependencies'.
    dependencyDir exists
        ifFalse: [ ^ dependencies := #() ].
    dependencies := OrderedCollection new.
    dependencyDir entries
        do: [ :entry | 
            dependencies
                add:
                    (MCVersionDependency
                        package: (MCPackage named: entry basename)
                        info:
                            (self extractInfoFrom: (self parseMember: 'dependencies' , Path delimiter , entry basename))) ].
    dependencies := dependencies asArray