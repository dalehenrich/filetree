baselines
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
        for: #'pharo'
        do: [ spec package: 'MonticelloFileTree-Core' with: [ spec file: 'MonticelloFileTree-Core.pharo13' ] ].
    spec
        for: #'squeak'
        do: [ spec package: 'MonticelloFileTree-Core' with: [ spec file: 'MonticelloFileTree-Core.squeak43' ] ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'GsCore'
                    with: [ 
                            spec
                                className: 'ConfigurationOfGsCore';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
                project: 'Monticello'
                    with: [ 
                            spec
                                className: 'ConfigurationOfGsMonticello';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
            spec package: 'MonticelloFileTree-Core' with: [ 
			spec 
				file: 'MonticelloFileTree-Core.gemstone24';
				requires: #( 'GsCore'  'Monticello' ) ] ]