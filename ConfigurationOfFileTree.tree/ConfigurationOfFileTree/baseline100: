
!ConfigurationOfFileTree methodsFor: 'baselines' stamp: 'dkh 1/31/2012 15:19'!
baseline100: spec
    <version: '1.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec package: 'MonticelloFileTree-Core'.
            spec group: 'default' with: #('MonticelloFileTree-Core') ].
    spec
        for: #'gemstone'
        do: [ 
            spec package: 'MonticelloFileTree-Core' with: [ spec includes: 'MonticelloFileTree-GemStone-Extensions' ].
            spec package: 'MonticelloFileTree-GemStone-Extensions' with: [ spec requires: 'MonticelloFileTree-Core' ] ]! !
