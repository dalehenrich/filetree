baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec package: 'MonticelloFileTree-Core'.
            spec group: 'default' with: #('MonticelloFileTree-Core') ]