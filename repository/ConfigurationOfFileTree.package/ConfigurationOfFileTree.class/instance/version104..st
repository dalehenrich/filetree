versions
version104: spec
  <version: '1.0.4' imports: #('1.0.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec description: '- fix Issue #66: Pharo install instructions incorrect
  https://github.com/dalehenrich/filetree/issues/66
- fix Issue #82: Sqeak4.5 builds failing....
  https://github.com/dalehenrich/filetree/issues/82
- fix Issue #83: Don''t override Monticello methods
  https://github.com/dalehenrich/filetree/issues/83
- fix Issue #86: update config to use seaside.gemtalksystems.com and ss3.gemtalksystems.com
  https://github.com/dalehenrich/filetree/issues/86
- fix Issue #87: Ston changes
  https://github.com/dalehenrich/filetree/issues/87
- fix Issue #88: Gitfiletree
  https://github.com/dalehenrich/filetree/issues/88
- fix Issue #90: provide option to create `.ston` property files
  https://github.com/dalehenrich/filetree/issues/90
- fix Issue #91: Git repository tests failing with Issue #90 bugfix
  https://github.com/dalehenrich/filetree/issues/91
'.
      spec author: 'dkh'.
      spec timestamp: '7/10/2013 11:30' ].
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