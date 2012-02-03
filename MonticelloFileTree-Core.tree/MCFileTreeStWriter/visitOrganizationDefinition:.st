
!MCFileTreeStWriter methodsFor: 'visiting'!
visitOrganizationDefinition: defintion
	self
		writeInDirectoryName: '.'
		fileName: 'categories'
		extension: '.st'
		visit: [ defintion categories do: [ :cat | stWriter writeCategory: cat ] ]! !
