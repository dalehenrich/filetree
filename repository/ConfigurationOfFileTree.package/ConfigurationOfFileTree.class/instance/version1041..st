versions
version1041: spec
  <version: '1.0.4.1' imports: #('1.0.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: '- checkpoint working on PHaro3.0 port'.
      spec author: 'dkh'.
      spec timestamp: '7/22/2013 23:03' ].
  spec
    for: #'pharo1.1.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo11-dkh.101';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14' ].
  spec
    for: #'pharo1.2.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo11-dkh.101';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14' ].
  spec
    for: #'pharo1.3.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo13-dkh.99';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo13-dkh.12' ].
  spec
    for: #'pharo1.4.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo14-dkh.99';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo14-dkh.12' ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo20-dkh.134';
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-dkh.17';
        package: 'MonticelloFileTree-Git'
          with: 'MonticelloFileTree-Git.pharo20-dkh.42' ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo30-dkh.143';
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: 'MonticelloFileTree-FileSystem-Utilities.pharo30-dkh.27' ].
  spec
    for: #'squeak'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.squeak43-dkh.132';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.squeak43-dkh.12' ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'GsCore' with: '0.246';
        project: 'Monticello' with: '0.243'.
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.gemstone24-dkh.147';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.gemstone24-dkh.14' ]