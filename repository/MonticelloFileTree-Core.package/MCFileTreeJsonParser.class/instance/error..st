private
error: aString
	"Raise a parse error labelled aString."

	^ JSJsonSyntaxError signal: aString