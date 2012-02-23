
!ConfigurationOfFileTree methodsFor: 'baselines'!
baseline100: spec
    <version: '1.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
		spec repository: 'http://ss3.gemstone.com/ss/FileTree'.
            spec package: 'MonticelloFileTree-Core'.
            spec group: 'default' with: #('MonticelloFileTree-Core') ].
    spec
        for: #'gemstone'
        do: [ 
            spec package: 'MonticelloFileTree-Core' with: [ spec includes: 'MonticelloFileTree-GemStone-Extensions' ].
            spec package: 'MonticelloFileTree-GemStone-Extensions' with: [ spec requires: 'MonticelloFileTree-Core' ] ]! !
