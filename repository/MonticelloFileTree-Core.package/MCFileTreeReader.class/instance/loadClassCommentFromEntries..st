loading
loadClassCommentFromEntries: entries
	| commentEntry rank |
	rank := 0.
	entries do: [ :entry |
		| entryRank |
		entryRank := self class commentFilenames indexOf: entry name.
		entryRank > rank
			ifTrue: [ rank := entryRank. commentEntry := entry ] ].
	^ commentEntry
		ifNotNil: [ commentEntry readStream contents withSqueakLineEndings ]
		ifNil: [ '' ]