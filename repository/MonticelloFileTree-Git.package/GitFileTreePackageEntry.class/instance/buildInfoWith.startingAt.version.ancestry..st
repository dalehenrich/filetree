building
buildInfoWith: aList startingAt: anIndex version: aNumber ancestry: aDictionary
	"Build the MCVersionInfo we need with all the relevant data."

	| ancestors aIDs stack |
	ancestors := OrderedCollection new.
	stack := OrderedCollection new.
	aIDs := OrderedCollection new.
	stack addAll: (aDictionary at: commitID) parents.
	[ stack isEmpty ]
		whileFalse: [ 
			| newStack j found |
			newStack := OrderedCollection new.
			stack
				do: [ :current | 
					j := anIndex.
					found := false.
					(aIDs includes: current)
						ifTrue: [ found := true ].
					[ j <= aList size and: [ found not ] ]
						whileTrue: [ 
							(aList at: j) commitID = current id
								ifTrue: [ 
									ancestors add: (aList at: j) info.
									aIDs add: current.
									found := true ].
							j := j + 1 ].
					found
						ifFalse: [ newStack addAll: current parents ] ].
			stack := newStack ].
	info := MCVersionInfo
		name: (packageDirectory copyUpToLast: $.) , '-' , author , '.' , aNumber printString
		id: (self class uuidFromGitSHA: commitID)
		message: message
		date: timeStamp asDate
		time: timeStamp asTime
		author: author
		ancestors: ancestors asArray