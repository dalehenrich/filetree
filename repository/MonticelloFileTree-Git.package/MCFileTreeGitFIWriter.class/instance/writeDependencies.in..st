private-writing
writeDependencies: anArrayOfVersionInfo in: aPackagePath
	"Write dependencies: empty files, just entries in a monticello.meta/dependencies/ directory"

	anArrayOfVersionInfo
		do: [ :each | 
			self
				outputFileModify: aPackagePath , '/monticello.meta/dependencies/' , each package name
				with:
					'(name ''' , each versionInfo name , ''' id '''
						, each versionInfo id asString , ''')' ].
	anArrayOfVersionInfo notEmpty
		ifTrue: [ self
				outputFileModify: aPackagePath , '/monticello.meta/.gitfiletree'
				with: '{ "SingleCommitForDependencies" : "true" }' ]