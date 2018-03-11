git querying
gitTopDirectory
	^ gitTopLevelDirectory
		ifNil: [ gitTopLevelDirectory := (self
				gitCommand: #('rev-parse' '--show-toplevel')
				in: directory) trimRight asFileReference ]