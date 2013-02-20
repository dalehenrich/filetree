utility
validateAgainst: expectedDefinitions for: packageName
    | packageDefinitions |
    packageDefinitions := (MCPackage new name: packageName) snapshot definitions.
    self assert: expectedDefinitions size = packageDefinitions size.
    packageDefinitions do: [ :def | self assert: (expectedDefinitions includes: def) ]