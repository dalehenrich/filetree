
!ChangeList class methodsFor: '*monticellofiletree-gemstone-extensions' stamp: 'revelations 11/04/2011 15:50'!
parseSelector: methodString
	"
	ChangeList parseSelector: 'test'.
	ChangeList parseSelector: 'test2'.
	ChangeList parseSelector: 'test: arg1'.
	ChangeList parseSelector: 'test: arg1 test: arg2'.
	ChangeList parseSelector: '<= other
		4 < 5'.
	ChangeList parseSelector: '* other
		self / other'.
	ChangeList parseSelector: '//'.
	ChangeList parseSelector: 'test
		x := 1
		^x'.
	ChangeList parseSelector: 'test: arg1
		| x |
		x := 1
		^x'.
	ChangeList parseSelector: 'test: arg1 test: arg2
		<primitive: 617 >
		^nil'.
	ChangeList parseSelector: 'test: arg1 test: arg2
		""test""
		<primitive: 617 >
		^nil'.
	ChangeList parseSelector: 'test: arg1arg
		""test""
		<primitive: 617 >
		^nil'.	
	ChangeList parseSelector: 'renderListItem: html callbackEdit: block1 callbackRemove: block2 index: rowIndex 
	html tableRow
		backgroundColourStyleForRowNumber: rowIndex;
		with: 
			[ html tableData: 
				[ html anchor
					callback: block1;
					with: identifier ].
			html tableData: 
				[ html anchor
					callback: block2;
					id: rowIndex asString;
					with: ''Remove'' ] ]'
	"

	| str token selector c done tokens |
	str := ReadStream on: methodString.
	tokens := ReadStream on: (Scanner new scanTokens: str nextLine).
	selector := WriteStream on: String new.
	[ tokens atEnd ] whileFalse: [
		selector nextPutAll: tokens next.
		tokens atEnd ifFalse: [tokens next]].
	^selector contents
! !
