constants
specials
	| map |
	map := Dictionary new: 20.
	map
		at: $+ put: 'plus';
		at: $- put: 'minus';
		at: $= put: 'equals';
		at: $< put: 'less';
		at: $> put: 'more';
		at: $% put: 'percent';
		at: $& put: 'and';
		at: $| put: 'pipe';
		at: $* put: 'star';
		at: $/ put: 'slash';
		at: $\ put: 'backslash';
		at: $~ put: 'tilde';
		at: $? put: 'wat';
		at: $, put: 'comma';
		at: $@ put: 'at'.
	^ map