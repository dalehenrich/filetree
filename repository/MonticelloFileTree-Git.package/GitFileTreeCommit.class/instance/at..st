finding
at: anId
	"Suppose ids are byte arrays. Suppose the tree is correctly ordered."

	id = anId
		ifTrue: [ ^ self ].
	parents notNil
		ifTrue: [ 
			parents
				do: [ :e | 
					(e at: anId)
						in: [ :r | 
							r notNil
								ifTrue: [ ^ r ] ] ] ].
	^ nil