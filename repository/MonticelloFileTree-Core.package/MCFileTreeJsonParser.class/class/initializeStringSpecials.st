private
initializeStringSpecials
	"Copied and adjusted from Squeak's Json class>>#initialize."

	| newEscapeArray newEscapeSet |
	newEscapeArray := Array new: 128.
	newEscapeSet := CharacterSet new.
	(0 to: 31), #(127) do: [ :each |
		newEscapeArray at: each + 1 put: '\u', (each printStringHex padded: #left to: 4 with: $0).
		newEscapeSet add: (Character value: each) ].
	{
		$" -> '\"'.
		$\ -> '\\'.
		"$/ -> '\/'." "disabled, this was just a hack in Squeak's JSON"
		Character backspace -> '\b'.
		Character lf -> '\n'.
		Character newPage -> '\f'.
		Character cr -> '\r'.
		Character tab -> '\t'.
	} do: [ :each |
		newEscapeArray at: each key asciiValue + 1 put: each value ].
	^ StringSpecials := newEscapeArray