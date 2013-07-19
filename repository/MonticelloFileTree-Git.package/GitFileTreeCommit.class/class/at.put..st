instance creation
at: anId put: parents
	^ self new
		id: anId;
		parents: parents