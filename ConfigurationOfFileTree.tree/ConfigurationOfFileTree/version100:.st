
!ConfigurationOfFileTree methodsFor: 'versions'!
version100: spec
	<version: '1.0' imports: #('1.0-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
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
- repair package history'.
			spec author: 'dkh'.
			spec timestamp: '2/7/2012 18:43'.
			spec package: 'MonticelloFileTree-Core' with: 'MonticelloFileTree-Core-dkh.21' ].
	spec
		for: #gemstone
		do: [ spec package: 'MonticelloFileTree-GemStone-Extensions' with: 'MonticelloFileTree-GemStone-Extensions-revelations.11' ]! !
