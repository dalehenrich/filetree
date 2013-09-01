initialize-release
initialize

	super initialize.
	semaphore := Semaphore forMutualExclusion.