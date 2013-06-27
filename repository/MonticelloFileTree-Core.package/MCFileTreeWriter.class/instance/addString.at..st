writing
addString: string at: fileNameOrPath
    "fileNameOrPath may have one or two elements"

   self addString: string at: fileNameOrPath encodedTo: 'utf8'
