validation
validateClassCategory: categoryName for: className
  "https://github.com/dalehenrich/filetree/issues/136"

  "class category must match the package name ... guard against manual editing mistakes"

  | prefix |
  true
    ifTrue: [ 
      "https://github.com/GsDevKit/gsDevKitHome/issues/53: faulty filetree package validation logic"
      ^ self ].
  prefix := self packageNameFromPackageDirectory.
  (self verifyCategory: categoryName matches: prefix)
    ifTrue: [ ^ self ].
  self
    error:
      'Class category name ' , categoryName printString , ' for the class '
        , className printString , ' is inconsistent with the package name '
        , prefix printString