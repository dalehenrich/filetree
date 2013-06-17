versions
version102: spec
  <version: '1.0.2' imports: #('1.0.2-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: '- non UTF-8 data in monticello.meta/version file
  https://github.com/dalehenrich/filetree/issues/72
- Missing FileTreeUrl in Pharo
  https://github.com/dalehenrich/filetree/issues/74
- Gemstone 24 dev - Issue #72 fixes
  https://github.com/dalehenrich/filetree/issues/75
- In Pharo-2.0, MCVersionInfoWriter>>writeVersionInfo: pre-emptorily converts version message to latin-1
  https://github.com/dalehenrich/filetree/issues/76
- Add Pharo2.0 support
  https://github.com/dalehenrich/filetree/issues/81
- commit: 0d1f1dfc82919978db39e3021078b4b5acf551da'.
      spec author: 'dkh'.
      spec timestamp: '6/16/2013 19:24' ].
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
          with: 'MonticelloFileTree-Core.pharo20-dkh.109';
        package: 'MonticelloFileTree-FileSystem-Utilities'
          with: 'MonticelloFileTree-FileSystem-Utilities.pharo20-dkh.17';
        package: 'MonticelloFileTree-Git'
          with: 'MonticelloFileTree-Git.pharo20-dkh.24' ].
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
          with: 'MonticelloFileTree-Core.squeak43-dkh.92';
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