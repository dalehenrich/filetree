utilities
extractDependencyInfoFor: packageName
  ^ self
    extractInfoFrom:
      (self
        parseMember:
          'dependencies' , self fileUtils pathNameDelimiter asString , packageName)