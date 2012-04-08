visiting
visitOrganizationDefinition: defintion
	self
		writeInDirectoryName: '.'
		fileName: 'categories'
		visit: [ defintion categories do: [ :cat | stWriter writeCategory: cat ] ]