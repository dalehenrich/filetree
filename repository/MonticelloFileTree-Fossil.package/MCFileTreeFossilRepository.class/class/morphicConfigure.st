instance creation
morphicConfigure
	"Use it to configure a fossil repository from the Monticello GUI."

	^ (UITheme current
		fileOpenIn: World
		title: 'Choose fossil repository file to open'
		extensions: #('*.fossil')
		path: FileSystem workingDirectory
		preview: nil)
		ifNotNil: [ :aFileReference | self new fossilFile: aFileReference ]