as yet unclassified
allFileNames
    Transcript
        cr;
        show: 'packageExtension' , self packageExtension printString.
    ^ (self directory entries
        select: [ :entry | 
            Transcript
                cr;
                show: 'select-> ' , entry name printString.
            entry isDirectory and: [ self canReadFileNamed: entry name ] ])
        collect: [ :entry | 
            Transcript
                cr;
                show: 'collect-> ' , entry name printString.
            entry name ]