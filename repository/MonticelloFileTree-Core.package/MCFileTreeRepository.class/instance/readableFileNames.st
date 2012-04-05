private
readableFileNames
	"Answer an Array of MCVersionNames representing every file in this repository; first the ones from the cache (whether or not they still exist in the repository) followed by every other file in this repository that Monticello can read."
	| all cached new |
	all := self allFileNamesOrCache.	"from repository"
	cached := self cachedFileNames.	"in memory"
	"Create a sparse Set, so we can avoid #= for MCVersionNames during the difference calculation."
	new := all difference: (
		(Set new: (cached size * 8 min: all size))
			addAll: cached;
			yourself).
	^ (cached asArray, new)