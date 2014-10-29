baselines
baseline103: spec
  <version: '1.0.3-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'http://ss3.gemtalksystems.com/ss/FileTree'.
      spec package: 'MonticelloFileTree-Core'.
      spec group: 'default' with: #('MonticelloFileTree-Core') ].
  spec
    for: #'pharo1.1.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.pharo11' ];
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileDirectory-Utilities.pharo11';
                requires: 'MonticelloFileTree-Core' ].
      spec
        group: 'default'
        with: #('MonticelloFileTree-FileDirectory-Utilities') ].
  spec
    for: #'pharo1.2.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.pharo11' ];
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileDirectory-Utilities.pharo11';
                requires: 'MonticelloFileTree-Core' ].
      spec
        group: 'default'
        with: #('MonticelloFileTree-FileDirectory-Utilities') ].
  spec
    for: #'pharo1.3.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.pharo13' ];
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileDirectory-Utilities.pharo13';
                requires: 'MonticelloFileTree-Core' ].
      spec
        group: 'default'
        with: #('MonticelloFileTree-FileDirectory-Utilities') ].
  spec
    for: #'pharo1.4.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.pharo14' ];
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileDirectory-Utilities.pharo14';
                requires: 'MonticelloFileTree-Core' ].
      spec
        group: 'default'
        with: #('MonticelloFileTree-FileDirectory-Utilities') ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.pharo20' ];
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileSystem-Utilities.pharo20';
                requires: 'MonticelloFileTree-Core' ];
        package: 'MonticelloFileTree-Git'
          with: [ 
              spec
                file: 'MonticelloFileTree-Git.pharo20';
                requires: #('MonticelloFileTree-Core') ];
        yourself.
      spec group: 'default' with: #('MonticelloFileTree-FileSystem-Utilities') ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.pharo30' ];
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileSystem-Utilities.pharo30';
                requires: 'MonticelloFileTree-Core' ];
        package: 'MonticelloFileTree-Git'
          with: [ 
              spec
                file: 'MonticelloFileTree-Git.pharo20';
                requires: #('MonticelloFileTree-Core') ];
        yourself.
      spec group: 'default' with: #('MonticelloFileTree-FileSystem-Utilities') ].
  spec
    for: #'squeak'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: [ spec file: 'MonticelloFileTree-Core.squeak43' ];
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileDirectory-Utilities.squeak43';
                requires: 'MonticelloFileTree-Core' ].
      spec
        group: 'default'
        with: #('MonticelloFileTree-FileDirectory-Utilities') ].
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
      spec
        package: 'MonticelloFileTree-Core'
          with: [ 
              spec
                file: 'MonticelloFileTree-Core.gemstone24';
                requires: #('GsCore' 'Monticello') ];
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: [ 
              spec
                file: 'MonticelloFileTree-FileDirectory-Utilities.gemstone24';
                requires: 'MonticelloFileTree-Core' ].
      spec
        group: 'default'
        with: #('MonticelloFileTree-FileDirectory-Utilities') ]