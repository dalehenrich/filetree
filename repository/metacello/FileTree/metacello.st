"Evaluate the following (with correct directory path) to produce metacello.json file:

  MetacelloFileTreeConstructor writeJsonFor:'/opt/git/filetree/repository/metacello/FileTree'
"
^MetacelloFileTreeConstructor extractMethodSectionsForSpecBlock: [:spec |
      "Baseline spec"
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
            spec package: 'MonticelloFileTree-GemStone-Extensions' with: [ spec requires: 'MonticelloFileTree-Core' ] ]
].
