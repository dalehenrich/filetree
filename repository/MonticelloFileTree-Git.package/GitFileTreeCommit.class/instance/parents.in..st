accessing
parents: anArray in: root
	parents := anArray
		collect: [ :e | 
			root at: e ifAbsent: [self class at: e ] ]