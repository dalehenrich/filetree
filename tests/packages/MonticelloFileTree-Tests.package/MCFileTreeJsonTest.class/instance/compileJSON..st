private
compileJSON: aJsonString

	^(Compiler new eval: '(', aJsonString , ')')
