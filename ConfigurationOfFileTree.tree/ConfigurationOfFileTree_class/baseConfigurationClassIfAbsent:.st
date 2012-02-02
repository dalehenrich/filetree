
!ConfigurationOfFileTree class methodsFor: 'private' stamp: 'dkh 1/30/2012 09:45'!
baseConfigurationClassIfAbsent: aBlock

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].
! !
