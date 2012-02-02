
!MCFileTreeStWriter methodsFor: 'visiting' stamp: 'dkh 2/1/2012 20:02'!
visitOrganizationDefinition: defintion
	self
		writeInDirectoryName: '.'
		fileName: 'categories'
		extension: '.st'
		visit: [ defintion categories do: [ :cat | stWriter writeCategory: cat ] ]! !
