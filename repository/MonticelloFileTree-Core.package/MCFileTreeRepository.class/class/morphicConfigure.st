instance creation
morphicConfigure
	^ (UIManager default chooseDirectoryFrom: self defaultDirectoryName asDirectory) ifNotNil:
		[:directory | | dir |
		dir := self new directory: (FileDirectory on: directory fullName).
		dir inspect.
		dir]