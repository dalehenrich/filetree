*monticellofiletree-tests
filetreeUnload

	(MCWorkingCopy allManagers select: [ :wc | self package match: (wc package name) ])
		 do: [ :wc | 
 			 	self logCR: 'Unloading ', wc package asString.
 				wc unload.].
