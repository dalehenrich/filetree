git querying
gitTopDirectory
	^ (self gitCommand: #('rev-parse' '--show-toplevel') in: directory)
		trimRight asFileReference