
!MCFileTreeWriter methodsFor: 'writing'!
addString: string at: path
	string isEmpty
		ifFalse: [ 
			self packageFileDirectory forceNewFileNamed: path do: [:file | file nextPutAll: string]] ! !
