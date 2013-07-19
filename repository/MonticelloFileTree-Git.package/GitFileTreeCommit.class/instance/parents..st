accessing
parents: anArray
	parents := anArray collect: [ :e | self class at: e ]