actions
fileDirectoryOn: fileName
	^ ServerFileDirectory on: (self directory fullNameFor: fileName)
