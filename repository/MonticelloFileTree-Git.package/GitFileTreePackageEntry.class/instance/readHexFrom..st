private
readHexFrom: aString
	"Read hex values, one by one please! A git short commit is 7 characters long, and we want this all seven."

	| num |
	num := 0.
	aString
		do: [ :c | 
			| v |
			((v := c digitValue) between: 0 and: 15)
				ifFalse: [ self error: 'Not a hex value' ].
			num := (num << 4) + v ].
	^ num