writing
writeAllInfos: someVersionInfos to: dir

	someVersionInfos do: [:info |
		self fileStream addString: (self basicVersionInfo: info) at: (self filenameForVersionInfo: info in: dir)]