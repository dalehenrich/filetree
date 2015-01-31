validation
verifyCategory: categoryName matches: prefix
  "https://github.com/dalehenrich/filetree/issues/136"

  "copied from PackageInfo>>category:matches:"

  | prefixSize catSize |
  categoryName ifNil: [ ^ false ].
  catSize := categoryName size.
  prefixSize := prefix size.
  catSize < prefixSize
    ifTrue: [ ^ false ].
  (categoryName findString: prefix startingAt: 1 caseSensitive: false) = 1
    ifFalse: [ ^ false ].
  ^ (categoryName at: prefix size + 1 ifAbsent: [ ^ true ]) = $-