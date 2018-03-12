initialize-release
from: aLineAsString
	"<mode> SP <type> SP <object> TAB <file>"

	(Character tab split: aLineAsString)
		in: [ :anArray | 
			(Character space split: anArray first)
				in: [ :anInsideArray | 
					mode := anInsideArray first.
					type := anInsideArray second.
					object := anInsideArray third ].
			file := anArray second ]