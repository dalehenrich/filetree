private
loadVersionsInDir: aDirectory

    ^ (aDirectory entries select: [:entry | self isVersionFile: entry])
        inject: Dictionary new 
        into: [:dict :entry | |subDict |
            self fileUtils readStreamFor: entry name in: aDirectory do: [ :fileStream | 
                subDict := self associate: (self scanner scan: fileStream) ].
            dict
                at: (subDict at: #id) put: subDict;
                yourself].