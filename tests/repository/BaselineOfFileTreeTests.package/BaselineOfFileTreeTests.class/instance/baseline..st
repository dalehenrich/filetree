baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [
            spec baseline: 'FileTree'.
            spec package: 'MonticelloFileTree-Tests' with: [ spec requires: 'FileTree' ].
            spec
                group: 'default' with: #('Tests');
                group: 'Tests' with: #('MonticelloFileTree-Tests');
                group: 'TravisCI' with: #('Tests') ].
    spec
        for: #'pharo'
        do: [
            spec baseline: 'FileTree' with: [ 
                spec repository: 'github://dalehenrich/filetree:pharo1.3/repository' ] ].
    spec
        for: #'squeak'
        do: [
            spec baseline: 'FileTree' with: [ 
                spec repository: 'github://dalehenrich/filetree:squeak4.3/repository' ] ].
    spec
        for: #'gemstone'
        do: [
            spec baseline: 'FileTree' with: [ 
                spec repository: 'github://dalehenrich/filetree:gemstone2.4/repository' ] ].
