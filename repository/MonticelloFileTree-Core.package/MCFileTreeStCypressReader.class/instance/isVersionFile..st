private
isVersionFile: entry
    entry size > 0 ifTrue: [
         ^ self isVersionFileName: entry name].
    ^ false