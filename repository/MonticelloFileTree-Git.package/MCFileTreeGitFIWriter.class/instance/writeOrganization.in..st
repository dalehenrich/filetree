private-writing
writeOrganization: anArrayOfMCOrganizationDefinition in: aPackagePath
	"This thing looks awfully old / chunk format. Why is it still there?"

	self
		outputFileModify: aPackagePath , '/monticello.meta/categories.st'
		with:
			(String
				streamContents: [ :s | 
					anArrayOfMCOrganizationDefinition
						do: [ :e | 
							e categories
								do: [ :c | 
									s
										nextPutAll: 'SystemOrganization addCategory: ' , c printString , '!';
										nextPut: Character lf ] ] ])