accessing
runProcessWrapperGitCommand: anArrayOfStrings in: aDirectory
	"Enclose all parameters with double quotes to protect."

	| r aCommandString |
	aCommandString := String
		streamContents: [ :stream | 
			anArrayOfStrings
				do: [ :e | 
					stream
						nextPut: $";
						nextPutAll: e;
						nextPutAll: '" ' ] ].
	(Smalltalk at: #ProcessWrapper ifAbsent: [ self error: 'Please load ProcessWrapper' ])
		ifNotNil: [ :pW | 
			r := pW new
				useStdout;
				startWithShellCommand:
						self gitCommand , ' -C "' , (MCFileTreeFileUtils current directoryPathString: aDirectory) , '" ' , aCommandString;
				upToEnd ].
	^ r