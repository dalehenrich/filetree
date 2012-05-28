running
tearDownPackages: aGoferInstance
    #('AAA' 'BBB')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]