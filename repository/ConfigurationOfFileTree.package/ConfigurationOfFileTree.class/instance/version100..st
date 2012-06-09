versions
version100: spec
    <version: '1.0' imports: #('1.0-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec
                description:
                    '1.0 (dkh.2):
- change the description for FileTree repository to filetree:// to be consistent with other Metacello descriptions...
1.0 (dkh.3):
- missing methods needed to run in Pharo1.3 #13315
1.0 (dkh.4):
- fix Issue 13: Monticello branches not handled correctly
  https://github.com/finworks/smallsource/issues/13
1.0 (dkh.5):
- woops, real fix for Issue 13...
1.0 (dkh.6):
- merge MonticelloFileTree-dkh.58 and MonticelloFileTree-Core-revelations.13
- a little refactoring for Montigitto support
1.0 (dkh.8):
- patch for MCFileTreeReader>>addClassAndMethodDefinitionsFromDirectoryEntries:
- synch with http://ss3.gemstone.com/ss/FileTree
1.0 (dkh.9):
- repair package history
1.0 (dkh.10):
- version 0.2 of package structure
- metacello structure changed
- preserving package ancestry in filetree rep again
1.0 (dkh.12):
- reader and writer for new pkg structure
  https://gist.github.com/1892114/eceff40deb06926d13df1db2f1c13749ed96677f
1.0 (dkh.13):
- bad idea to use actualClass ... write .pkg structure without relying on classes ...
1.0 (dkh.14):
-switch default package extension to .pkg
1.0 (dkh.15):
- switch to Cypress structure and port to Squeak4.3 and Pharo1.3
1.0 (dkh.16):
- port to GemStone2.4
1.0 (dkh.17):
- fix gemstone load issue
1.0 (dkh.18):
- fix for Issue #24
  https://github.com/dalehenrich/filetree/issues/24
1.0 (dkh.19):
- port Issue #24 fix to GemStone
1.0 (dkh.21):
- partial fix for Issue #29'.
            spec author: 'dkh'.
            spec timestamp: '5/30/2012 17:10' ].
    spec
        for: #'pharo'
        do: [ spec package: 'MonticelloFileTree-Core' with: [ spec file: 'MonticelloFileTree-Core.pharo13-dkh.58' ] ].
    spec
        for: #'squeak'
        do: [ spec package: 'MonticelloFileTree-Core' with: [ spec file: 'MonticelloFileTree-Core.squeak43-dkh.59' ] ].
    spec
        for: #'gemstone'
        do: [ 
		spec 
			project: 'GsCore' with: '0.246';
			project: 'Monticello' with: '0.243'.
            spec package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core.gemstone24-dkh.88' ]