baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:pharo1.3/repository' ].
            spec package: 'MonticelloFileTree-Tests' with: [ spec requires: 'FileTree' ].
            spec
                group: 'default' with: #('Tests');
                group: 'Tests' with: #('MonticelloFileTree-Tests');
                group: 'TravisCI' with: #('Tests') ]