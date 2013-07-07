versions
version1031: spec
  <version: '1.0.3.1' imports: #('1.0.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '- fix Issue #64 : FileTree should not override MCVersionInfo>>date and time
  https://github.com/dalehenrich/filetree/issues/64
- partial fix for Issue #87: Ston chages
  https://github.com/dalehenrich/filetree/pull/87'.
      spec author: 'dkh'.
      spec timestamp: '7/7/2013 08:57' ].
  spec
    for: #'pharo1.1.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo11-dkh.95';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14' ].
  spec
    for: #'pharo1.2.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo11-dkh.95';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo11-dkh.14' ].
  spec
    for: #'pharo1.3.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo13-dkh.93';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo13-dkh.12' ].
  spec
    for: #'pharo1.4.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo14-dkh.93';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.pharo14-dkh.12' ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo20-dkh.127';
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-dkh.17';
        package: 'MonticelloFileTree-Git'
          with: 'MonticelloFileTree-Git.pharo20-dkh.39' ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.pharo30-dkh.103';
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: 'MonticelloFileTree-FileSystem-Utilities.pharo30-dkh.24' ].
  spec
    for: #'squeak'
    do: [ 
      spec
        package: 'MonticelloFileTree-Core'
          with: 'MonticelloFileTree-Core.squeak43-dkh.96';
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
          with: 'MonticelloFileTree-Core.gemstone24-dkh.108';
        package: 'MonticelloFileTree-FileDirectory-Utilities'
          with: 'MonticelloFileTree-FileDirectory-Utilities.gemstone24-dkh.14' ]