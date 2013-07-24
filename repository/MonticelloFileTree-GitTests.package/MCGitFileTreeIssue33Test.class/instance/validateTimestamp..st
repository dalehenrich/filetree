private
validateTimestamp: timestamp
	| x y |
	Transcript
		show: 'validating timestamp: ';
		show: timestamp;
		cr.
	self assert: (y := (x := RGMethodDefinition realClass: (Smalltalk at: #CCC) selector: #printString) stamp) = timestamp.
	Transcript
		show: 'x stamp := ' , x stamp;
		cr.
	self assert: (x := RGMethodDefinition realClass: (Smalltalk at: #CCC) class selector: #token:) stamp = timestamp.
	Transcript
		show: 'x stamp := ' , x stamp;
		cr.
	self assert: (x := RGMethodDefinition realClass: Object selector: #aFiletreeCCCMethod) stamp = timestamp.
	Transcript
		show: 'x stamp := ' , x stamp;
		cr.
	self assert: (x := RGMethodDefinition realClass: Object class selector: #aFiletreeCCCClassMethod) stamp = timestamp.
	Transcript
		show: 'x stamp := ' , x stamp;
		cr