
!ConfigurationOfFileTree class methodsFor: 'loading' stamp: 'dkh 1/30/2012 09:45'!
load
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load! !
