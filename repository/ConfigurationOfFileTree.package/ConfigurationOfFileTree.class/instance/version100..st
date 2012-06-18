versions
version100: spec
    <version: '1.0' imports: #('1.0-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'FileTree 1.0 (dkh.24):'.
            spec author: 'dkh'.
            spec timestamp: '6/16/2012 21:03' ].
    spec
        for: #'pharo'
        do: [ spec package: 'MonticelloFileTree-Core' with: [ spec file: 'MonticelloFileTree-Core.pharo13-dkh.70' ] ].
    spec
        for: #'squeak'
        do: [ spec package: 'MonticelloFileTree-Core' with: [ spec file: 'MonticelloFileTree-Core.squeak43-dkh.70' ] ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'GsCore' with: '0.246';
                project: 'Monticello' with: '0.243'.
            spec package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.89' ]