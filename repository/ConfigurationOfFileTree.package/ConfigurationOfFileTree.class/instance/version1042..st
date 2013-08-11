versions
version1042: spec
  <version: '1.0.4.2' imports: #('1.0.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: '- trait support for pharo 2.0'.
      spec author: 'EstebanLorenzano'.
      spec timestamp: '9/08/2013 13:23' ].
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
          with: 'MonticelloFileTree-Core.pharo20-EstebanLorenzano.137';
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-EstebanLorenzano.19';
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