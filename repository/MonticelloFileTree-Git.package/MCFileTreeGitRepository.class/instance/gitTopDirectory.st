git querying
gitTopDirectory
	^ gitTopLevelDirectory
		ifNil: [ gitTopLevelDirectory := (self
				gitCommand: #('rev-parse' '--show-toplevel')) trimRight
				asFileReference ]