baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'MonticelloFileTree-Core';
                package: 'MonticelloFileTree-Tests' with: [ spec requires: #('default') ];
                package: 'MonticelloFileTree-FileDirectory-Utilities'
                    with: [ spec requires: #('MonticelloFileTree-Core') ];
                package: 'MonticelloFileTree-FileDirectory-Tests'
                    with: [ spec requires: #('MonticelloFileTree-Tests') ].
            spec
                group: 'default' with: #('MonticelloFileTree-Core' 'MonticelloFileTree-FileDirectory-Utilities');
                group: 'Tests' with: #('MonticelloFileTree-Tests' 'MonticelloFileTree-FileDirectory-Tests');
                group: 'TravisCI' with: #('Tests') ]