writing
writeVersionInfo: aVersionInfo

	self fileStream addString: (self versionId: aVersionInfo) at: 'version'.
	self writeAllInfos: (self flattenVersionInfos: aVersionInfo) to: self class versionDirName