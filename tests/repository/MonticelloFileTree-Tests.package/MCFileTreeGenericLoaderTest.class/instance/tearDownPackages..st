running
tearDownPackages: aPackageList
    aPackageList
        do: [ :packageName | 
            (MCWorkingCopy allManagers detect: [ :each | 
			each packageName = packageName ] ifNone: [ nil ]) 
				ifNotNil: [:wc | wc unload ] ]
