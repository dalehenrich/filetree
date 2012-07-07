baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec package: 'MonticelloFileTree-Core'.
            spec package: 'MonticelloFileTree-Tests' with: [ spec requires: 'MonticelloFileTree-Core' ].
            spec
                group: 'default' with: #('MonticelloFileTree-Core');
                group: 'Tests' with: #('MonticelloFileTree-Tests');
                group: 'TravisCI' with: #('Tests') ]