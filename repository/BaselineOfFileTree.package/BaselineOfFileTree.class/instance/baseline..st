baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core';
                package: 'MonticelloFileTree-Tests' with: [ spec requires: #('default') ];
                package: 'MonticelloFileTree-FileSystem-Utilities'
                    with: [ spec requires: #('MonticelloFileTree-Core') ];
                package: 'MonticelloFileTree-FileSystem-Tests'
                    with: [ spec requires: #('MonticelloFileTree-Tests') ].
            spec
                group: 'default' with: #('MonticelloFileTree-Core' 'MonticelloFileTree-FileSystem-Utilities');
                group: 'Tests' with: #('MonticelloFileTree-Tests' 'MonticelloFileTree-FileSystem-Tests');
                group: 'TravisCI' with: #('Tests') ]